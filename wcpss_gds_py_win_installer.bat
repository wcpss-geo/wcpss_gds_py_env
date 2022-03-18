REM Please run this from the Anaconda Prompt
REM This installer is pinned to the latest released version
REM Set up GDS environment
call conda env create -f https://raw.githubusercontent.com/wcpss-geo/wcpss_gds_py_env/main/wcpss_gds_py.yml
REM Activate environment
call conda activate wcpss_gds
REM Add pip packages
call conda install -y -c conda-forge git
pip install --user -r https://raw.githubusercontent.com/wcpss-geo/wcpss_gds_py_env/main/wcpss_gds_py_pip.txt
REM JupyterLab old plugin's
jupyter labextension install nbdime-jupyterlab --no-build
jupyter lab build -y
jupyter lab clean -y
conda clean --all -f -y
call conda deactivate