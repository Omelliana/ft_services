# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/23 20:29:58 by bodysseu          #+#    #+#              #
#    Updated: 2020/09/03 20:57:09 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

# Installation
RUN			apk update && \
			apk upgrade && \
			apk  --update --no-cache add \
			nginx \
			openssl \
			openssh

# Move configs
COPY		default.conf /etc/nginx/conf.d/
COPY		index.html /var/www/localhost/htdocs/index.html
COPY		nginx.sh /tmp/

# Create ssl key
RUN			openssl req -newkey rsa:2048 -x509 -days 365 -nodes \
			-out /etc/ssl/nginx.crt \
			-keyout /etc/ssl/nginx.key \
			-subj "/C=RU/ST=Moscow/L=Moscow/O=21/OU=bodysseu/CN=nginx"

EXPOSE		22 80 443

# Run configuration
ENTRYPOINT	["sh", "/tmp/nginx.sh"]
