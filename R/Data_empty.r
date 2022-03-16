#' Create a completely empty Data object
#' @param Data Data
#' @details
#'
#' @keywords bam stock assessment fisheries MSEtool
#' @author Nikolai Klibansky
#' @export
#' @examples
#' \dontrun{
#' Data_empty()
#' }

Data_empty <- function(Data=new("Data")){
  for(slotName_i in slotNames(Data)){
    slot_i <- slot(Data,slotName_i)
    if(length(slot_i)>0&is.numeric(slot_i)){
      slot(Data,slotName_i) <- slot_i*NA
    }
  }
  return(Data)
}

