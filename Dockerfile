FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY package*.json /app/

RUN npm install



EXPOSE 3080

CMD [ "npm", "start" ]
