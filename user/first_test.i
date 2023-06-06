# 1 "user/first_test.c"
# 1 "/home/songyj/embedded_proj/rvos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "user/first_test.c"

char test_str[] = "This is a load test\n";
char test1[] = "QWER";
char test2[] = "ASDF";
char test3[] = "ZXCV";
char test4[] = "!@#$";

void delay(int val)
{
 for(int n=0; n<1000; n++)
 {
  for(int i=0; i<1000; i++)
  {

  }
 }
}

int main()
{
 unsigned long pid = 0;
 for(int n=0; n<20; n++)
 {
  print(test_str[n]);
 }

 int open_fd = open("/test_rd.txt", 0);
 print('_');
 print(open_fd+'0');
 print('_');

 char rd_buf[10] = {0};
 char wr_buf[] = "WRITE_TEST_STR";
 read(open_fd, rd_buf, 5);
 write(open_fd, wr_buf, 5);
 for(int n=0; n<5; n++)
 {
  print(rd_buf[n]);
 }

 char buf[10] = {0};
 int fd[2] = {0};
 pipe(fd);

 pid = fork();

 if(pid != 0)
 {
  print('p');
  print('\n');
  write(fd[0], "QWER", 4);
  write(fd[0], "ASDF", 4);
  write(fd[0], "ZXCV", 4);
  write(fd[0], "!@#$", 4);
  print('o');
  print('v');
  print('e');
  print('r');
  print('\n');
 }
 else
 {
  print('c');
  print('\n');
  read(fd[1], buf, 4);
  print('1');
  print(buf[0]);
  print(buf[1]);
  print(buf[2]);
  print(buf[3]);
  print('\n');
  read(fd[1], buf, 4);
  print('2');
  print(buf[0]);
  print(buf[1]);
  print(buf[2]);
  print(buf[3]);
  print('\n');
  read(fd[1], buf, 4);
  print('3');
  print(buf[0]);
  print(buf[1]);
  print(buf[2]);
  print(buf[3]);
  print('\n');
  sleep(50);
  read(fd[1], buf, 4);
  print('4');
  print(buf[0]);
  print(buf[1]);
  print(buf[2]);
  print(buf[3]);
  print('\n');
  print('o');
  print('v');
  print('e');
  print('r');
  print('\n');
 }

 if(pid)
 {

  print('a');
 }

 while(1)
 {
  if(pid)
  {
   print('1');
   delay(10000);
  }
  else
  {
   print('2');
   delay(10000);
  }
 }
}
