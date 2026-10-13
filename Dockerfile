FROM rocker/tidyverse:3.6.0

COPY --chown=rstudio bootstrap_ci.R data_penguins.csv /home/rstudio/
