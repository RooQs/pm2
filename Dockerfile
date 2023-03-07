FROM node:lts-alpine
LABEL maintainer="RooQs <rooqs.main@qq.com>"

# setting timezone
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN apk del tzdata

# Install pm2
RUN npm install pm2 -g

# Install pm2-logrotate
RUN pm2 install pm2-logrotate

# Expose ports needed to use Keymetrics.io
EXPOSE 80 443 43554

# Start pm2.json process file
CMD ["pm2-runtime", "start", "pm2.json"]
