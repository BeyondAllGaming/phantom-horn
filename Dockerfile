# get the linux image with python (debian)
FROM python:3.9-slim

# install software
# - firefox-esr: browser
# - xvfb: virtual display server
# - x11vnc: VNC server for viewing the display
# - fluxbox: window manager
# - wget: to fetch geckodriver from github
RUN apt-get update && apt-get install -y \
    wget \
    firefox-esr \
    xvfb \
    x11vnc \
    fluxbox \
    && rm -rf /var/lib/apt/lists/*

# python dependencies from requirements.txt
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# install geckodriver extension for firefox (will allow for selenium to interact with ff)
RUN wget -q "https://github.com/mozilla/geckodriver/releases/download/v0.36.0/geckodriver-v0.36.0-linux64.tar.gz" -O /tmp/geckodriver.tar.gz && \
tar -xzf /tmp/geckodriver.tar.gz -C /usr/local/bin && \
rm /tmp/geckodriver.tar.gz

# set the working dir + setup
WORKDIR /app
COPY . /app

# expose VNC port
EXPOSE 5900

# start the virtual display (Xvfb) display :99 1024x768, fluxbox, the VNC server port 5900, and then the python script.
CMD ["sh", "-c", "Xvfb :99 -screen 0 1024x768x24 & fluxbox & x11vnc -display :99 -forever -nopw -listen 0.0.0.0 -xkb & export DISPLAY=:99 && python script.py"]