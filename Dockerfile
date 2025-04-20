FROM python:3.13-slim
WORKDIR /app
COPY . /app
RUN pip install pygame neat-python
CMD ["python", "main.py"]
