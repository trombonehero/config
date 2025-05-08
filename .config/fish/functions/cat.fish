function cat
  if which bat > /dev/null
    bat --paging=never $argv
  else
    /bin/cat $argv
  end
end
