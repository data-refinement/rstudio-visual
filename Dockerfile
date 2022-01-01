FROM rocker/rstudio:latest
LABEL maintainer="Yusuke Saito <ysaito8015@gmail.com>"

# updata
RUN apt-get update && apt-get -y upgrade

# libpnd-dev, for vdiffr
# libcairo2-dev, libxt-dev for Cairo package
# libxml2-dev, for tidyverse
RUN apt-get install -y build-essential \
  libpng-dev \
	libcairo2-dev \
  libxt-dev \
  libxml2-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# copy dataset

# install R packages
COPY install_packages.R install_packages.R
RUN ["r", "install_packages.R"]
