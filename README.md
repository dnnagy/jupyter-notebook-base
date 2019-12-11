# jupyter-notebook-base
Dockerfile for nagyd96/jupyter-notebook-base

# TODO:
Add explicit password protection, so we do not need to copy tokens

# To run this notebook:
```bash
docker pull nagyd96/jupyter-notebook-base
docker run -it -p 8888:8888 \
--mount type=bind,source="$(pwd)",target=/home/nagyd96/workdir nagyd96/jupyter-notebook-base:latest
```

# If you want to run with a specific theme:
```bash
docker run -it -p 8888:8888 \
-e THEME='onedork' \
--mount type=bind,source="$(pwd)",target=/home/nagyd96/workdir nagyd96/jupyter-notebook-base:latest
```
Available themes: [https://github.com/dunovank/jupyter-themes](https://github.com/dunovank/jupyter-themes)
If You want to use dark theme in matplotlib, add `-e PLT_DARK_THEME=1` to the docker command
