FROM centos:7

WORKDIR /selenium

ADD selenium-server-standalone-3.9.0.jar /selenium/
ADD chromedriver /selenium

RUN yum update -y
#install NODE
RUN yum install epel-release -y && \
    curl --silent --location https://rpm.nodesource.com/setup_10.x | bash - && \
    yum install -y nodejs


#install chrome stable
ADD google-chrome.repo /etc/yum.repos.d
RUN yum info google-chrome-stable && \
    yum install google-chrome-stable -y

#install JRE
RUN yum install java-1.8.0-openjdk -y

#install PM2
RUN npm install pm2 --global