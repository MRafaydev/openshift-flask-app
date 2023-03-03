FROM python:3.8-buster

WORKDIR /app

COPY requirements.txt .

ENV PIP_INDEX_URL=http://pypi-proxy:8081/repository/pypi-proxy/simple/
ENV PIP_CACHE_DIR=/pip-cache

RUN mkdir -p $PIP_CACHE_DIR && \
    pip install --no-cache-dir --trusted-host pypi-proxy -r requirements.txt \
    --cache-dir $PIP_CACHE_DIR \
    --no-warn-script-location

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
