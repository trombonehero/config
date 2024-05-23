function ls --wraps=eza --description 'List contents of directory'
  isatty stdout
  and set -a opt -F

  if which eza > /dev/null 2> /dev/null
    eza --git $argv
  else if which exa > /dev/null 2> /dev/null
    exa --git $argv
  else
    /bin/ls $argv
  end
end
