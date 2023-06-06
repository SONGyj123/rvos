OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS
{
	. = 0x80000000,

	.text.boot :
	{
		*(.text.boot)
	}
	_stext = .;
	.text : 
	{
		*(.text)
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
	_edata = .;

	. = ALIGN(0x08),

	_sbss = .;
	.bss : 
	{
		*(.bss)
	}
	_ebss = .;
}
