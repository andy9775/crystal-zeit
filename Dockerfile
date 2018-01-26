FROM centos:7
MAINTAINER Andy Chrzaszcz <andy@digitalsharkstudios.com>

RUN curl https://dist.crystal-lang.org/rpm/setup.sh | bash
RUN yum -y install crystal openssl-devel

# create the out put directory
RUN mkdir /app

# build the app
WORKDIR /build
COPY . /build
RUN crystal build --release --no-debug --verbose --progress -o /app/zeit_crystal src/zeit_crystal.cr

# delete the build directory
WORKDIR /app
RUN rm -rf /build

# start
EXPOSE 3000
CMD ["./zeit_crystal"]
