FROM jupyter/datascience-notebook

USER root

RUN apt-get update && \
	apt-get install -y --no-install-recommends jq openssh-client && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir -p /usr/local/bin/before-notebook.d && \
	echo 'node /opt/conda/share/jupyter/lab/staging/node_modules/jsonrpc-ws-proxy/dist/server.js --port 3000 --languageServers /home/jovyan/servers.yml' > /usr/local/bin/lsp.sh && \
	chmod a+x /usr/local/bin/lsp.sh && \
	echo 'nohup sh /usr/local/bin/lsp.sh & disown' > /usr/local/bin/before-notebook.d/lsp.sh && \
	chmod a+x /usr/local/bin/before-notebook.d/lsp.sh

USER $NB_UID

RUN conda install -c conda-forge -y \
		gspread \
		oauth2client \
		pyopenssl \
		jupyter_contrib_nbextensions \
		jupyter_nbextensions_configurator \
		autopep8 \
		nbdime \
		jupyterlab-git \
		jupyterlab_code_formatter \
		black \
		yapf \
		python-language-server \
		python-jsonrpc-server \
		psycopg2 && \
	conda install -c plotly -y \
		plotly && \
	conda install -c r -y \
		r-hmisc \
		r-psych \
		r-ROCR \
		r-xtable \
		r-stargazer && \
	conda install -y conda-build && \
	conda skeleton cran gvlma && \
	conda build --R 3.6.1 r-gvlma && \
	conda install -y -c local r-gvlma && \
	conda clean --all -f -y && \
	pip install pymystem3 && \
	pip install python-language-server[all] && \
	pip install jupyterlab_sql && \
	pip install 'tensorflow==1.15' && \
	pip install dash && \
	jupyter nbextension enable freeze/main && \
	jupyter nbextension enable autosavetime/main && \
	jupyter nbextension enable collapsible_headings/main && \
	jupyter nbextension enable execute_time/ExecuteTime && \
	jupyter nbextension enable datestamper/main && \
	jupyter nbextension enable hide_input_all/main && \
	jupyter nbextension enable varInspector/main && \
	jupyter nbextension enable code_prettify/autopep8 && \
	jupyter nbextension enable toc2/main && \
	jq -c '.autosavetime_set_starting_interval = true' /home/jovyan/.jupyter/nbconfig/notebook.json > tmp.$$.json && \
	mv tmp.$$.json /home/jovyan/.jupyter/nbconfig/notebook.json && \
	nbdime extensions --enable && \
	jupyter labextension install @ryantam626/jupyterlab_code_formatter --no-build && \
	jupyter labextension install @jupyterlab/toc --no-build && \
	jupyter labextension install jupyterlab-plotly --no-build && \
	jupyter labextension install plotlywidget --no-build && \
	jupyter serverextension enable jupyterlab_sql --py --sys-prefix && \
	jupyter serverextension enable --py jupyterlab_code_formatter && \
	jupyter lab build && \
	printf "langservers:\n  python:\n    - pyls" > /home/jovyan/servers.yml && \
    	fix-permissions $CONDA_DIR && \
    	fix-permissions /home/$NB_USER
