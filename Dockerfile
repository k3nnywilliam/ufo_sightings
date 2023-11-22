# Base image from https://hub.docker.com/r/rstudio/r-base
FROM rstudio/r-base:4.3.2-focal

RUN apt-get update

RUN apt-get -y install build-essential

# Install Ubuntu Focal packages, run updates, clean 
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    nano \
    wget \
    curl \
    libcurlpp-dev \
    libxml2-dev \
    gcc \
    unixodbc \
    unixodbc-dev \
    libgit2-dev \
    postgresql-common \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    zlib1g-dev \
    libpng-dev \
    libgdal-dev \
    gdal-bin \
    libgeos-dev \
    libproj-dev \
    libsqlite3-dev \
    libfreetype6-dev \
    cmake \
    gfortran \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get upgrade -y && apt-get clean


# Download and install ShinyServer
RUN wget --no-verbose --no-check-certificate https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-14.04/x86_64/shiny-server-1.5.15.953-amd64.deb 
RUN apt-get -y install ./shiny-server-1.5.15.953-amd64.deb

## Copy renv lockfile to root
#COPY renv.lock /
# Install specific package versions from renv lockfile (renv.lock)
RUN Rscript -e 'install.packages(c("renv", "remotes", "pak", "httpuv", "devtools"), repos = c(RSPM = "https://packagemanager.rstudio.com/cran/latest", CRAN = "https://cloud.r-project.org"))'
#RUN Rscript -e 'options(renv.config.pak.enabled = TRUE)'
#RUN Rscript -e 'renv::consent(provided = TRUE)'
#RUN Rscript -e 'renv::restore(repos = c(RSPM = "https://packagemanager.rstudio.com/cran/latest", CRAN = "https://cloud.r-project.org"))'
RUN Rscript -e 'install.packages(c("shiny", "shinyjs", "shinyWidgets", "htmlwidgets", "dplyr", "tidyr", "bslib", "waiter", "DT", "data.table", "leaflet", "htmltools", "stringr", "shinycssloaders"), repos = "http://cran.us.r-project.org")'

# Copy configuration files into the Docker image
COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf

# Copy shiny app into the Docker image
COPY /app /srv/shiny-server/

#allow permissions to corresponding folders
RUN mkdir -p /var/log/shiny-server
RUN chown -R shiny:shiny /var/log/shiny-server
RUN chown -R shiny:shiny /srv/shiny-server
RUN chown -R shiny:shiny /var/lib/shiny-server
RUN chown -R shiny:shiny /usr/local/lib/R/site-library

# Expose port
EXPOSE 8080

#add user shiny to sudoer list
RUN usermod -G sudo -a shiny

# Copy further configuration files into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh
RUN chmod a+rx /usr/bin/shiny-server.sh

# Run app at container start
CMD ["/usr/bin/shiny-server"]