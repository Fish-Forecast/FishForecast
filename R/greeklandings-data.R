#' Annual Anchovy, Sardine and Mackerel landings in Hellenic Waters 1964-2007
#'
#' @description Annual commercial landings of anchovy, sardine and mackerel
#' from Greek fisheries compiled by the Hellenic Statisitcal Authority.
#' 
#' @details Data are from Table IV in the "Sea Fishery by Motor Vessels" statistical
#' reports published by the Hellenic Statisitcal Authority.  The reports
#' are available in Digital Library (\href{http://dlib.statistics.gr}{ELSTAT}), Special Publications, 
#' Agriculture-Livestock-Fisheries, Fisheries.
#' In Table IV, the landings data were taken from the total column, units are metric tons.
#' In the table, sardine is denoted ' Pilchard'
#' 
#' The greeklandings data object has all the species, in long format.
#' 
#' In addition to the main greeklandings data object, a variety of smaller data objects have been
#' extracted for the chapters.  These are the following:
#' ```
#' anchovy <- subset(landings, Species=="Anchovy")
#' sardine <- subset(landings, Species=="Sardine")
#' anchovyts <- ts(anchovy$log.metric.tons, start=1964)
#' sardinets <- ts(anchovy$log.metric.tons, start=1964)
#' anchovy87 <- subset(anchovy, Year<=1987)
#' sardine87 <- subset(sardine, Year<=1987)
#' anchovy87ts <- ts(anchovy87$log.metric.tons, start=1964)
#' sardine87ts <- ts(anchovy87$log.metric.tons, start=1964)
#' ```
#'
#' @docType data
#' 
#' @name greeklandings
#'
#' @usage data(greeklandings)
#' 
#' @format Objects of class \code{"data.frame"}.  Columns are Year, Species, log.metric.tons, metric.tons
#'
#' @keywords datasets
#'
#' @source \href{http://dlib.statistics.gr/portal/page/portal/ESYE}{Hellenic Statisitcal Authority Digital Library}
#'
#' @examples
#' data(greeklandings)
#' plot(anchovy)
#' 
#' library(ggplot2)
#' ggplot(greeklandings, aes(x=Year, y=log.metric.tons)) + 
#'       geom_line() + facet_wrap(~Species)
"greeklandings"