function rva
	set tmpdir (mktemp -d)
	set afile $tmpdir/tmp.s

	echo $argv > $tmpdir/tmp.s
	riscv32-esp-elf-cc -c $tmpdir/tmp.s -o $tmpdir/tmp.o
	riscv32-esp-elf-objdump --disassembler-color=terminal -d $tmpdir/tmp.o
end
