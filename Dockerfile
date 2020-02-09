FROM rocker/tensorflow
MAINTAINER decryptSound <nato.tns@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  apt-get install -y libssl-dev libjpeg-dev libmagick++-dev && \
  rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages(c('tidyverse', 'base64enc', 'tuneR'))"
RUN Rscript -e "remotes::install_github('rstudio/reticulate')"
RUN Rscript -e "remotes::install_github('rstudio/tensorflow')"
RUN Rscript -e "remotes::install_github('rstudio/keras')"

# Install captcha-breaking captchas
RUN Rscript -e "remotes::install_github('ThiagoNato/decryptSound')"

COPY decryptSoundAPI.R decryptSoundAPI.R

# Run
EXPOSE 9090

CMD ["Rscript", "-e", "pr <- plumber::plumb('decryptSoundAPI.R'); pr$run(host='0.0.0.0', port=9090)"]