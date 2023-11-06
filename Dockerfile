# Use the official Node.js image as the base image
FROM node:14 AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React application
RUN npm run build

# Use a lightweight web server to serve the production build
FROM nginx:alpine

# Copy the production build from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 for HTTP
EXPOSE 80

# Start the Nginx web server
CMD ["nginx", "-g", "daemon off;"]
