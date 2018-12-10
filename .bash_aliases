# Alias definitions.

# rvm workaround kinda environment before entering root env via SU.
# Without this system ruby will missbehave.
# Another solution is permanent setting RVM to use system ruby by default.

RVM_SWP_CMD="echo \"Turning OFF rvm for super user\"; rvm system; su; "
RVM_SWP_CMD+="echo \"Turning ON rvm for user\"; rvm default"

if [ "$_system_name" != "OSX" ]; then
  alias su=${RVM_SWP_CMD}
fi

alias git-ls-tree="git ls-tree -r HEAD"
