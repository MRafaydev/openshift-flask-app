FROM python:3.8-slim-buster

WORKDIR /app

# Set the index URL to your PyPI proxy
RUN pip config set global.index-url index-url=https://pkgs.dev.azure.com/SE20-105/_packaging/SE20-105/pypi/simple/

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]