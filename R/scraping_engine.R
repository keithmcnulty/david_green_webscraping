results <- shiny::eventReactive(input$go, {

  # get url from input
  article_input <- input$url
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
  
  list(
    article_title,
    author_list,
    title_list,
    link_list
  )

})