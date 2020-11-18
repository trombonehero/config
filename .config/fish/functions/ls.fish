function ls --wraps=exa --description 'List contents of directory'
  isatty stdout
  and set -a opt -F

  if which exa > /dev/null
    exa --git $argv
  else
    /bin/ls $argv
  end
end
