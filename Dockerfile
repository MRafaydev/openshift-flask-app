FROM python:3.8-slim-buster

WORKDIR /app

# Set the index URL to your PyPI proxy
COPY pip.ini /etc/pip.conf  

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]