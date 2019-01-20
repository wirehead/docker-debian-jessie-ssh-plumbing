FROM debian:stretch

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends openssh-client unzip curl wget git ca-certificates && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    cd .. && \
    rm -rf rclone-*-linux-amd64* 

RUN groupadd -r dock && useradd -r -g dock dock && mkdir -p /home/dock && chown dock:dock /home/dock

USER dock

WORKDIR /home/dock
RUN mkdir -p /home/dock/.ssh && chmod 700 /home/dock/.ssh
