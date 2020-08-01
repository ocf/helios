FROM python:2.7-slim-buster

RUN apt-get -y update && apt-get -y install git postgresql postgresql-contrib libpq-dev
RUN mkdir /helios
RUN git clone https://github.com/benadida/helios-server.git /helios

WORKDIR /helios
RUN git checkout 15cfd7c5f062b0d3f60a195b3156390af1447839
RUN pip install -r requirements.txt
CMD ["python", "manage.py", "runserver"]
