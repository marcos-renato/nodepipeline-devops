FROM node:12


RUN apt-get update && apt-get install git -y && apt-get install imagemagick -y && apt-get clean;


WORKDIR /ecs-app

COPY package*.json ./
COPY . .

RUN npm install
RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true

# Adicione o rótulo 'Name' ao seu Dockerfile
LABEL Name="NODEPIPELINE-DEVOPS"
# Adicione o rótulo 'Version' ao seu Dockerfile
LABEL Version="1.0"

USER root
EXPOSE 80

ENTRYPOINT ["npm", "start"]

CMD ["node", "server.js"]
