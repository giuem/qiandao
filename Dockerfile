FROM python:2.7-alpine

MAINTAINER giuem <i@giuem.com>

RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main' > /etc/apk/repositories && \
    apk update && \
    apk add bash autoconf g++ && \
    mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    apk del g++ autoconf && \
    rm .git -rf

ENV PORT 80
EXPOSE $PORT/tcp

VOLUME ["/usr/src/app/"]

CMD ["python","/usr/src/app/run.py"]
