# Alias definitions.

# rvm workaround kinda fixing environment before entering root env via SU.
# Without this system ruby will missbehave.
alias su='rvm system; su; rvm default'
