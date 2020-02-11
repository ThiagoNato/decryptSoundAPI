FROM rocker/tidyverse:3.6.1
MAINTAINER ThiagoNato <nato.tns@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages(c('plumber', 'yaml', 'base64enc', 'remotes', 'uuid'))"
RUN Rscript -e "remotes::install_github('tidyverse/tidyverse')"
RUN Rscript -e "remotes::install_github('cran/tuneR')"

# Install captcha-breaking captchas
RUN Rscript -e "remotes::install_github('ThiagoNato/decryptSound')"

COPY decryptSoundAPI.R decryptSoundAPI.R
#COPY keys.yaml keys.yaml

# Run
EXPOSE 8081

CMD ["Rscript", "-e", "pr <- plumber::plumb('decryptSoundAPI.R'); pr$run(host='0.0.0.0', port=8081)"]
