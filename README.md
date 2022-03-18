# wcpss_gds_py_env
Configuration files and documentation for quickly setting up a geospatial data science dev environment. Built on the gds_env.

# Instructions

## Creating the `wcpss_gds` environment

### conda

As a prerequisite to creating the `wcpss_gds` environment, you will need conda installed on your machine. If you are on a Windows machine with ArcGIS Pro installed, you already have conda installed. You can use it by navigating to `Start > ArcGIS` and opening `Python Command Prompt`.

Otherwise, you can install either conda using either the [Anaconda](https://docs.anaconda.com/anaconda/install/index.html) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installers. Anaconda comes with many packages pre-installed that criss-cross many domains. As such, it will leave a larger footprint on your machine and take longer to initially install. Because the whole purpose of this repo is to get you set up with a geospatial data science environment, it is recommend that you install conda using Miniconda. Miniconda does not have any pre-installed libraries and is well-suited for creating custom environments like the one in this repo. That said, both installations allow the creation of new, custom environments so the choice is yours.

Regardless of which OS you're creating the environment on, give your self some time for this process. There are a lot of libraries in this environment. The inclusion of the ArcGIS API for Python expecially seems to challenge conda's environment solver so this will take a while.

#### Windows

For Windows, there is an installation script called `wcpss_gds_py_win_installer.bat` to help with complete the creation of the `wcpss_gds` environment.

1. Download `wcpss_gds_py_win_installer.bat` to your local machine. The location isn't particularly important. Just make sure it is place you can save and access from the command line.
2. Open *Anaconda Prompt*. If you're using conda via the installation from ArcGIS Pro open the ArcGIS *Python Command Prompt*.
3. Copy the full file path to `wcpss_gds_py_win_installer.bat` on your local machine. For example, if you saved it in `C:\Users\<username>` you would copy `C:\Users\<username>\wcpss_gds_py_win_installer.bat`.
4. Paste the file path copied in the previous step in to the *Anaconda Prompt* and press *`Enter`*. 

The installation script will run, installing all the relevant libraries into your new environment called `wcpss_gds`.

#### Linux

For now, the process is a little more manual on Linux. Open up a terminal and make sure the `base` conda environment is active. Then run the following commands:

```bash
$ conda env create -f https://raw.githubusercontent.com/wcpss-geo/wcpss_gds_py_env/main/conda/wcpss_gds_py.yml

$ conda activate wcpss_gds

$ conda install -y -c conda-forge git

$ pip install --user -r https://raw.githubusercontent.com/wcpss-geo/wcpss_gds_py_env/main/conda/wcpss_gds_py_pip.txt

$ jupyter labextension install nbdime-jupyterlab --no-build

$ jupyter lab build -y

$ jupyter lab clean -y

$ conda clean --all -f -y

$ conda deactivate
```

#### Activate the environment

Open up a terminal or Anaconda Prompt (Windows only) and run `conda activate wcpss_gds`

### Docker

#### Build the `wcpss_gds_py` image

1. Clone or download the wcpss_gds_py repository.
2. Open a terminal/command line that has access to the `docker` command.
3. Change your working directory to the wcpss_gds_py repository on your local machine (e.g. `cd C:\path\to\wcpss_gds_py`)
4. Run the build command: `docker build -t wcpss_gds_py .`

#### Run a container based on `wcpss_gds_py`

1. Open a terminal/command line that has access to the `docker` command.
2. Change your working directory to the directory you want to work in (e.g. `cd C:\path\to\my_project`)
3. Run the command to start the container
    - As a JupyterLab project:<br>`docker run --rm -it -p 8888:8888 -v ${PWD}:/home/jovyan/work wcpss_gds_py`
    - As a bash shell only:<br>`docker run --rm -it -p 8888:8888 -v ${PWD}:/home/jovyan/work wcpss_gds_py /bin/bash`
4. The project directory is linked to the `work` directory in the Docker container. To access your project directory either run `cd ./work` (bash shell) or double click the `work` directory in JupyterLab.