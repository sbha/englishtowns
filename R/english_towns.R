#library(tidyverse)
#library(rstrings)

#https://simple.wikipedia.org/wiki/List_of_cities_and_towns_in_England

data(sysdata, envir=environment())

generate_town <- function(top_p = 20){
  df <- englishtowns:::df_ngs
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

generate_town()


