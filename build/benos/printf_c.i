# 1 "src/printf.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/printf.c"
# 1 "/usr/lib/gcc/riscv64-unknown-elf/9.3.0/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/riscv64-unknown-elf/9.3.0/include/stdarg.h" 3 4

# 40 "/usr/lib/gcc/riscv64-unknown-elf/9.3.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 99 "/usr/lib/gcc/riscv64-unknown-elf/9.3.0/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 2 "src/printf.c" 2


# 3 "src/printf.c"
extern void uart_send_c(char c);

char *digit = "0123456789abcdef";

void print_int(unsigned int num, int base)
{
 char buf[16];
 int i = 0;

 for(; num/base != 0; i++)
 {
  buf[i] = digit[num%base];
  num /= base;
 }

 buf[i] = digit[num];

 while(i>-1)
 {
  uart_send_c(buf[i]);
  i--;
 }

 i = 0;
}

void printf(char *fmt, ...)
{
 va_list args;
 
# 32 "src/printf.c" 3 4
__builtin_va_start(
# 32 "src/printf.c"
args
# 32 "src/printf.c" 3 4
,
# 32 "src/printf.c"
fmt
# 32 "src/printf.c" 3 4
)
# 32 "src/printf.c"
                   ;

 for(; *fmt!=0;)
 {
  if(*fmt == '%')
  {
   switch(*++fmt)
   {
    case 'd':
     {
      print_int(
# 42 "src/printf.c" 3 4
               __builtin_va_arg(
# 42 "src/printf.c"
               args
# 42 "src/printf.c" 3 4
               ,
# 42 "src/printf.c"
               int
# 42 "src/printf.c" 3 4
               )
# 42 "src/printf.c"
                                , 10);
      break;
     }

    case 'x':
     {
      uart_send_c('0');
      uart_send_c('x');
      print_int(
# 50 "src/printf.c" 3 4
               __builtin_va_arg(
# 50 "src/printf.c"
               args
# 50 "src/printf.c" 3 4
               ,
# 50 "src/printf.c"
               int
# 50 "src/printf.c" 3 4
               )
# 50 "src/printf.c"
                                , 16);
      break;
     }

    case 'p':
    {
     uart_send_c('0');
     uart_send_c('x');
     print_int(
# 58 "src/printf.c" 3 4
              __builtin_va_arg(
# 58 "src/printf.c"
              args
# 58 "src/printf.c" 3 4
              ,
# 58 "src/printf.c"
              int
# 58 "src/printf.c" 3 4
              )
# 58 "src/printf.c"
                               , 16);
     break;
    }

    default:
     {
      uart_send_c('%');
      uart_send_c(*fmt);
      break;
     }
   }
  }
  else
  {
   uart_send_c(*fmt);
  }

  fmt++;
 }

 
# 78 "src/printf.c" 3 4
__builtin_va_end(
# 78 "src/printf.c"
args
# 78 "src/printf.c" 3 4
)
# 78 "src/printf.c"
            ;
}

void panic(char *s)
{
 printf("panic: ");
 printf(s);
 printf("\n");
 while(1);
}
