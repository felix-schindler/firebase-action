FROM node:lts-alpine

LABEL version="130.16.0-beta1"
LABEL repository="https://github.com/felix-schindler/firebase-action"
LABEL homepage="https://github.com/felix-schindler/firebase-action"
LABEL maintainer="Felix Schindler"

LABEL com.github.actions.name="GitHub Action for Firebase"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN apt update && apt install --no-install-recommends -y jq openjdk-17-jre-headless && rm -rf /var/lib/apt/lists/*

RUN npm i -g npm@latest && npm cache clean --force
RUN npm i -g firebase-tools@13.16.0 && npm cache clean --force

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
