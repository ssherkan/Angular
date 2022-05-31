FROM node:16.14.2-alpine AS builder
WORKDIR /angular-frontend
COPY . .
RUN npm i
RUN npm run ng build --prod

FROM nginx:1.15.8-alpine

COPY --from=builder /angular-frontend/dist/angular-frontend/ /usr/share/nginx/html
