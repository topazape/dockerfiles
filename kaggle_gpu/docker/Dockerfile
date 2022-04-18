FROM gcr.io/kaggle-gpu-images/python:v113

ENV LANG=C.UTF-8
ENV USER=jupyter

RUN    add-apt-repository ppa:neovim-ppa/stable \
    && apt-get update \
    && apt-get -y install neovim \
    && jupyter lab build --dev-build=False --minimize=False \
    && pip install -U timm wandb sweetviz

RUN su -c "git clone https://github.com/topazape/dotfiles.git /home/${USER}/dotfiles && cd /home/${USER}/dotfiles && make && mkdir ~/workspace" ${USER}

WORKDIR /home/${USER}/workspace
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh", "jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--ServerApp.token=''", "--ServerApp.password=''" ]
