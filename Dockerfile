FROM debian:jessie

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends openssh-client && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd -r dock && useradd -r -g dock dock && mkdir -p /home/dock && chown dock:dock /home/dock

USER dock

WORKDIR /home/dock
RUN mkdir -p /home/dock/.ssh && chmod 700 /home/dock/.ssh
