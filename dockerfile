# Init Image받기FROM ubuntu:20.04                                                                                     led-password --gecos '' sysadmin sudo# 시스템에 기본적으로 필요한 package 받기RUN apt-get update && apt-get install -y sudo git htop wget # 사용자 설정 및 sudo group에 추가RUN useradd -m sysadmin && echo "sysadmin:sysadmin" | chpasswd && adduser --disabled-password --gecos '' sysadmin sudo                                                    64.sh -O ~/miniconda.sh && \
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 
# ------------------ root권한 상태에서 해야할 것들 마무리 ------------------
 
# 사용자 전환 및 현재 workspace 전환
USER sysadmin
WORKDIR /home/sysadmin
 
# 현재 로컬에 있는 파일들 빌드 이미지로 복사
# COPY $(로컬 파일) $(빌드 이미지 path)
COPY test.txt /tmp/test.txt
