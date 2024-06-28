library(readr)

#' Credential Handlers
#'
#' @author Rikard Grass, rikard.grass@ufz.de
#' @description
#' A class that make it easy to store credentials
#' Similarly in Java, you can create a S4 class in R that encapsulates your information, you can access this information with: Object@TOKEN
#' @param
#' @return
#' @references
#' @export
#' @examples
#' myHandler <- new("CredentialHandler",
#'                 TOKEN = "123",
#'                 ID = "asdfdsa")
#'
setClass(Class="CredentialHandler",
         representation(
           TOKEN="character",
           ID="character"
         )
)

#' Parse Credentials
#'
#' @author Rikard Grass, rikard.grass@ufz.de
#' @description
#' A class that make it easy to store credentials
#' Similarly in Java, you can create a S4 class in R that encapsulates your information, you can access this information with: Object@TOKEN
#' @param
#' @return
#' @references
#' @export
#' @examples
getCredentials <- function(method = "path",
                           TOKEN_name = "PATH_TO_TELGRAM_TOKEN_FILE",
                           ID_name = "PATH_TO_TELGRAM_ID"){
  # get the token via token path given in the .Renviron file linking to the TOKEN-file stored
  #   on a suitable place for your system
  if (method == "path"){
    TOKEN = read_file(Sys.getenv(TOKEN_name)) # get TOKEN
    ID = read_file(Sys.getenv(ID_name)) # get ID
  }

  myHandler <- new("CredentialHandler",
                   TOKEN = TOKEN,
                   ID = ID)
  return(myHandler)
}
