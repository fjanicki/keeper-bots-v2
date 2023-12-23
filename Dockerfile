FROM node:18
RUN apt-get install git
ENV NODE_ENV=production

WORKDIR /app

COPY package.json ./

RUN yarn install --frozen-lockfile
COPY . .
RUN yarn build
RUN yarn install --production --frozen-lockfile

EXPOSE 9464

CMD [ "yarn", "start" ]
