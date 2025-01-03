# Build the production code
FROM node:23.5.0-bookworm-slim as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
# this will build to /app/build

# Build the production environment
FROM nginx:1.27.3-alpine-slim
COPY --from=builder /app/build /usr/share/nginx/html