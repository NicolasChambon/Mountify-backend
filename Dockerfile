# Use the official node 
# image as a parent image
FROM node:20

# Define the working directory
# inside the container
WORKDIR /app

# Copy the package.json file 
# from the host to the container 
# in the working directory
COPY package.json .

# Install the dependencies
# inside the container
RUN npm install

# Copy the rest of the application
# code from the host to the container
# in the working directory
COPY . .

# Expose the port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]