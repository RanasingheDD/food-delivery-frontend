FROM node:22-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

RUN npm install --save-dev nodemon

COPY . .

EXPOSE 4000


ENV JWT_SECRET=YOUR_SECRET_TEXT \
    SALT=12 \
    MONGO_URL=mongodb://mongodb:27017/food_delivery \
    STRIPE_SECRET_KEY=YOUR_KEY

CMD ["npm", "start"]