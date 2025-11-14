FROM node:18-alpine

WORKDIR /app

COPY package.json ./

# Install production dependencies
RUN npm install --only=production

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
