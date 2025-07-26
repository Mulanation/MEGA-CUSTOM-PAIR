FROM node:20-bullseye
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
USER node
RUN git clone https://mrfr8nk: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@github.com/mrfr8nk/MEGA-CUSTOM-PAIR.git /home/node/MEGA-CUSTOM-PAIR 
WORKDIR /home/node/MEGA-CUSTOM-PAIR
RUN chmod -R 777 /home/node/MEGA-CUSTOM-PAIR/
RUN yarn install --network-concurrency 1 --ignore-engines
EXPOSE 7860
ENV NODE_ENV=production
CMD ["npm", "start"]
