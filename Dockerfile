FROM node:fermium

# Update the OS
RUN apt-get update && apt-get upgrade -y

# This will be the app directory
WORKDIR /usr/src/app

# Copy over all source files
COPY . /usr/src/app

# Install NPM dependencies
RUN npm ci --cache .npm --prefer-offline

# Install global NPM dependencies
RUN npm install -g serve

# Build the project (will be run when we have more resources; using local build)
# RUN npm run build

EXPOSE 80
CMD [ "serve", "-s", "build", "-l", "80" ]
