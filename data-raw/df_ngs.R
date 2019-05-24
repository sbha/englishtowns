library(tidyverse)
library(rstrings)

# https://simple.wikipedia.org/wiki/List_of_cities_and_towns_in_England
# https://en.wikipedia.org/wiki/List_of_towns_and_villages_in_the_Republic_of_Ireland


df_england <-
  tibble(town_raw = strsplit(english_towns, ',')) %>%
  unnest(town_raw) %>%
  mutate(town_raw = trimws(town_raw)) %>% 
  mutate(country = 'England')

df_germany <- 
  tibble(town_raw = strsplit(german_towns, ',')) %>%
  unnest(town_raw) %>%
  mutate(town_raw = trimws(town_raw)) %>% 
  mutate(country = 'Germany')

df_ireland <- 
  tibble(town_raw = strsplit(irish_towns, ',')) %>%
  unnest(town_raw) %>%
  mutate(town_raw = trimws(town_raw)) %>% 
  mutate(country = 'Ireland')

df_towns <- 
  bind_rows(df_england, 
            df_germany, 
            df_ireland)


df_ngrams <-
  df_towns %>%
  #mutate(town_raw = trimws(town_raw)) %>%
  rowwise() %>%
  mutate(ngrams = sub_stringer(town_raw, bar = TRUE)) %>%
  mutate(ngrams = strsplit(ngrams, '\\|')) %>%
  unnest(ngrams) %>%
  mutate(ngrams = trimws(ngrams)) %>%
  mutate(ngram = nchar(ngrams)) %>%
  mutate(order = if_else(str_detect(town_raw, paste0('^', ngrams)), 'start', 'mid')) %>%
  mutate(order = if_else(str_detect(town_raw, paste0(ngrams, '$')), 'end', order)) %>%
  filter(town_raw != ngrams) %>%
  filter(ngram+1 != nchar(town_raw)) %>% 
  #ungroup() %>% 
  filter(!str_detect(ngrams, '\\s+'))

df_ngs <-
  df_ngrams %>%
  filter(ngram > 2 & ngram < 9) %>%
  #filter(ngram > 2) %>%
  count(country, ngrams, ngram, order) %>%
  group_by(country, ngram, order) %>%
  mutate(p = round(n / sum(n) * 100, 1)) %>%
  ungroup()

# save(df_ngs, file = '/Users/stuartharty/Documents/r/packages/englishtowns/data/df_ngs.rda')
# save(df_ngs, file = '/Users/stuartharty/Documents/r/packages/englishtowns/R/sysdata.rda')
# usethis::use_data(df_ngs, internal = TRUE)
# load("/Users/stuartharty/Documents/r/packages/englishtowns/R/sysdata.rda")


# save(df_ngs, file = '/Users/stuartharty/Documents/r/packages/englishtowns/Data/sysdata.rda')

# Walthamborouorth
# Stoon-ham

