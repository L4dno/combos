FROM ubuntu:16.04

RUN apt-get update && apt-get install -y cmake build-essential && \
    apt-get install -y wget

RUN apt-get update && apt-get install -y \
    libboost-dev \
    libboost-context-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-chrono-dev \
    libboost-serialization-dev

WORKDIR /app

RUN wget https://github.com/simgrid/simgrid/archive/refs/tags/v3_11.tar.gz && \
    tar xf v3_11.tar.gz && \
    cd simgrid-3_11

WORKDIR /app/simgrid-3_11

RUN cmake -DCMAKE_INSTALL_PREFIX=/opt/simgrid . && \
    make && \
    make install

WORKDIR /app/combos

COPY . .

RUN mkdir -p volume/ exp/

RUN sed -i 's/\r$//' generator clean run.sh && \
    chmod +x generator clean run.sh 

RUN make -C Files

# внешний код сам создает папку с инкрементным именем
# затем он копирует туда parameters.xml и сам его меняет

CMD ["bash", "run.sh"]


