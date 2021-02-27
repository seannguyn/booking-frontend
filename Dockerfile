# Base image
FROM node:15.9.0

# Specify a directory
# If this directory does not exist, it will be created.
# Command: RUN, CMD, ENTRYPOINT, COPY and ADD will be executed relative to this directory
WORKDIR /app 

# Install app dependendies
# A wildcard is used to ensure that both package.json AND package-lock.json are copied
COPY package*.json ./

RUN npm install

# If you are building your code for production
RUN npm ci --only=production

# Copy all the source code of the app
COPY . .

# React application default port is 3000
EXPOSE 3000
CMD ["npm", "start"]