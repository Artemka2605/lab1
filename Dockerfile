FROM ubuntu:latest

RUN apt update && \
    apt install -y bash

COPY laba.sh "/home/pavel/laba.sh"

RUN chmod +x "/home/pavel/laba.sh"

CMD ["/home/pavel/laba.sh"]

