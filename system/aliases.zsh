# dotfiles project aliases
alias dotcd='cd $ZSH'
alias dotmate='subl $ZSH'

# Miscellaneous aliases
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias ipcp='ipconfig getifaddr en0 | tr -d "\n" | pbcopy'
alias ipshow='ipconfig getifaddr en0'
alias ls='ls -flaG'
alias mate='subl' #lolforever
alias pubkey='more ~/.ssh/id_rsa.pub | pbcopy | echo "=> Public key copied to pasteboard."'