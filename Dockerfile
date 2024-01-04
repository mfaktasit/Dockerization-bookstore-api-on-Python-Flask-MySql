FROM python:alpine
COPY . /code
WORKDIR /code
RUN  pip install -r requirements.txt
EXPOSE 80
COPY . .
CMD python ./bookstore-api.py