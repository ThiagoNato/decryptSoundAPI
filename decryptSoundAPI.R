library(decryptSound)

#* @get /
root <- function() {
  "hello world"
}

#* Return text of capcha image
#* @param encode64 MP3 in Base64
#* @param guid Name of file
#* @post /cpomPMSP
cpomPMSP <- function(encode64, guid) {
  decryptSound::decryptSound(encode64, guid)
}

