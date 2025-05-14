function rvc
	clang --target=riscv32 -march=rv32i -S $argv -o - | pygmentize -l asm
end
