FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5173


FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

ENV JWT_SECRET=YOUR_SECRET_TEXT \
    SALT=12 \
    MONGO_URL=mongodb://mongodb:27017/food_delivery \
    STRIPE_SECRET_KEY=YOUR_KEY

FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

