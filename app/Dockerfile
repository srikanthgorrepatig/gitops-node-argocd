FROM node:18-alpine

WORKDIR /app

COPY package.json ./

# No dependencies, so use npm install
RUN npm install --only=production || true

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
