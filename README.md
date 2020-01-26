# englishtowns
### Overview
A function for creating fake English, Irish, and German town names.

### Installation
``` r
# install.packages("devtools")
devtools::install_github("sbha/englishtowns")
```

### Usage
The default is to generate an English town:
```r
library(englishtowns)
generate_town()
#> Greathamrough
```

Setting the country argument to 'Ireland' will generate an Irish name:
```r
generate_town(country = 'Ireland')
#> Ballyalliagh
```

Setting the country argument to 'Germany' will generate a German name:
```r
generate_town(country = 'Germany')
#> Neustaberheim
```

Maybe you can do something fun with it:
```r
paste0('I was born in ', 
       generate_town(), 
       ', England, went to university in ', 
       generate_town('Ireland'), 
       ', Ireland, and now live in ', 
       generate_town('Germany'), 
       ', Germany.')
#> "I was born in Easthippingford, England, went to university in Balliallymore, Ireland, and now live in Neustadtstahausen, Germany."
```

### Data Sources
English towns: [Wikipedia](https://simple.wikipedia.org/wiki/List_of_cities_and_towns_in_England)  
Irish towns: [Wikipedia](https://en.wikipedia.org/wiki/List_of_towns_and_villages_in_the_Republic_of_Ireland)  
German towns: [Wikipedia](https://en.wikipedia.org/wiki/List_of_cities_and_towns_in_Germany)