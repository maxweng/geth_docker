FROM mhart/alpine-node

WORKDIR /geth
ADD . /geth/

RUN npm install -g pm2

ENTRYPOINT ["/bin/ash"]
CMD ["/geth/start.sh"]

EXPOSE 8545
EXPOSE 30303