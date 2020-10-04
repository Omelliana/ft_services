# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/28 13:52:31 by bodysseu          #+#    #+#              #
#    Updated: 2020/09/02 21:14:43 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

# Installation
RUN			apk update && \
			apk upgrade && \
			apk  --update --no-cache add \
			openssl \
			openrc \
			vsftpd

# Move config
COPY 		ftps.sh /tmp/

# Create ssl key
RUN			openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
			-out /etc/ssl/certs/vsftpd.pem \
			-keyout /etc/ssl/private/vsftpd.key \
			-subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=bodysseu/CN=FTPS"

# Get group for vsftpd
VOLUME		[ "/sys/fs/cgroup" ]

# Create user
# -D		Don't assign a password
RUN			adduser -D admin
RUN			echo "admin:admin" | chpasswd

RUN			chmod +x /tmp/ftps.sh

EXPOSE		20 21 21100

ENTRYPOINT [ "/tmp/ftps.sh" ]