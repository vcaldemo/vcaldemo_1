#===============================================================================
# Loading the required libraries
#===============================================================================
library(RCurl)

#===============================================================================
# These files need to be the current working directory where the script is run
#===============================================================================
files <- c("table_1","table_2","table_3","table_4","table_5","table_6","screen")

for (i in files) {
  ftpUpload(paste0(i,".png"), paste0("ftp://unity_application:ftp_password_51932@vcal.bala.sh/images/",i,".png"))
}