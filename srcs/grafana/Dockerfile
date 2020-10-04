# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bodysseu <bodysseu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/01 19:10:19 by bodysseu          #+#    #+#              #
#    Updated: 2020/09/03 22:31:43 by bodysseu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		alpine:latest
LABEL		maintainer="Brittaney Odysseus <bodysseu@student.42.fr>"

# Installation: Get repository from Alpine linux testing package
RUN			apk update && \
			apk upgrade && \
			apk  --update --no-cache add \
			grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ 

COPY		Provisioning/datasource.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY		Provisioning/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/

COPY		dashboards/main	/var/lib/grafana/dashboards/
COPY		dashboards/home.json /usr/share/grafana/public/dashboards

EXPOSE		3000

# Start Grafana
ENTRYPOINT ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini"]