library(telegram)

#' Notification to a Telegram Bot
#'
#' @author Rikard Grass, rikard.grass@ufz.de
#' @description
#' A collection of functions that make it easy to send regular notifications to a Telegram Bot
#' @param
#' @return
#' @references
#' @export
#' @examples
#'  Bot1Credentials <- getCredentials(method = "path", TOKEN_name = "PATH_TO_TELGRAM_TOKEN_FILE", ID_name = "PATH_TO_TELGRAM_ID")
#'  bot <- TGBot$new(token = Bot1Credentials@TOKEN)
#'  bot$set_default_chat_id(Bot1Credentials@ID)
#'  sendStatus(bot)
sendStatus <- function(bot,
                       msgSensorsOk = "1, 2, 3",
                       msgSensorsOff = "4, 5, 6",
                       msgProzessesOK = "all",
                       msgProzessesOff  = "not problems"
                             ){
  # components
  msgTextPerson <- "Rikard"
  msgTextContent  <- "Sensor Status Report "
  msgTime         <- Sys.time()
  msgSensorsOk    <- msgSensorsOk
  msgSensorsOff   <- msgSensorsOff
  msgProzessesOK  <- msgProzessesOK
  msgProzessesOff  <- msgProzessesOff
  ## Markdown support (version 2 via parse_mode = 'markdownv2')
  md <- paste0(
      "\nHello ",msgTextPerson," this is your ","\n",
      "*",msgTextContent,"* ",msgTime,"\n\n",
      "Sensors OK: ",msgSensorsOk,"\n",
      "Sensors Off: ", msgSensorsOff,"\n",
      "Processes UP: ", msgProzessesOK,"\n",
      "Prozesses Down: ",msgProzessesOff,"\n",
      "have a nice day!"
  )

  bot$sendMessage(md, parse_mode = 'markdown')

}

#devtools::install_github('RikardGrass/telegram')
#library(telegram)
#library(readr) # used for the workaround to get credentials into a dockerfile of R if this script shall run in a docker file
# you need a token and an ID in the .Renviron file
