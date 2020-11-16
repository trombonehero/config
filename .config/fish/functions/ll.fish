function ll --wraps=ls --description 'List contents of directory using long format'
  if which exa > /dev/null
    exa -l --git $argv
  else
    ls -lh $argv
  end
end
