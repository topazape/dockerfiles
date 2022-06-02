FROM gcr.io/kaggle-gpu-images/python:v116

ENV LANG=C.UTF-8
ENV USER=jupyter

RUN apt update && apt install -y fonts-noto-cjk fonts-noto-cjk-extra fonts-ipaexfont
RUN pip install -U timm wandb sweetviz openpyxl psycopg2-binary && jupyter lab build --dev-build=False --minimize=False
RUN su -c "mkdir ~/workspace" ${USER}

WORKDIR /home/${USER}/workspace
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh", "jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--ServerApp.token=''", "--ServerApp.password=''" ]
