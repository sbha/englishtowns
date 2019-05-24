# englishtowns
### Overview
A function for creating fake English and Irish town names.

### Installation
``` 
# install.packages("devtools")
devtools::install_github("sbha/englishtowns")
```

### Usage
The default is a generate an English town:
```
library(englishtowns)
generate_town()
#> Greathamrough
```

Setting the country arguement to 'Ireland' will generate Irish names:
```
generate_town(country = 'Ireland')
#> Ballyalliagh
```

### Data Source
English towns: [Wikipedia](https://simple.wikipedia.org/wiki/List_of_cities_and_towns_in_England)  
Irish towns: [Wikipedia](https://en.wikipedia.org/wiki/List_of_towns_and_villages_in_the_Republic_of_Ireland)