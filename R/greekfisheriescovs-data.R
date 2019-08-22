#' Fisheries Covariates in Hellenic Waters 1964-2007
#'
#' @description Annual commercial landings of anchovy, sardine and mackerel
#' from Greek fisheries compiled by the Hellenic Statisitcal Authority.
#' 
#' @details Data are from Tables I, III and C in the "Sea Fishery by Motor Vessels" statistical
#' reports published by the Hellenic Statisitcal Authority.  The reports
#' are available in Digital Library (\href{http://dlib.statistics.gr}{ELSTAT}), Special Publications, 
#' Agriculture-Livestock-Fisheries, Fisheries.
#' 
#' Table I: Boats (BO) and horsepower (HP) of Trawler, Purse seiners, Beach seiners (marked seiners) and Other. 
#' Tonnage (TO) by Total open sea, Trawler and Purse seiners
#' 
#' Part II, Table C: Fishers (FI) by Trawler, Purse seiners, Beach seiners (marked seiners) and Other.
#' 
#' Table III: Value (VA) of catch by Trawler, Purse seiners, Beach seiners (marked seiners) and Other. 
#' Note in 2002, currency changes to euros from drachma
#'
#' @docType data
#' 
#' @name greekfish.cov
#' @rdname greekfisheriescovs
#'
#' @usage data(greekfisheriescovs)
#' 
#' @format Objects of class \code{"data.frame"}.  Columns are "Year"              "Boats.BO"          "Trawlers.BOT"      "Purse.seiners.BOP" "Beach.seiners.BOB"
#'  "Other.BOC"         "Demersal.BOD"      "Fishers.FI"        "Trawlers.FIT"      "Purse.seiners.FIP"
#'   "Beach.seiners.FIB" "Other.FIC"         "Demersal.FID"      "Horsepower.HP"     "Trawler.HPT"      
#'    "Purse.seiners.HPP" "Beach.seiners.HPB" "Other.HPC"         "Demersal.HPD"      "Trawler.VAT"      
#'     "Purse.seiners.VAP" "Beach.seiners.VAB" "Other.VAC"         "Tonnage.TO"        "Trawlers.TOT"     
#'      "Purse.seiners.TOP"
#'
#' @keywords datasets
#'
#' @source \href{http://dlib.statistics.gr/portal/page/portal/ESYE}{Hellenic Statisitcal Authority Digital Library}
#'
#' @examples
#' data(greekfisheriescovs)
#' library(corrplot)
#' cormat <- cor(greekfish.cov)
#' corrplot(cormat)
"greekfish.cov"