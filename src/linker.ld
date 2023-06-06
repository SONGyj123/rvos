

SECTIONS
{
	. = 0x80200000,

	.text.boot :
	{
		*(.text.boot)
	}

	_stext = .;
	.text :
	{
		*(.text)
		. = ALIGN(4096);
		_trampoline = .;
		*(trampolineSec)
		. = ALIGN(4096);
	}
	_etext = .;

	_srodata = .;
	.rodata :
	{
		*(.rodata)
	}
	_erodata = .;

	_sdata = .;
	.data :
	{
		*(.data)
	}
	. = ALIGN(4096);
	_pgt_start = .;
	. += 4096;
	. = ALIGN(4096);
	_sec_pgt_start = .;
	. += 4096;
	_edata = .;

	. = ALIGN(4096);

	_sbss = .;
	.bss :
	{
		*(.bss)
		*(.sbss)
	}
	_ebss = .;
	. = ALIGN(4096);

	_free_mem_start = .;

}
