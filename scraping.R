# required libraries
library(rvest)
library(xml2)
library(tidyverse)
library(openxlsx)


# get url from input
article_input <- readline(prompt = "Enter URL to scrape:")
article <- xml2::read_html(article_input)

# fetch article title
article_title <- article %>% 
  rvest::html_nodes('body') %>% 
  rvest::html_nodes('article') %>% 
  rvest::html_nodes('header') %>% 
  rvest::html_nodes('h1') %>% 
  rvest::html_text('article-title')

# fetch list of authors named 
author_list <- article %>% 
  rvest::html_nodes('body') %>% 
  rvest::html_nodes('article') %>% 
  rvest::html_nodes('section') %>% 
  rvest::html_nodes('h2') %>%
  rvest::html_nodes('strong') %>% 
  rvest::html_text()

# fetch list of article titles named
title_list <- article %>% 
  rvest::html_nodes('body') %>% 
  rvest::html_nodes('article') %>% 
  rvest::html_nodes('section') %>% 
  rvest::html_nodes('h2') %>%
  rvest::html_nodes('a') %>% 
  rvest::html_text()
  
# fetch urls of articles mentioned
link_list <- article %>% 
  rvest::html_nodes('body') %>% 
  rvest::html_nodes('article') %>% 
  rvest::html_nodes('section') %>% 
  rvest::html_nodes('h2') %>%
  rvest::html_nodes('a') %>% 
  xml2::xml_attr('href')


# create excel workbook

wb <- openxlsx::createWorkbook()

# write author list
openxlsx::addWorksheet(wb, "Author List")

openxlsx::writeData(wb, "Author List", x = author_list, startRow = 1,
                    startCol = 1)
openxlsx::setColWidths(wb, "Author List", cols = 1, widths = "auto")

# write article list
openxlsx::addWorksheet(wb, "Article List")

openxlsx::writeData(wb, "Article List", x = title_list, startRow = 1,
                    startCol = 1)
openxlsx::setColWidths(wb, "Article List", cols = 1, widths = "auto")

# write link list
openxlsx::addWorksheet(wb, "URL List")

openxlsx::writeData(wb, "URL List", x = link_list, startRow = 1,
                    startCol = 1)
openxlsx::setColWidths(wb, "URL List", cols = 1, widths = "auto")



# write all data to file
filename <- paste0(article_title, ".xlsx")

openxlsx::saveWorkbook(wb, filename, overwrite = TRUE)

message(paste("Results saved in your project or home directory as", filename))