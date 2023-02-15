
FROM node:16-alpine as builder

RUN mkdir /app

# Copying Application file 
COPY .  /app

WORKDIR /app

# Install npm dependencies.
RUN npm install

# 
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# Build the app
RUN npm run build

# Bundle static assets with nginx
FROM nginx:1.21.0-alpine 

# COPY react.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html/

RUN rm -rf ./*

# Copy built assets from `builder` image
COPY --from=builder /app/build/  .

EXPOSE 3000 80

CMD ["nginx", "-g", "daemon off;"]




