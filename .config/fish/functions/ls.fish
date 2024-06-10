function ls --wraps=eza --description 'List contents of directory'
  isatty stdout
  and set -a opt -F

  if which eza > /dev/null 2> /dev/null
    eza $argv
  else if which exa > /dev/null 2> /dev/null
    exa $argv
  else
    /bin/ls $argv
  end
end
