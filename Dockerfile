FROM gcr.io/cloud-builders/kubectl

LABEL version="1.0.0"
LABEL name="kubectl"
LABEL repository="http://github.com/luusluus/kubectl"
LABEL homepage="http://github.com/luusluus/kubectl"

LABEL maintainer="Lucien Martijn <lucienmartijn@gmail.com>"
LABEL com.github.actions.name="Kubernetes CLI - kubectl"
LABEL com.github.actions.description="Runs kubectl. The config can be provided with the secret KUBE_CONFIG_DATA."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="blue"

RUN curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/local/bin/aws-iam-authenticator

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
