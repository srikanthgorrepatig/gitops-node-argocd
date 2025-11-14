FROM node:18-alpine

WORKDIR /app

# Copy package.json (no lock file needed)
COPY package.json ./

# Install production dependencies
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
