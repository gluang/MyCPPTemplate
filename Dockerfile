FROM ubuntu:latest

# ENV TIME_ZONE Asia/Shanghai
# RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
#     apt-get update && \
#     apt-get install -y tzdata && \
#     ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone && \
#     dpkg-reconfigure -f noninteractive tzdata && \
#     apt-get clean && \
#     rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH /usr/src/lib

WORKDIR /usr/src
COPY libs ./libs
COPY resources ./resources  
# 注意修改可执行文件名
COPY bin/main ./
# 注意修改可执行文件名
ENTRYPOINT [ "./main" ]
