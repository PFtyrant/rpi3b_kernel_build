FROM debian:buster
MAINTAINER PFtyrant

RUN apt-get update && apt-get install -y \
    bc \
    bison \
    flex \
    libssl-dev \
    make \
    git-core \
    crossbuild-essential-armhf \
    crossbuild-essential-arm64 \    
    ncurses-dev \
    libc6-dev \
    libncurses5-dev \
    kmod
# COPY build_rpi_kernel.sh /root/test/
# COPY install_rpi_kernel_img.sh /root/test

# ENTRYPOINT ["tail"]
# CMD ["/dev/null"]