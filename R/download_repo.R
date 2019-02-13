#' Download a GitHup Repo
#' 
#' This downloads a repo and unzips into the working directory
#' 
#' @param repo The name of the repo in quotes
#' @param girhuburl The url of the GitHub account in quotes
#' @param clean If TRUE (default), remove .gitignore, .gitattributes, *.RProj
#' 
#' @export
download.repo <- function(repo, githuburl = "https://github.com/RVerse-Tutorials/", clean=TRUE){
  download.file( 
    url <- paste0(githuburl, repo, "/archive/master.zip"),
                  destfile = paste0(repo, "-master.zip")
    )
    unzip( zipfile = paste0(repo, "-master.zip") )
    file.rename( paste0(repo,"-master"), repo )
    file.remove( paste0(repo,"-master.zip") )
    if(clean){
      suppressWarnings(file.remove(paste0(repo,"/.gitignore")))
      suppressWarnings(file.remove(paste0(repo,"/.gitattibutes")))
      suppressWarnings(file.remove(paste0(repo,"/*.Rproj")))
      suppressWarnings(file.remove(paste0(repo,"/.Rhistory")))
      suppressWarnings(file.remove(paste0(repo,"/.RData")))
    }
}
               