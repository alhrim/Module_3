rmarkdown::render("Script_survey_params.Rmd", 
                  params = list (region="Mountain"))

render_report<-function(regionvar){
  template<-"Script_survey_params.Rmd"
  outfile<-sprintf("steakArticle_%s.html", regionvar)
  parameters<-list(region=regionvar)
  rmarkdown::render(template,
                    output_file = outfile,
                    params = parameters)
  invisible(TRUE)
}

render_report("Pacific")

library(purrr)
params_list<-list(list("East North Central","South Atlantic",
                       "New England","Middle Atlantic",
                       "West South Central","West North Central",
                       "Pacific","Mountain", "East South Central"))

purrr::pmap(params_list,render_report)
