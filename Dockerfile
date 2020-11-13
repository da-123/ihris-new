FROM node:12.19.0-slim
ADD http://download.redis.io/redis-stable.tar.gz . 
RUN apt-get update && apt-get install build-essential -y --no-install-recommends   
RUN tar xvzf redis-stable.tar.gz && \
    cd redis-stable && \
    make && \
    mv src/redis-server /usr/bin/ && \
    cd .. && \
    rm -r redis-stable && \
    npm install -g concurrently && \
    npm install -g npm && \
    npm install -g fsh-sushi

WORKDIR /app

COPY . /app

RUN cd fsh
RUN sushi -s .
RUN ls
RUN pwd
RUN cd tools && npm install
#RUN npm install
#RUN node tools/load.js --server https://fhir.sandboxaddis.com/hapi-fhir-jpaserver/fhir/ /app/fsh/build/input/profiles/*
#RUN node tools/load.js --server https://fhir.sandboxaddis.com/hapi-fhir-jpaserver/fhir/ /app/fsh/build/input/examples/*
#RUN node tools/load.js --server https://fhir.sandboxaddis.com/hapi-fhir-jpaserver/fhir/ /app/fsh/build/input/extensions/*
#RUN node tools/load.js --server https://fhir.sandboxaddis.com/hapi-fhir-jpaserver/fhir/ /app/fsh/build/input/vocabulary/*
#RUN node tools/load.js --server https://fhir.sandboxaddis.com/hapi-fhir-jpaserver/fhir/ /app/fsh/build/input/resources/*
#RUN node tools/load.js --server https://fhir.sandboxaddis.com/hapi-fhir-jpaserver/fhir/ /app/resources/Person-ihris-user-*.json
#RUN node tools/load.js --server https://fhir.sandboxaddis.com/hapi-fhir-jpaserver/fhir/ /app/resources/Parameters-ihris-config.signed.json #Only change this file if there is a change to in in the update

RUN cp /app/ihris-backend/config/baseConfig.json.example /app/ihris-backend/config/baseConfig.json
RUN cd /app/ihris-backend && npm install

WORKDIR /app/ihris-backend

EXPOSE 3000

EXPOSE 6379

CMD concurrently "/usr/bin/redis-server --bind '0.0.0.0'" "sleep 5s; npm start" 
