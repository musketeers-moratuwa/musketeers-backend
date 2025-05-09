# Dockerfile for Node.js application

# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Arguments that can be passed during build time
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
ARG PORT=8081
ENV PORT=${PORT}

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY musketeers-backend/package*.json ./

# Install dependencies
RUN npm install

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY musketeers-backend/ ./

# Expose the port the app runs on
EXPOSE ${PORT}

# Define the command to run the app
CMD [ "npm", "run", "dev" ]
