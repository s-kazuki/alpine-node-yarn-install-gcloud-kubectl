FROM skazuki/alpine-node:16

LABEL maintainer="S-Kazuki<contact@revoneo.com>"

ENV APP_ROOT=/node
ENV GCP_ACCOUNT=example@example-project.iam.gserviceaccount.com
ENV GCP_KEY_FILE=example_gcp_key.json
ENV GCP_KEY_PATH=$APP_ROOT/$GCP_KEY_FILE
ENV GCP_PROJECT=example_project_id
ENV PATH=$PATH:/root/google-cloud-sdk/bin

WORKDIR $APP_ROOT

RUN apk -Uuv add bash curl python3 \
&& curl -sSL https://sdk.cloud.google.com | bash \
&& gcloud components install kubectl \
&& apk del bash curl \
&& rm /var/cache/apk/*

ONBUILD COPY package.json ${APP_ROOT}/
ONBUILD COPY yarn.lock ${APP_ROOT}/
ONBUILD COPY ${GCP_KEY_FILE} ${GCP_KEY_PATH}

ONBUILD RUN yarn install --frozen-lockfile --ignore-optional \
&& gcloud auth activate-service-account ${GCP_ACCOUNT} --key-file=${GCP_KEY_PATH} --project ${GCP_PROJECT}
CMD ["yarn", "start"]
