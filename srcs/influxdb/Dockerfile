# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/31 18:19:48 by bodysseu          #+#    #+#              #
#    Updated: 2020/08/31 19:41:07 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

# Installation
RUN			apk update && \
			apk upgrade && \
			apk  --update --no-cache add \
			influxdb

EXPOSE		8086

# Start Influxd
ENTRYPOINT ["/usr/sbin/influxd"]