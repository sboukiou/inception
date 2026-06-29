FROM debian:bullseye

RUN apt-get update -yqq && apt-get upgrade -yqq && \
	apt-get install --no-install-recommends -yqq vsftpd && \
	rm -rf /var/lib/apt/lists/*	

EXPOSE 21 21100-21110

COPY ./config/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/setup.sh /usr/local/bin/setup.sh

RUN mkdir -p /var/run/vsftpd/empty

RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]
CMD ["vsftpd", "/etc/vsftpd.conf"]
