export BASH_SILENCE_DEPRECATION_WARNING=1

#Change PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\d \T \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Immediatly write history
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export HISTSIZE=15000

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi

# init pyenv
eval "$(pyenv init -)"

# AdoptOpenJDK version (default)
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# Regular Oracle version
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Add Google Cloud SDK to PATH
export PATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/:${PATH}"

# Add custom scripts to PATH
scripts_location="/Users/pfryerdavis/Documents/workspace/scripts"
export PATH="${PATH}:${scripts_location}"
alias list_scripts="ls -1 ${scripts_location}"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pfryerdavis/google-cloud-sdk/path.bash.inc' ]; then source '/Users/pfryerdavis/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pfryerdavis/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/pfryerdavis/google-cloud-sdk/completion.bash.inc'; fi

export VIRTUAL_ENV="/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenv"

# Google Cloud for Python
export PYTHONPATH="$PYTHONPATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/platform/google_appengine/"

# Hadoop Config Dir
#export HADOOP_CONF_DIR=/etc/hadoop

# Knife Editor
export EDITOR="/usr/bin/vim"

# Git autocompletes
if [ -f $(brew --prefix)/etc/bash_completion ]; then  source $(brew --prefix)/etc/bash_completion; fi

alias gls="gcloud compute instances list"
alias gssh="gcloud compute ssh"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"
# added by Anaconda2 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/anaconda2/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -e /Users/pfryerdavis/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/pfryerdavis/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Add cloudplatform kubeconfig
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/pfryerdavis/.kube/config:/Users/pfryerdavis/.kube/config.shopify.cloudplatform
