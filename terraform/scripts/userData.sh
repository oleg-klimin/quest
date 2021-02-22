#!/bin/bash
sudo yum install docker -y && sudo systemctl enable docker && sudo systemctl start docker
cat << EOF > /home/ec2-user/Dockerfile
FROM node:10
RUN git clone https://github.com/rearc/quest.git
WORKDIR /quest
RUN npm install
WORKDIR /quest
CMD ["npm", "start"]

EOF
sudo docker build -t quest:latest - < /home/ec2-user/Dockerfile
sudo docker run -d --env SECRET_WORD=TwelveFactor -p 80:3000 quest:latest
