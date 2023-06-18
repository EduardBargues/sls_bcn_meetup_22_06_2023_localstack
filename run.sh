#!/usr/bin/env sh

# DELETING PREVIOUS FILES TO START CLEAN
log_groups_file="log_groups.json"
log_streams_file="log_streams.json"
log_events_file="log_events.json"
apis_file="rest_apis.json"
rm -rf "$log_groups_file" "$log_streams_file" "$log_events_file" "$apis_file"

# TERRAFORM STUFF
tflocal init; tflocal apply --auto-approve

# TRIGGERING THE APIGATEWAY TEST AGAINST OUR LAMBDA
aws apigateway --endpoint-url=http://localhost:4566 \
    get-rest-apis >> "$apis_file"
rest_api_id=$(jq -r ".items[0].id" "$apis_file")
response_from_lambda=$(curl -X POST "$rest_api_id.execute-api.localhost.localstack.cloud:4566/local/test")

# GET OUR LAMBDA LOG GROUP
aws logs --endpoint-url=http://localhost:4566 \
    describe-log-groups >> "$log_groups_file"
log_group_name=$(jq -r '.logGroups[0].logGroupName' "$log_groups_file")

# GET LOG STREAM
aws logs --endpoint-url=http://localhost:4566 \
    describe-log-streams \
    --log-group-name "$log_group_name" >> "$log_streams_file"
log_stream_name=$(jq -r '.logStreams[0].logStreamName' "$log_streams_file")
log_stream_name=$(echo "$log_stream_name" | sed 's/\$/\\$/g')

echo ""
echo "--RESULTS:"
echo "  response_from_lambda: $response_from_lambda"
echo "  log_group_name: $log_group_name"
echo "  log_stream_name: $log_stream_name"
echo ""

# EXECUTE THIS TO SEE LOG EVENTS FROM THE LAMBDA
# aws logs --endpoint-url=http://localhost:4566 \
#     get-log-events \
#     --log-group-name "$log_group_name" \
#     --log-stream-name "$log_stream_name" >> "$log_events_file"