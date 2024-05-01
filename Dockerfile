From r-base:4.2.0
ENTRYPOINT ["/bin/bash"]
### Adding user decon
RUN useradd -ms /bin/bash decon
### Adding Certificates for wget tu download from git
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates libcurl4-openssl-dev git
### Running Container as decon and install decon from git
USER decon
WORKDIR /home/decon/
RUN git clone https://github.com/dnousome/DECoN/
WORKDIR /home/decon/DECoN/Linux/
### Starting setup
RUN mkdir -p /home/decon/DECoN/Linux/packrat/src/VGAM/
RUN wget https://cran.r-project.org/src/contrib/Archive/VGAM/VGAM_0.9-8.tar.gz -O /home/decon/DECoN/Linux/packrat/src/VGAM/VGAM_0.9-8.tar.gz
RUN ./setup.sh
RUN R -e 'install.packages(c("remotes"))'
RUN R -e 'remotes::install_github("https://github.com/cran/ExomeDepth/archive/refs/tags/1.1.15.tar.gz",upgrade="never")'
