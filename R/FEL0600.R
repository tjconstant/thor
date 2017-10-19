#' Transmission from Thorlabs longpass filter number FEL0600 given wavelength
#'
#' @param wavelength_nm incident wavelength in nanometers
#'
#' @return Returns the fractional transmission coefficient of Thorlabs longpass filter number FEL0600
#' @export
#'
#' @examples
#' FEL0600(620)
FEL0600 <- function(wavelength_nm){

  FEL0550_Transmission <- FEL0600_data # from manual
  FEL0550_Transmission_Function <- stats::splinefun(FEL0600_Transmission$wavelength_nm, FEL0600_Transmission$Transmission)

  if(max(wavelength_nm) > max(FEL0600_Transmission$wavelength_nm) | min(wavelength_nm) < min(FEL0600_Transmission$wavelength_nm)){
    warning("wavelength is outside dataset range")
  }

  Transmission_pct <- FEL0600_Transmission_Function(wavelength_nm)
  Transmission_frac <- Transmission_pct/100

  return(Transmission_frac)
}
