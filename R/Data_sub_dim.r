#' Subset MSEtool Data object from bam rdat object based on a particular dimension (i.e. year,)
#'
#' @param Data MSEtool Data object
#' @param nyr_rm number of years to remove from the end of the data series. used if type = "year".
#' @param type type of subsetting to do: "year" = trim year dimension. Right now, "year" is the only option, though "age" may be added in the future.
#'
#' @keywords bam stock assessment fisheries MSEtool
#' @author Nikolai Klibansky
#' @export
#' @examples
#' \dontrun{
#' # Convert Black Sea Bass rdat to Data object
#' Data <- rdat_to_Data(rdat_BlackSeaBass)
#' Data_sub_dim(Data,1)
#' }

# Trim years from a data object
# (could also make a feature where you project some data forward by some number of years)
Data_sub_dim <- function(Data,
                         nyr_rm=0,
                         type="year"
){
  if(type=="year"&nyr_rm>0){
  yrm <- seq(ncol(Data@Cat) - nyr_rm + 1, ncol(Data@Cat), 1)

  Data@Year <- Data@Year[-yrm]

  Data@LHYear <- rev(Data@Year)[1]

  Data@Cat <- Data@Cat[, -yrm, drop = FALSE]
  Data@CV_Cat <- Data@CV_Cat[, -yrm, drop = FALSE]

  Data@Effort <- Data@Effort[, -yrm, drop = FALSE]
  Data@CV_Effort <- Data@CV_Effort[, -yrm, drop = FALSE]

  Data@Ind <- Data@Ind[, -yrm, drop = FALSE]
  Data@CV_Ind <- Data@CV_Ind[, -yrm, drop = FALSE]

  Data@SpInd <- Data@SpInd[, -yrm, drop = FALSE]
  Data@CV_SpInd <- Data@CV_SpInd[, -yrm, drop = FALSE]

  Data@VInd <- Data@VInd[, -yrm, drop = FALSE]
  Data@CV_VInd <- Data@CV_VInd[, -yrm, drop = FALSE]

  Data@AddInd <- Data@AddInd[, , -yrm, drop = FALSE]
  Data@CV_AddInd <- Data@CV_AddInd[, , -yrm, drop = FALSE]

  Data@Rec <- Data@Rec[, -yrm, drop = FALSE]
  Data@CV_Rec <- Data@CV_Rec[, -yrm, drop = FALSE]

  Data@ML <- Data@ML[, -yrm, drop = FALSE]

  Data@Lc <- Data@Lc[, -yrm, drop = FALSE]

  Data@Lbar <- Data@Lbar[, -yrm, drop = FALSE]

  Data@CAA <- Data@CAA[, -yrm, , drop = FALSE]

  Data@CAL <- Data@CAL[, -yrm, , drop = FALSE]
  }

  return(Data)
}

