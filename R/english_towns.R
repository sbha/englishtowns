#library(tidyverse)
#library(rstrings)

data(sysdata, envir=environment())

generate_town <- function(country = 'England', top_p = 20){
  df <- englishtowns:::df_ngs %>% filter(country == country)
  ngram <- function(df, ng_order, top_p){
    df %>%
      filter(order == ng_order) %>%
      arrange(desc(p)) %>%
      top_n(top_p, p) %>%
      sample_n(1) %>%
      distinct(ngrams)
  }

  first <- ngram(df, 'start', top_p)

  mid <- ngram(df, 'mid', top_p)

  end <- ngram(df, 'end', top_p)

  paste0(first$ngrams, mid$ngrams, end$ngrams)

}

# generate_town()

# https://stackoverflow.com/questions/9521009/how-do-you-handle-r-data-internal-to-a-package
# https://stackoverflow.com/questions/32964741/accessing-sysdata-rda-within-package-functions
# http://r-pkgs.had.co.nz/data.html
# https://stackoverflow.com/questions/12391195/include-data-examples-in-developing-r-packages
