
# Author:  Niamh Brockbank
# Date:    2020-11-18s

# INSTALL AND LOAD PACKAGES ################################

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, rio, rLakeAnalyzer) 

# IMPORTING WITH RIO #######################################

# CSV
temp_csv <- import("/Users/niamhbrockbank/Documents/University of Bath/5. Fourth Year/Adv. Dissertation/Journal Paper/4.4 Results/Schmidt Stability/tempOneDay.csv")
head(temp_csv)

# DATA VIEWER ##############################################

?View
View(temp_csv)

#Webpage for exploring LakeAnalyser
browseURL("https://cran.r-project.org/web/packages/rLakeAnalyzer/rLakeAnalyzer.pdf")
# USING SCHMIDT STABILITY ####
#This is the web page explaining the schmidt stability function
browseURL("https://rdrr.io/cran/rLakeAnalyzer/man/schmidt.stability.html")

#Schmidt Stability of single day
temps <- c(temp_csv$temp)
depths <- c(temp_csv$depth)
bthA <- c(temp_csv$bathA_m2)
bthD <- c(temp_csv$bthD_m)

#This function requires all variable vectors to be the same length
schmidt.stability(temps, depths, bthA, bthD, sal = 0)

##Time-series of schmidt stability
#Load the txt file and convert all #N/A to NA or blank
#Try doing this in excel using IFERROR first

#Loading Bathymetry
bathy = load.bathy("/Users/niamhbrockbank/Documents/University of Bath/5. Fourth Year/Adv. Dissertation/Journal Paper/4.4 Results/Schmidt Stability/bathymetry.csv")
plot(bathy$areas, bathy$depths, type='l',
     ylab='Depths (m)', xlab='Areas (m^2)')

#Loading Time-series Temperatures
temp = load.ts("/Users/niamhbrockbank/Documents/University of Bath/5. Fourth Year/Adv. Dissertation/Journal Paper/4.4 Results/Schmidt Stability/temperatures.txt")

St <- ts.schmidt.stability(temp, bathy, na.rm = TRUE)
write.csv(St, "/Users/niamhbrockbank/Documents/University of Bath/5. Fourth Year/Adv. Dissertation/Journal Paper/4.4 Results/Schmidt Stability/schmidtstability.csv")
schmidt.plot(temp, bathy)
# CLEAN UP #################################################

# Clear environment

rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
