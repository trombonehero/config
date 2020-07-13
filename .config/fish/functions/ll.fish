function ll --description 'List contents of directory using long format'
  if which exa > /dev/null
    exa -l --git
  else
    ls -lh $argv
  end
end
