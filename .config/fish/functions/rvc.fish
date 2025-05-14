function rvc
	clang --target=riscv32 -march=rv32im -S $argv -o - \
		| pygmentize -O style=gruvbox-dark -l asm
end
