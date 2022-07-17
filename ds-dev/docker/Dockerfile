FROM nvidia/cuda:11.7.0-runtime-ubuntu22.04

ENV LANG=C.UTF-8
ENV USER=jupyter

RUN useradd -m ${USER} && su -c "mkdir /home/${USER}/workspace"
RUN apt-get update && \
	apt-get install -y build-essential gfortran libopenblas-dev \
		curl file less git graphviz python3 python3-pip \
		fonts-noto-cjk fonts-noto-cjk-extra fonts-ipaexfont

# jupyter-lab with some extensions
RUN pip install --no-cache-dir \
	jupyterlab \
	jupyterlab-code-formatter black isort \
	jupyterlab_widgets ipywidgets

# pytorch
RUN pip install --no-cache-dir \
	torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

# base packages
RUN pip install --no-cache-dir \
	numpy \
	scipy \
	pandas \
	"dask[complete]" \
	opencv-python

# machine learning
RUN pip install --no-cache-dir \
	scikit-learn \
	lightgbm \
	xgboost \
	catboost \
	imbalanced-learn \
	umap \
	shap

# data visualization
RUN pip install --no-cache-dir \
	matplotlib \
	seaborn \
	plotly \
	pandas_profiling \
	sweetviz \
	"dtreeviz[lightgbm]"

# utility
RUN pip install --no-cache-dir \
	timm \
	wandb \
	openpyxl \
	sqlalchemy \
	psycopg2-binary

# ppl
RUN pip install --no-cache-dir \
	pymc3

WORKDIR /home/${USER}/workspace
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh", "jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--ServerApp.token=''", "--ServerApp.password=''" ]
