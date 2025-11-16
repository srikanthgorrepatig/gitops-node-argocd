FROM node:18-alpine

WORKDIR /app

COPY package.json ./

# npm install instead of npm ci (because you have no package-lock.json)
RUN npm install --only=production

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
