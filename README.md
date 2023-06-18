# sls_bcn_meetup_22_06_2023_localstack

This repository contains an example to experiment with [LocalStack](https://localstack.cloud/) and [Terraform](https://www.terraform.io/).

There are 5 files:

- [README.md](https://github.com/EduardBargues/sls_bcn_meetup_22_06_2023_localstack/blob/main/README.md): This same file containing instruction to reproduce the example.
- [lambda.js](https://github.com/EduardBargues/sls_bcn_meetup_22_06_2023_localstack/blob/main/lambda.js): Lambda code written in Javascript.
- [lambda.zip](https://github.com/EduardBargues/sls_bcn_meetup_22_06_2023_localstack/blob/main/lambda.zip): Lambda code packed as .zip file.
- [main.tf](https://github.com/EduardBargues/sls_bcn_meetup_22_06_2023_localstack/blob/main/main.tf): Terraform configuration to be used in this demo. It contains an Api gateway integrated with a Lambda. Also, it includes IAM roles and Log groups as secondary resources.
- [run.sh](https://github.com/EduardBargues/sls_bcn_meetup_22_06_2023_localstack/blob/main/run.sh): A bash script to be executed. It will trigger Terraform inside localstack, create the resources, test the Lambda function via the Api gateway, and report the Lambda's log group and log stream in case you want to see the generated logs inside localstack.

---

## Before starting!

To make this example work in your machine, you need to:

- [Install localstack](https://docs.localstack.cloud/getting-started/installation/). I recommend you to install the [LocalStack CLI](https://docs.localstack.cloud/getting-started/installation/#localstack-cli).
- [Install tflocal](https://github.com/localstack/terraform-local) by simply typing `pip install terraform-local` in your terminal.

---

## How to run the example

1. Open a terminal and clone this repository.

`git clone https://github.com/EduardBargues/sls_bcn_meetup_22_06_2023_localstack.git`

2. From your terminal, navigate to the newly created folder.

`cd sls_bcn_meetup_22_06_2023_localstack`

3. Start your localstack environment by typing in your termina.

`localstart start`

4. Open a new terminal in the same folder
5. Execute the `run.sh` script.

`./run.sh`

---

## Wanna see how it looks?

Check out 👉 [this video]() 👈 I made where I walk you through the example. Enjoy! 👏
