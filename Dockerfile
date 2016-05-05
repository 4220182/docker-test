FROM busybox
MAINTAINER 4220182 <4220182@qq.com>
ENV foo /bar
ENV foo2 /foo2
RUN mkdir ${foo}
COPY config.txt /config.txt
COPY start.sh /usr/bin/start
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD start
