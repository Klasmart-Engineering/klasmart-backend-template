################################################################################
# Base stage
################################################################################
FROM node:16 AS base

RUN  apt-get -yq update && \
     apt-get -yqq install ssh

RUN apt-get -yqq install nodejs
RUN apt-get -yq install npm
RUN apt -yq install python3-venv python3-pip

# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan bitbucket.org > /root/.ssh/known_hosts

################################################################################
# Builder stage
################################################################################
FROM base as builder
WORKDIR /usr/src/app

COPY ./package*.json .
RUN --mount=type=ssh npm ci
COPY ./config.json .
COPY ./index.js .
# COPY ./default.conf .
RUN npm run build
RUN echo ls

################################################################################
# DEPLOY stage
################################################################################
FROM base as deployer
WORKDIR /usr/src/app
COPY ./package*.json ./
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/dist ./dist
ENV PORT={{cookiecutter.port}}
EXPOSE {{cookiecutter.port}}
CMD [ "npm", "start" ]