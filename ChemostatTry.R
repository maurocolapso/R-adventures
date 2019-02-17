setwd("C:/Users/2166611p/Desktop/PhD/Data/FTIR data/Mosquito Samples/Kisumu")

library("ChemoSpec", lib.loc="~/R/win-library/3.5")
library("R.utils", lib.loc="~/R/win-library/3.5")

ssp <- files2SpectraObject( gr.crit = c('1D','12D','WG','LG','AB','TH','HE'),
                            header = FALSE, 
                            fileExt = "\\.dpt",
                            sep = "\t",
                            freq.unit = "wavelength", 
                            int.unit = "absorbance", 
                            descrip = " wings Study",
                            out.file = "subsp",
                            debug = TRUE)

# After that, you need to take the subsp.RData and load into R
AgeKisumu <- loadObject("subsp.RData")

sumSpectra(AgeKisumu)

plotSpectra(AgeKisumu, which = c(1,2), yrange = c(0,5))

AgeKisumuBs <- baselineSpectra(AgeKisumu, int = FALSE, method = "modpolyfit", retC = TRUE)

plotSpectra(AgeKisumuBs,which = c(1,2), xlim = c(4000,500))

surveySpectra2(AgeKisumuBs, method = "iqr")
