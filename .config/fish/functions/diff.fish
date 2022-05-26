#
# Prefer colordiff if it's installed; always use Unified Diff format
#
function diff
	set colordiff (which colordiff)
	set difft (which difft)

	if [ -x "$difft" ]
		eval $difft --display inline $argv
	else if [ -x "$colordiff" ]
		eval $colordiff -u $argv
	else
		eval (which diff) -u $argv
	end
end
