FROM node:18-alpine AS dependencies
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm ci --only=production

COPY index.js /app/
EXPOSE 3000
CMD ["node", "index.js"]
