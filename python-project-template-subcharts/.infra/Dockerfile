FROM python:3.8-slim as base

# add requirements
COPY ./requirements/production.txt /app/production.txt
COPY ./requirements/develop.txt /app/develop.txt

WORKDIR /app

# install requirements
RUN export PIP_CONFIG_FILE=/app/pip.conf  \
 && pip install -r develop.txt

FROM base as app

WORKDIR /app

# add app
COPY ./ /app/

# run server
CMD python manage.py start
