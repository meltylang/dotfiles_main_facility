# Alias definitions.

# rvm workaround kinda environment before entering root env via SU.
# Without this system ruby will missbehave.
# Another solution is permanent setting RVM to use system ruby by default.
if [[ $_system_name != "OSX" ]]
then
alias su="echo \"Turning OFF rvm for super user\"; rvm system; su;"\
"echo \"Turning ON rvm for user\"; rvm default"
fi
