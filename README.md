# Jupyter Docker Stack with extra flavour for everyday tasks

Based on https://hub.docker.com/r/jupyter/datascience-notebook/ from https://github.com/jupyter/docker-stacks

[![](https://images.microbadger.com/badges/image/gumlooter/dockerized_jupyter.svg)](https://hub.docker.com/r/gumlooter/dockerized_jupyter "DockerHub") [![](https://images.microbadger.com/badges/version/gumlooter/dockerized_jupyter.svg)](https://hub.docker.com/r/gumlooter/dockerized_jupyter "DockerHub")

![WYSIWYG](https://github.com/gumlooter/dockerized_jupyter/raw/master/screenshot.png "Funny title")

## As simple as
```docker run -p 8888:8888 gumlooter/dockerized_jupyter:latest```

## Additions

### Python
* gspread
* oauth2client
* pyopenssl
* psycopg2
* pymystem3

### R
* hmisc
* psych
* ROCR
* xtable
* stargazer
* gvlma

### Jupyter/JupyterLab extensions
* jupyterlab-git (+nbdime)
* @ryantam626/jupyterlab_code_formatter, jupyterlab_code_formatter (+black, yapf)
* jupyterlab_sql
* @jupyterlab/toc
* jupyter_nbextensions_configurator
* freeze/main
* autosavetime/main
* collapsible_headings/main
* execute_time/ExecuteTime
* datestamper/main
* hide_input_all/main
* varInspector/main
* code_prettify/autopep8
* toc2/main

---
Can be deployed to GCP using https://github.com/gumlooter/infra
