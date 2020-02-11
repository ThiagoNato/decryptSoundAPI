library(decryptSound)
library(tuneR)
library(magrittr)

#* @get /
root <- function() {
  "hello world"
}

#* Return text of capcha image
#* @param encode64 MP3 in Base64
#* @param guid Name of file
#* @post /cpomPMSP
cpomPMSP <- function(encode64, guid) {

  # mp3 <- guid + ".mp3"
  #
  # #Salva o mp3 localmente
  # fs <- file(mp3, "wb")
  # base64enc::base64decode(encode64, fs)
  # close(fs)

  decryptSound(encode64)
}

