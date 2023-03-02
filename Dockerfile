FROM python:3.8-slim-buster

WORKDIR /app

# # RUN python -m pip install --upgrade pip
# # RUN pip install keyring artifacts-keyring
# # Set the index URL and credentials for your PyPI proxy
# ENV PIP_INDEX_URL=https://pkgs.dev.azure.com/SE20-105/_packaging/SE20-105/pypi/simple/
# # ENV PIP_INDEX_URL=https://pkgs.dev.azure.com/SE20-105/_packaging/SE20-105/pypi/simple/
# # ENV PIP_USERNAME=SE20-105
# # ENV PIP_PASSWORD=JdzH3680&

# Set the index URL to your PyPI proxy
RUN pip install --no-cache-dir --trusted-host 127.0.0.1:8081 pip && \
    pip config set global.index-url http://127.0.0.1:8081/repository/pypi-proxy/simple

# COPY requirements.txt requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
