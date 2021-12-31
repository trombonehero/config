function op-signin
  set cmd (op-mac-signin | sed '/#/d; s/export/set -U -x/; s/=/ /; s/"//g')
  eval $cmd
end
