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
  # recebe o MP3 em base 64
  # converte em um arquivo e salva na maquina
  # carrega o captcha
  # decrypta o captcha carregado
  decryptSound(encode64, guid)
}
