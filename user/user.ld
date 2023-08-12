OUTPUT_ARCH( "riscv" )
ENTRY( main )


SECTIONS
{
 . = 0x0;

  .text : {
    *(.text .text.*)
    . = ALIGN(0x1000);
  }

  . = ALIGN(16);
  .rodata : {
    *(.srodata .srodata.*) /* do not need to distinguish this from .rodata */
    . = ALIGN(16);
    *(.rodata .rodata.*)
    . = ALIGN(0x1000);
  }

  . = ALIGN(16);
  .data : {
    *(.sdata .sdata.*) /* do not need to distinguish this from .data */
    . = ALIGN(16);
    *(.data .data.*)
  }

  . = ALIGN(16);
  .bss : {
    *(.sbss .sbss.*) /* do not need to distinguish this from .bss */
    . = ALIGN(16);
    *(.bss .bss.*)
  }

  PROVIDE(end = .);
}
