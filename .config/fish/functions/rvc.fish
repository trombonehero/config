function rvc
	riscv32-esp-elf-cc -O1 -S $argv -o - | pygmentize -l asm
end
