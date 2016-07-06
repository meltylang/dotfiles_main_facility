# Alias definitions.

# rvm workaround kinda fixing environment before entering root env via SU.
# Without this system ruby will missbehave.
alias su='echo "Turning OFF rvm for super user";'\
'rvm system; su;'\
'echo "Turning ON rvm for user";'\
'rvm default'
