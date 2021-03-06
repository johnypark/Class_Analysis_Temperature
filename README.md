README
================

Analysis of Temperature Datasets
--------------------------------

Objective of this repository is to explore spatial and temporal extent of temperature data, and to develop data science techniques to integrate environmental data into ecological studies.

### Sources

-   [CDC WONDER: Daily Air Temperatures and Heat Index](http://wonder.cdc.gov/nasa-nldas.html)
-   [API access](https://wonder.cdc.gov/wonder/help/WONDER-API.html) to CDC WONDER database
-   [helpful link](http://techqa.info/programming/question/39857253/)
-   [reference](https://groups.google.com/forum/#!topic/ggplot2/fJAEJgAqb7U)
-   [mapping](https://www.r-bloggers.com/importing-bathymetry-and-coastline-data-in-r/)
-   [color pallette](http://colorpalettes.net/color-palette-3376/)

### Packages used in this study

-   `rnoaa` Link to [NOAA R package](https://ropensci.org/blog/2014/03/13/rnoaa/)
-   [github repository](https://github.com/ropensci/rnoaa) for `rnoaa`
-   [rnoaa tutorial](https://ropensci.org/tutorials/rnoaa_tutorial.html)
-   `wondr` tool for working with CDC WONDER API in R
-   [github repository](https://github.com/hrbrmstr/wondr) for `wondr`
-   `maps` `dplyr` [`magrittr`](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html) [`viridis`](https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html)

### Prerequisites

-   You need a [web servies token](https://www.ncdc.noaa.gov/cdo-web/token) from NOAA in order to access bulk data

### Plots

#### 30 year Average (1978-2011) January Minimum Temperature

![](Rplot_MAIN.jpeg)

#### 30 year Average (1978-2011) January Maximum Temperature

![](Rplot_MAIN_jan_max.jpeg)

#### 30 year Average (1978-2011) August Maximum Temperature

![](Rplot_MAIN_aug_max.jpeg)

#### Testing different colors: Example\_mapsColorPallette.R

![](Rplot01_test_colors.jpeg)
