#' Environmental Covariates in Hellenic Waters 1964-2007
#'
#' @description Annual commercial landings of anchovy, sardine and mackerel
#' from Greek fisheries compiled by the Hellenic Statisitcal Authority.
#' 
#' @details The covariates are those in Stergiou and Christou except 
#' that NS winds might not be vertical wind.  I used the ICOADS data not the COADSs.  
#' The boxes are 1 degree but on 1 degree centers not 0.5 centers.  Thus box is 39.5-40.5 not 39-40.
#' 
#' The code to download the data
#' 
#' \code{
#' library(RCurl)
#' library(XML)
#' library(stringr)
#' lat <- c(39,39,40)
#' lon <- c(24,25,25)
#' covs <- list()
#' for(i in 1:3){
#'   loc <- paste0("[(",lat[i],".5):1:(",lat[i],".5)][(",lon[i],".5):1:(",lon[i],".5)]")
#'   url <- paste0("https://coastwatch.pfeg.noaa.gov/erddap/griddap/esrlIcoads1ge.htmlTable?air[(1964-01-01):1:(2018-08-01T00:00:00Z)]",loc,",slp[(1964-01-01):1:(2018-08-01T00:00:00Z)]",loc,",sst[(1964-01-01):1:(2018-08-01T00:00:00Z)]",loc,",vwnd[(1964-01-01):1:(2018-08-01T00:00:00Z)]",loc,",wspd3[(1964-01-01):1:(2018-08-01T00:00:00Z)]",loc)
#'   doc <- getURL(url)
#'   cov <- readHTMLTable(doc, which=2, stringsAsFactors=FALSE)
#'   coln <- paste0(colnames(cov),".",cov[1,])
#'   coln <- str_replace(coln, "\n", "")
#'   coln <- str_replace_all(coln, "[*]", "")
#'   cov <- cov[-1,]
#'   colnames(cov) <- coln
#'   cov[,1] <- as.Date(cov[,1])
#'   for(j in 2:dim(cov)[2]) cov[,j] <- as.numeric(cov[,j])
#'   covs[[i]] <- cov
#'   }
#' }
#' 
#' This created a list with 3 data.frames for each of the 3 boxes used in Stergiou and Christou. 
#' These were then averaged together to create monthly and yearly means for the region.
#' ```
#' #Now create the monthly and yearly means.
#' covsmean <- covs[[1]]
#' for(j in 2:dim(cov)[2])
#'   covsmean[,j] <- apply(cbind(covs[[1]][,j], covs[[2]][,j], covs[[3]][,j]),1,mean,na.rm=TRUE)
#' covsmean <- covsmean[,c(-2,-3)]
#' covsmean$Year <- as.factor(format(cov[,1],"%Y"))
#' covsmean.mon <- covsmean
#' covsmean.year <- data.frame(Year=unique(covsmean$Year))
#' for(j in 2:(dim(covsmean)[2]-1))
#'   covsmean.year <- cbind(covsmean.year, tapply(covsmean[,j], covsmean$Year, mean, na.rm=TRUE))
#' colnames(covsmean.year) <- c("Year",colnames(covsmean)[2:(dim(covsmean)[2]-1)])
#' covsmean.year$Year <- as.character(covsmean.year$Year)
#' covsmean.mon$Year <- as.character(covsmean.mon$Year)
#' ```
#'
#' @docType data
#' 
#' @name ecovs
#' @rdname greekenvironcovs
#' @aliases ecovs ecovsmean.mon ecovsmean.year
#'
#' @usage data(greekenvironcovs)
#' 
#' @format Objects of class \code{"data.frame"}.  Columns are Year,
#'        air.degC,     slp.millibars,     sst.degC,        vwnd.m/s,        wspd3.m3/s3.
#'
#' @keywords datasets
#'
#' @source \href{https://coastwatch.pfeg.noaa.gov/erddap/griddap/esrlIcoads1ge}{NOAA ERDDAP ICOADS data}
#'
#' @examples
#' data(greekenvironcovs)
#' library(corrplot)
#' cormat <- cor(ecovsmean.year)
#' corrplot(cormat)
"ecovs"