# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/29 17:57:55 by bodysseu          #+#    #+#              #
#    Updated: 2020/08/31 21:25:10 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

# Installation
RUN			apk update && \
			apk upgrade && \
			apk  --update --no-cache add \
			mysql \
			mysql-client

# Create folder
RUN			mkdir -p /run/mysqld

# Move MySQL config
COPY 		mysql-start.sh /tmp/

# Database folder
VOLUME		["/var/lib/mysql"]

EXPOSE		3306

ENTRYPOINT ["sh", "/tmp/mysql-start.sh"]