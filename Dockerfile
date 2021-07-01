# init a base image (Alpine is small Linux distro)
#FROM python:3.6.1-alpine
FROM registry.access.redhat.com/ubi8/python-38
#FROM centos/python-36-centos7

USER root

#RUN yum install -y udunits2-devel python3-mod_wsgi
#RUN yum -y install make git m4 zlib-devel redis
RUN yum -y update
RUN yum -y install python3-mod_wsgi
RUN yum -y update --security

#RUN yum -y groupinstall "Development Tools"

# run pip to install the dependencies of the flask app

#---
# Install Python modules
#COPY requirements.txt /tmp/
#COPY udunits-2.2.28.tar.gz /tmp/
#COPY netcdf-c-4.7.4.tar.gz /tmp/

#WORKDIR /tmp



# define the present working directory
WORKDIR /docker-flask-test
# copy the contents into the working dir
ADD . /docker-flask-test

RUN pip install --upgrade pip

RUN pip install -r requirements.txt



#RUN yum install -y python38-mod_wsgi

# Necessary for netCDF4 Python module install


#ENV C_INCLUDE_PATH=/usr/include/udunits2/:$C_INCLUDE_PATH




#RUN usermod -u 1000 apache





# define the command to start the container
CMD ["python","app.py"]

