# This makes a cool Bash prompt. Append it to the end of the default .bashrc.

BOLD="\[$(tput bold)\]"
BRIGHT_BLUE="\[$(tput setaf 12)\]"
GREEN="\[$(tput setaf 2)\]"
CYAN="\[$(tput setaf 6)\]"
YELLOW="\[$(tput setaf 3)\]"
BRIGHT_PURPLE="\[$(tput setaf 13)\]"
WHITE="\[$(tput setaf 7)\]"
BLUE="\[$(tput setaf 4)\]"
NORMAL="\[$(tput sgr0)\]"
# POINTER_FINGER=$(echo -e "\xF0\x9F\x91\x89")
# PIZZA=$(echo -e "\xF0\x9F\x8D\x95")

#export PS1="${CYAN}┌${BRIGHT_PURPLE}[\u]${CYAN}-${BRIGHT_BLUE}[\d, \@]${CYAN}-${GREEN}[\w]\n${CYAN}└${YELLOW}$ ${NORMAL}"
export PS1="${CYAN}┌${BOLD}${BRIGHT_PURPLE}[\u]${CYAN}-${GREEN}[\w]\n${NORMAL}${CYAN}└${YELLOW}$ ${NORMAL}"

# enable color output in ls.
alias ls='ls -G'
