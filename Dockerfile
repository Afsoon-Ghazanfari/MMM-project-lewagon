FROM python:3.10.6-buster

WORKDIR /prod

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY mmmproject mmmproject
COPY pipelines pipelines
COPY setup.py setup.py
RUN pip install .

CMD uvicorn mmmproject.api.main:app --host 0.0.0.0 --port $PORT
