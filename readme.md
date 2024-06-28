Soures used for the cration of this package
# Anleitung: https://blog.datascienceheroes.com/get-notify-when-an-r-script-finishes-on-telegram/


Test connection to telegram bot

mytext <- as.character("Sensor3outoforder")

TOKEN="<your token>" 
ID="<your id>"
URL=paste0("https://api.telegram.org/bot",TOKEN,"/sendMessage")
 

# Simple method:
# Das bringt fehlercode aber sendet was.. 
curlcommand <- paste0("curl -s -X POST ",URL," -d chat_id=",ID," -d text=HelloWorld")
curlcommand <- paste0("curl -s -X POST ",URL," -d chat_id=",ID," -d text=",mytext)
shell(cmd = as.character(curlcommand) )


# First Steps
- you need a .Renviron file where credentials are stored or where the path to the credential-file is stored
- Struckture of the .Renviron file you can find in RenvironExample
- you can find an example of the credential-Token file in telegram_token_Example. You can place this tokenfile anywhere but need to add the path linking to it to .Renviron file
