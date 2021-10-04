library(tidyverse)
library(plotly)
library(profvis)
#Create dataframe----
adsl <- data.frame(
  ID = sample(1:150, size = 100),TRT=sample(c("TRT1","TRT2","PLACEBO"),
                                            size=100,replace=TRUE),
  AGE = sample(25:85, size = 100, replace = TRUE),
  WEIGHT = sample(60:120, size = 100, replace = TRUE),
  SEX = sample(c("M", "F", ""), size = 100, replace = TRUE,prob = c(0.5,0.4,0.1))
) %>% mutate(USUBJID = paste0("TESTNJ0", ID)) %>% select(USUBJID, AGE,
                                                         SEX,WEIGHT,TRT)


#Save dataset----
saveRDS(adsl,file="C:/Users/bhara/Documents/R Projects/dataviz/iview.app/data/adsl.RDS")

#Plot data for numeric variables----

(gg <- ggplot(adsl,aes(y=AGE,fill=TRT,x=TRT))+geom_boxplot() + 
    geom_point(size = 2,alpha = .3,position = position_jitter(seed = 2, width = .1)))

plotly::ggplotly(gg) %>% plotly::layout(boxmode = "group")


# test --------------------------------------------------------------------


