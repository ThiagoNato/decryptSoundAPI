library(decryptSound)
library(tuneR)
library(magrittr)

#* @get /
root <- function() {
  "hello world"
}

#* Return text of capcha image
#* @param encode64 MP3 in Base64
#* @post /cpomPMSP
cpomPMSP <- function(encode64) {
  decryptSound(encode64)
}

