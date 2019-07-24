FROM debian:stretch

COPY sources.list /etc/apt/

RUN apt-get update && apt-get install -y wget

# Install RStudio 1.1.463
RUN wget https://download1.rstudio.org/rstudio-xenial-1.1.463-amd64.deb -O /tmp/rstudio-xenial-1.1.463-amd64.deb && \
    apt-get install -y /tmp/rstudio-xenial-1.1.463-amd64.deb && \
    rm /tmp/rstudio-xenial-1.1.463-amd64.deb

# Install Bookdown
RUN Rscript -e "install.packages('bookdown', repos='http://cran.us.r-project.org')"

# Install Pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb -O /tmp/pandoc-2.7.3-1-amd64.deb && \
    apt-get install -y /tmp/pandoc-2.7.3-1-amd64.deb && \
    rm /tmp/pandoc-2.7.3-1-amd64.deb
