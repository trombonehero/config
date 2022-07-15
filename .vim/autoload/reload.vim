" Reload on SIGUSR1
function! reload#ReloadConfig()
	source ~/.vimrc
endfunction

autocmd SigUSR1 * call reload#ReloadConfig()
