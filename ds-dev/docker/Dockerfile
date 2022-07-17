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

RUN pip install --no-cache-dir \
	# base packages
	numpy \
	scipy \
	pandas \
	"dask[complete]" \
	opencv-python \
	# machine learning
	scikit-learn \
	lightgbm \
	xgboost \
	catboost \
	imbalanced-learn \
	umap \
	shap \
	# deep learning
	pytorch-lightning \
	tensorboard \
	# data visualization
	matplotlib \
	seaborn \
	plotly \
	pandas_profiling \
	sweetviz \
	"dtreeviz[lightgbm]" \
	# utility
	timm \
	wandb \
	openpyxl \
	sqlalchemy \
	psycopg2-binary \
	# ppl
	pymc3

WORKDIR /home/${USER}/workspace
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh", "jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--ServerApp.token=''", "--ServerApp.password=''" ]
