FROM 	debian:jessie
MAINTAINER Fabio Nitto "fabio.nitto@gmail.com"

RUN apt-get update && apt-get -y install \
	bison \
	build-essential \
	cmake \
	doxygen \
	flex \
	gcc-mingw-w64 \
	heimdal-dev \
	heimdal-multidev \
	libfreeradius-client2 \
	libgcrypt11-dev \
	libglib2.0-dev \
	libgnutls28-dev \
	libgpgme11-dev \
	libhiredis-dev \
	libksba-dev \
	libldap2-dev \
	libpcap0.8-dev \
	libpopt-dev \
	libsnmp-dev \
	libssh-dev \
	perl-base \
	pkg-config \
	uuid-dev \
	wget \
	xmltoman && \
	apt-get clean 

RUN mkdir /src && \
	cd /src && \
	wget http://wald.intevation.org/frs/download.php/1975/openvas-smb-1.0.1.tar.gz -O openvas-smb.tar.gz && \
	wget http://wald.intevation.org/frs/download.php/2262/openvas-libraries-8.0.6.tar.gz -O openvas-libraries.tar.gz && \
	tar xvzf openvas-smb.tar.gz && \
	tar xvzf openvas-libraries.tar.gz && \
	cd /src/openvas-smb-* && \
	mkdir build && \
	cd build && \
	cmake .. && \
	make && \
	make install && \
	make rebuild_cache && \
	cd /src/openvas-libraries-* && \
	mkdir build && \
	cd build && \
	cmake .. && \
	make && \
	make install && \
	make rebuild_cache && \
	cd / && \
	rm -rf /src 
