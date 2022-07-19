FROM nvidia/cuda:11.7.0-runtime-ubuntu22.04

ENV LANG=C.UTF-8
ENV USER=jupyter

RUN useradd -m ${USER} && su -c "mkdir /home/${USER}/workspace"
RUN apt-get update && \
	apt-get install -y build-essential gfortran libopenblas-dev \
		curl file less git graphviz python3 python3-pip \
		fonts-ipaexfont fonts-noto-cjk fonts-noto-cjk-extra
RUN pip install --no-cache-dir pipenv
WORKDIR /Work
COPY Pipfile /Work
RUN pipenv lock && pipenv sync --system && pipenv --clear

WORKDIR /home/${USER}/workspace

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh", "jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--ServerApp.token=''", "--ServerApp.password=''" ]
