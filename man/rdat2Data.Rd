% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rdat2Data.r
\name{rdat2Data}
\alias{rdat2Data}
\title{Build MSEtool Data object from bam rdat object}
\usage{
rdat2Data(
  rdat,
  Data = NULL,
  herm = NULL,
  nsim = 1,
  genus_species = NULL,
  Region = "Southeast US Atlantic",
  Fref_name = "Fmsy",
  Rec = "bam_recruits",
  CAA_abb = "all",
  CAL_abb = "all",
  Ind_abb = "all",
  CV_vbK = 0.001,
  CV_vbLinf = 0.001,
  CV_vbt0 = 0.001,
  CV_Cat = NULL,
  Mat_age1_max = 0.49,
  length_sc = 0.1,
  wla_sc = NULL,
  wla_unit = "lbs",
  wla_unit_mult = 1000,
  catch_sc = 1,
  combine_indices = FALSE,
  fleet_sel_abb_key = data.frame(U = c("sTV", "rHB", "rGN"), sel = c("sCT", "rGN",
    "rHB")),
  AddInd_order = c("sTV", "sCT", "sVD", "sBL", "sVL", "sBT", "sFT", "rHB", "rHB.D",
    "cDV", "cHL", "cLL", "cOT", "cPT", "cGN", "rGN"),
  AddIndFleetUnits_key = c(s = 0, r = 0, c = 1)
)
}
\arguments{
\item{rdat}{BAM output rdat (list) object read in with dget()}

\item{Data}{MSEtool Data object to start with}

\item{herm}{Is the species hermaphroditic? If "gonochoristic", use female maturity. If "protogynous", use a function of male and female maturity.}

\item{nsim}{see \code{\link[MSEtool]{OM-class}}}

\item{genus_species}{Genus and species names separated by a space (e.g. "Centropristis striata").}

\item{Region}{see \code{\link[MSEtool]{Data-class}}}

\item{Fref_name}{Name of F reference as named in rdat$parms list (e.g. Fmsy, F30)}

\item{Rec}{see \code{\link[MSEtool]{Data-class}}. Set to "bam_recruits" to set this value to the vector of recruits estimated by bam for years where rec devs were estimated. Set to NULL to leave it empty.}

\item{CAA_abb}{Abbreviation for identifying the observed age comp matrix for the catch-at-age (CAA) slot. Names of age compositions in the BAM rdat comp.mats list are expected to follow the naming convention "acomp.abb.ob". Examples from SEDAR 53 Red Grouper: "CVT", "HB", "cH". Set to "all" or "none" to use all or none of the age comps, respectively.}

\item{CAL_abb}{Abbreviation for identifying the observed index for the catch-at-length (CAL) slot. Analogous to CAA_abb. Names of length compositions in the BAM rdat comp.mats list are expected to follow the naming convention "lcomp.abb.ob". Set to "all" or "none" to use all or none of the length comps, respectively.}

\item{Ind_abb}{Abbreviation for identifying the observed index of abundance for the Ind slot. Names of indices in the BAM rdat t.series matrix are expected to follow the naming convention "U.abb.ob". Examples from SEDAR 53 Red Grouper: "CVT", "HB", "cH". If multiple (valid) abb values are provided, the corresponding indices will be averaged (geomean) and restandardized to a mean of 1. Abbreviations that don't match any indices will be ignored. Set to "all" or "none" to use all or none of the indices, respectively.}

\item{CV_vbK}{see \code{\link[MSEtool]{Data-class}}}

\item{CV_vbLinf}{see \code{\link[MSEtool]{Data-class}}}

\item{CV_vbt0}{see \code{\link[MSEtool]{Data-class}}}

\item{CV_Cat}{see \code{\link[MSEtool]{Data-class}}}

\item{Mat_age1_max}{Limit maximum value of proportion mature of first age class (usually age-0 or age-1). Models sometimes fail when maturity of first age class is too high (e.g. >0.5)}

\item{length_sc}{Scalar (multiplier) to convert length units including wla parameter. For example if L in wla*L^wlb is in mm then length_sc should be 0.1 to convert to cm. (MSEtool examples tend to use cm whereas BAM uses mm.)}

\item{wla_sc}{Scalar (multiplier) to convert wla parameter to kilograms (kg). Setting a value for wla_sc will override settings for wla_unit and wla_unit_mult. If null, the function will try to figure out if the weight unit of wla was g, kg, or mt based on the range of the exponent to convert to kg. The wla parameter will also be scaled by 1/length_sc^wlb.}

\item{wla_unit}{Character. Basic unit that you want weight to be in, which is applied to the wla parameter. Accepted units are those used by measurements::conv_unit function (\code{\link[measurements]{conv_unit})}.}

\item{wla_unit_mult}{Numeric. Multiplier to apply to wla_unit (e.g. 10, 100, 1000)}

\item{catch_sc}{Scalar (multiplier) for catch. BAM catch is usually in thousand pounds (klb). The default 1 maintains that scale.}

\item{combine_indices}{Indicate whether indices should be combined (TRUE) or remain separate (FALSE). logical. If TRUE, then the function will populate the Ind and IndCV slots. If FALSE it will populate AddInd, CV_AddInd, AddIndV, AddIunits, and AddIndType slots.}

\item{fleet_sel_abb_key}{Data frame with two columns "U" and "sel" for indicating the abbreviations for individual indices and the
selectivity that should be used with it if the abbreviation for that index cannot be matched to a selectivity. This is used to build
the AddIndV slot to correspond to the AddInd and CV_AddInd slots}

\item{AddInd_order}{A character vector of abbreviations used in AddInd slot, to attempt to sort the indices. The function will then
attempt to sort AddInd, CV_AddInd, and AddIndV in this order. The order of indices doesn't matter in most cases, but when using
interim management procedures built with \code{\link[SAMtool]{make_interimMP}} the interim procedure will use the first index.
\code{AddInd_order} does not need to include the abbreviations for all indices. Simply indicating the abbreviation of a single index
will result in that index being first in the order followed by the remaining indices in the order they were provided. A value of "" will not modify the order of the indices.
A value of "CVlo" will sort the indices in increasing order of mean index CV.}

\item{AddIndFleetUnits_key}{Named numeric vector indicating the units of each fleet category (s=survey, r=recreational, c=commercial) used
to determine AddIunits (see \code{\link[MSEtool]{Data-class}}). The names of the values in the key are matched to the first letter of the
abbreviations of the indices.}
}
\description{
Build MSEtool Data object from bam rdat object
}
\examples{
\dontrun{
# Convert Black Sea Bass rdat to Data object
Data_BlackSeaBass <- rdat2Data(rdat_BlackSeaBass)
# Run statistical catch-at-age model
SCA(1,Data_BlackSeaBass,AddInd=1)

}
}
\author{
Nikolai Klibansky
}
\keyword{MSEtool}
\keyword{assessment}
\keyword{bam}
\keyword{fisheries}
\keyword{stock}
