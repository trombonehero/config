function cat
  if which bat > /dev/null
    bat $argv
  else
    /bin/cat $argv
  end
end
