# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/30 00:05:20 by bodysseu          #+#    #+#              #
#    Updated: 2020/09/02 18:50:12 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

# Installation of extensions
RUN			apk update && \
			apk upgrade && \
			apk  --update --no-cache add \
			php7 \
			php7-fpm php7-opcache php7-gd php7-mysqli \
			php7-zlib php7-curl php7-mbstring \
			php7-json php7-session

# Get archive
RUN			wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
RUN			tar -xf phpMyAdmin-4.9.5-all-languages.tar.gz && \
			rm -f phpMyAdmin-4.9.5-all-languages.tar.gz && \
			mv phpMyAdmin-4.9.5-all-languages /etc/phpmyadmin

EXPOSE		5000

COPY		entry.sh /tmp/

# Run server
ENTRYPOINT	["sh", "/tmp/entry.sh"]