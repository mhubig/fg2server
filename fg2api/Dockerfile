FROM python:3.5

RUN mkdir -p /usr/src/fg2api
ENV HOME /usr/src/fg2api
WORKDIR /usr/src/fg2api

COPY requirements.txt /usr/src/fg2api/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/fg2api/

CMD [ "python", "api.py" ]
