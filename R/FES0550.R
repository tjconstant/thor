#' Transmission from Thorlabs shortpass filter number FES0550 given wavelength
#'
#' @param wavelength_nm incident wavelength in nanometers
#'
#' @return Returns the fractional transmission coefficient of Thorlabs shortpass filter number FES0550
#' @export
#'
#' @examples
#' FES0550(570)
FES0550 <- function(wavelength_nm){

  FES0550_Transmission <- FES0550_data # from manual
  FES0550_Transmission_Function <- stats::splinefun(FES0550_Transmission$wavelength_nm, FES0550_Transmission$Transmission)

  if(max(wavelength_nm) > max(FES0550_Transmission$wavelength_nm) | min(wavelength_nm) < min(FES0550_Transmission$wavelength_nm)){
    warning("wavelength is outside dataset range")
  }

  Transmission_pct <- FES0550_Transmission_Function(wavelength_nm)
  Transmission_frac <- Transmission_pct/100

  return(Transmission_frac)
}
