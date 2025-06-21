# google calendar
alias cal="gcalcli"
alias calag="gcalcli agenda"
alias caladd="gcalcli --calendar 'AI main' quick --reminder '15m'"
alias calw="gcalcli calw" # see the agend for the week
alias calm="gcalcli calm" # see the agenda for the month
alias cald="gcalcli delete"

# cerca da oggi ai prissimi 90 giorni gli eventi che contengono
# le parole fornite
function calf(){ 
  gcalcli agenda $(date +%Y-%m-%d) $(date -v+90d +%Y-%m-%d) | grep "$1"; 
}; 
