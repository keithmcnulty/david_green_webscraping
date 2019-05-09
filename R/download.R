output$dwStart <- shiny::downloadHandler(
  filename = function() {
    paste0(results()[[1]], ".xlsx")
  },
  content = function(file) {
    
    # create excel workbook
    
    wb <- openxlsx::createWorkbook()
    
    # write author list
    openxlsx::addWorksheet(wb, "Author List")
    
    openxlsx::writeData(wb, "Author List", x = results()[[2]], startRow = 1,
                        startCol = 1)
    openxlsx::setColWidths(wb, "Author List", cols = 1, widths = "auto")
    
    # write article list
    openxlsx::addWorksheet(wb, "Article List")
    
    openxlsx::writeData(wb, "Article List", x = results()[[3]], startRow = 1,
                        startCol = 1)
    openxlsx::setColWidths(wb, "Article List", cols = 1, widths = "auto")
    
    # write link list
    openxlsx::addWorksheet(wb, "URL List")
    
    openxlsx::writeData(wb, "URL List", x = results()[[4]], startRow = 1,
                        startCol = 1)
    openxlsx::setColWidths(wb, "URL List", cols = 1, widths = "auto")
    
    
    
    # write all data to file
    openxlsx::saveWorkbook(wb, file, overwrite = TRUE)
    
  }
)
