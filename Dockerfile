FROM python:3.11.0-bullseye
WORKDIR /app
COPY ./requirements/common.txt ./requirements/
RUN pip install --no-cache-dir -r ./requirements/common.txt
COPY . main.py
COPY ./src ./src/
COPY ./src ./ai/model/model.pkl
COPY ./src ./ai/model/vectorizer.pkl
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--reload"]
EXPOSE 8000
