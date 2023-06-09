FROM node:18.15.0

 RUN apt-get update
 RUN apt-get install git -y
 RUN apt-get install imagemagick -y

#RUN apt-get update && apt-get install git -y && apt-get install imagemagick -y

WORKDIR /ecs-app

COPY package*.json ./
COPY . .

RUN npm install
RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
USER root
EXPOSE 80

ENTRYPOINT ["npm", "start"]
