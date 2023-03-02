FROM python:3.8-slim-buster

WORKDIR /app

RUN python -m pip install --upgrade pip
RUN pip install keyring artifacts-keyring
COPY requirements.txt requirements.txt
COPY pip.conf /etc/pip.conf

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
