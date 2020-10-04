# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/01 15:08:06 by bodysseu          #+#    #+#              #
#    Updated: 2020/09/01 19:16:07 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

# Installation: Get repository from Alpine linux testing package
RUN			apk update && \
			apk upgrade && \
			apk  --update --no-cache add \
			telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ 

# Start telegraf
ENTRYPOINT ["/usr/bin/telegraf"]