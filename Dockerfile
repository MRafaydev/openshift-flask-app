FROM python:3.8-slim-buster

WORKDIR /app

# Set the index URL to your PyPI proxy
RUN pip install --no-cache-dir --trusted-host 127.0.0.1:8081 pip && \
    pip config set global.index-url http://127.0.0.1:8081/repository/pypi-proxy/simple

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]