# englishtowns
### Overview
A function for creating fake English, Irish, and German town names.

### Installation
``` 
# install.packages("devtools")
devtools::install_github("sbha/englishtowns")
```

### Usage
The default is to generate an English town:
```
library(englishtowns)
generate_town()
#> Greathamrough
```

Setting the country arguement to 'Ireland' will generate an Irish name:
```
generate_town(country = 'Ireland')
#> Ballyalliagh
```

Setting the country arguement to 'Germany' will generate a German name:
```
generate_town(country = 'Germany')
#> Neustaberheim
```

### Data Source
English towns: [Wikipedia](https://simple.wikipedia.org/wiki/List_of_cities_and_towns_in_England)  
Irish towns: [Wikipedia](https://en.wikipedia.org/wiki/List_of_towns_and_villages_in_the_Republic_of_Ireland)  
German towns: [Wikipedia](https://en.wikipedia.org/wiki/List_of_cities_and_towns_in_Germany)