function rvc
	clang --target=riscv32 -march=rv32i -S $argv -o - \
		| pygmentize -O style=gruvbox-dark -l asm
end
