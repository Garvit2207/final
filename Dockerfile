FROM python:3.9-slim-buster

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /app
ADD . /app
RUN pip install virtualenv
RUN virtualenv flask
RUN source flask/bin/activate
RUN pip install -r requirements.txt
RUN ifconfig

EXPOSE 5000

CMD ["python", "main.py", "--port=5000"]
