FROM public.ecr.aws/docker/library/python:3.11-slim

WORKDIR /app

COPY ./requirements/common.txt ./requirements/
RUN pip install --no-cache-dir -r ./requirements/common.txt

COPY main.py /app
COPY ./src /app/src
COPY ./ai/model/model.pkl /app/src
COPY ./ai/model/vectorizer.pkl /app/src

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--reload"]

EXPOSE 8000
