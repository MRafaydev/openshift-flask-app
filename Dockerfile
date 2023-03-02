FROM python:3.8-slim-buster

WORKDIR /app

# RUN python -m pip install --upgrade pip
# RUN pip install keyring artifacts-keyring
# Set the index URL and credentials for your PyPI proxy
ENV PIP_INDEX_URL=https://pkgs.dev.azure.com/SE20-105/_packaging/SE20-105/pypi/simple/
ENV PIP_USERNAME=SE20-105
ENV PIP_PASSWORD=JdzH3680&

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
