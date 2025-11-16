# 1. Build dependencies with alpine image
FROM node:18-alpine AS build
WORKDIR /app

# Copy only package.json (you do NOT have package-lock.json)
COPY package.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy application source
COPY . .

# 2. Then run in distroless image (much smaller)
FROM gcr.io/distroless/nodejs18

WORKDIR /app
COPY --from=build /app .

EXPOSE 3000
CMD ["index.js"]
