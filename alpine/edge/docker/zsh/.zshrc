export ZSH="/ohmyzsh/.oh-my-zsh"

ZSH_THEME="nord"
ZSH_DISABLE_COMPFIX=true

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
