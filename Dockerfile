FROM ubuntu

RUN terraform init
RUN terraform plan --autoapprove
RUN terraform apply --autoapprove
