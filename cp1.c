#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char buf[512];

void cp1(int fdread,int fdwrite){
  int n;
  char buf[64];
  while((n = read(fdread, buf, sizeof(buf))) > 0 ){
    write(fdwrite, buf, n);//文字出力
  }
}

int
main(int argc, char *argv[])
{
  int fdread=0,fdwrite=0;

  if(argc <= 2){
    printf(1, "usege: cp [filename] [filename]\n");
    exit();
  }

  if((fdread = open(argv[1], 0)) < 0){
    printf(1, "cp: cannot open %s\n", argv[1]);
    exit();
  }
  if((fdwrite = open(argv[2], O_CREATE|O_RDWR)) < 0){
    printf(1, "cp: cannot open %s\n", argv[2]);
    exit();
  }
  cp1(fdread,fdwrite);
  close(fdread);
  close(fdwrite);  
  exit();
}
