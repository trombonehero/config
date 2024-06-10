function ll --wraps=ls --description 'List contents of directory using long format'
  if which eza > /dev/null
    eza -l $argv
  else if which exa > /dev/null
    exa -l $argv
  else
    ls -lh $argv
  end
end
