#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Bilal Haq
# Data: 4 February 2021
# Contact: b.haq@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

#### Data Download ####
# From https://open.toronto.ca/dataset/neighbourhood-crime-rates/

# Datasets are grouped into packages that have multiple datasets 
# (aka 'resources') that are relevant to that topic. So we first look at the 
# package using a unique key obtained from the dataset's webpage (see above)

# get package
# package <- show_package("fc4d95a6-591f-411f-af17-327e6c5d03c7")

# get all resources for this package
resources <- list_package_resources("9d11c7aa-7613-4d3e-95f3-a02e2b1aa2d7")

# We need the unique key from that list of resources 

# There is only one resource, so get_resource() will load that
# If there is more than one resource, either filter or specify
annual_reported_crimes <- resources %>% 
  get_resource()


#### Save Data ####
write_csv(annual_reported_crimes, "inputs/data/annual_reported_crimes.csv")




         