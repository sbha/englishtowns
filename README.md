# englishtowns
Generate fake English town names

### Overview
A function for creating fake English town names.

### Installation
``` 
# install.packages("devtools")
devtools::install_github("sbha/englishtowns")
```

### Usage
```
library(englishtowns)
generate_town()
#> Greathamrough

# the default is a generate an English town
generate_town('Ireland')
#> 
```

### Data Source
English towns: [Wikipedia](https://simple.wikipedia.org/wiki/List_of_cities_and_towns_in_England)
Irish towns: [Wikipedia](https://en.wikipedia.org/wiki/List_of_towns_and_villages_in_the_Republic_of_Ireland)