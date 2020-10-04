# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/30 17:25:38 by bodysseu          #+#    #+#              #
#    Updated: 2020/09/02 18:42:29 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

# Installation of extensions
RUN			apk update && \
			apk upgrade && \
			apk  --update --no-cache add \
			mysql-client php7 \
			php7-fpm php7-opcache php7-gd php7-mysqli \
			php7-zlib php7-curl php7-mbstring \
			php7-json php7-session

# Get archive
RUN 		wget https://wordpress.org/latest.tar.gz
RUN			tar -xzf latest.tar.gz && \
			rm -f latest.tar.gz && \
			mv wordpress /etc/

# Move configs
COPY		wordpress.sql /tmp/
COPY		entry.sh /tmp/

EXPOSE		5050

# Run server
ENTRYPOINT	["sh", "/tmp/entry.sh"]