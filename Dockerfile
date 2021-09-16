FROM node:fermium

# Update the OS
RUN apt-get update && apt-get upgrade -y

# This will be the app directory
WORKDIR /usr/src/app

# Install global NPM dependencies
RUN npm install -g serve

# Copy over local package files
# COPY package.json .
# COPY package-lock.json .

# Install local NPM dependencies
# RUN npm ci --cache .npm --prefer-offline

# Copy over all source files
COPY . .

# Build the project
# RUN npm run build

EXPOSE 80
CMD [ "serve", "-s", "build", "-l", "tcp://0.0.0.0:80" ]
