# Defined in /var/folders/s1/qvlvgs5513q25ysf1ndt56q40000gn/T//fish.qOd6VI/lla.fish @ line 1
function lla
  if which eza > /dev/null
    eza -l --git --all --all $argv
  else if which exa > /dev/null
    exa -l --git --all --all $argv
  else
    ls -lh $argv
  end
end
