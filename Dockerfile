FROM python:3.9.7-buster
ARG DEBIAN_FRONTEND=noninteractive

# パッケージの追加とタイムゾーンの設定
# 必要に応じてインストールするパッケージを追加してください
RUN apt-get update && apt-get install -y \
    tzdata \
&&  ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Tokyo

# JupyterLab関連のパッケージ（いくつかの拡張機能を含む）
# 必要に応じて、JupyterLabの拡張機能などを追加してください
RUN python3 -m pip install --upgrade pip \
&&  pip install --no-cache-dir \
    black \
    jupyterlab \
    jupyterlab_code_formatter \
    jupyterlab-git \
    lckr-jupyterlab-variableinspector \
    jupyterlab_widgets \
    ipywidgets \
    import-ipynb

# 基本パッケージ
# Pythonでよく利用する基本的なパッケージです
# JupyterLabの動作には影響しないので、必要に応じてカスタマイズしてください
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    matplotlib \
    japanize_matplotlib \
    Pillow
