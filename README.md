# David Green webscraping
Scrape David Green LinkedIn articles for specific information 

Works only on 'Best articles pieces', seems to work on earlier ones, but not later ones, probably due to changes of formatting or other weird LinkedIn stuff.  Needs further work.

Example URLs it works on:

https://www.linkedin.com/pulse/20-best-hr-analytics-articles-may-jun-2017-david-green/
https://www.linkedin.com/pulse/20-best-hr-analytics-articles-jul-aug-2017-david-green/

## How to use scraping script (assumes all packages required are installed)

* Grab this repo
* Source scraping.R
* Enter the URL when prompted in console
* If successful, Excel file will be saved to your project or home directory.

## How to use shiny app

* Run index.Rmd to run locally
* Or visit https://keith-mcnulty.shinyapps.io/david_green_webscraping/ to run online

## Further dev

* Some URLs fail to connect
* Some articles are formatted unexpectedly so results are not reflective of full content.
