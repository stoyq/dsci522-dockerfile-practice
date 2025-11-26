FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# copy lock file into the container
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# install packages from the lock file
RUN conda create -y -n 522a2 --file /tmp/conda-linux-64.lock
RUN conda clean -a -y
RUN fix-permissions "${CONDA_DIR}"
RUN fix-permissions "/home/${NB_USER}"