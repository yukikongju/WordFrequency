# ------------ package installation ----------

if (packageVersion("devtools") < 1.6) {
  install.packages("devtools")
}

devtools::install_github("bradleyboehmke/harrypotter")

# ------------------- Dependencies ---------------

library(tidyverse)
library(stringr)
library(tidytext) 
library(harrypotter)

# ---------------------- Harry Potter Dataset --------------------

titles <- c("Philosopher's Stone", "Chamber of Secrets", "Prisoner of Azkaban",
            "Goblet of Fire", "Order of the Phoenix", "Half-Blood Prince",
            "Deathly Hallows")

books <- list(philosophers_stone, chamber_of_secrets, prisoner_of_azkaban,
              goblet_of_fire, order_of_the_phoenix, half_blood_prince,
              deathly_hallows)

series <- tibble()

# format dataset [book, chapter, word]
for(i in seq_along(titles)){
  clean <- tibble(chapter = seq_along(books[[i]]),
                  text = books[[i]]) %>% 
    unnest_tokens(word, text) %>% 
    mutate(book = titles[i]) %>% 
    select(book, everything())
  series <- rbind(series, clean)
}

series$book <- factor(series$book, levels = rev(titles))







