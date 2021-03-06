#include "types.h"
#include "stat.h"
#include "user.h"

char buf[512];

void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
    write(1, buf, n);
  if(n < 0){
    printf(1, "cat: read error\n");
    exit();
  }
}

void cat2(int fd){
  int n,linenum=2,flag=0;;
  char c;
  printf(1, "1\t");
  while((n = read(fd, &c, sizeof(char))) >0){

    if(flag==1){//前の文字が改行コードの場合は行番号を出力
      printf(1, "%d\t", linenum);
      linenum++;
    }
    write(1, &c, n);//文字出力
    flag=0;//flagの初期化
    
    if (c=='\n'){//改行コードを検出
      flag=1;
    }  

    if(n < 0){
      printf(1, "cat: read error\n");
      exit();
    }
    
  }

}

int
main(int argc, char *argv[])
{
  int fd=0, i;

  if(argc <= 1){
    cat(0);
    exit();
  }


  for(i = 1; i < argc; i++){

    if((*argv[i]=='-') && (*(argv[i]+1)=='n')){
      if((i+1>=argc) || (fd = open(argv[i+1], 0)) < 0){
        printf(1, "cat: cannot open %s\n", argv[i+1]);
        exit();
      }
      cat2(fd);
      close(fd);
      i++;
    }else{
      if((fd = open(argv[i], 0)) < 0){
        printf(1, "cat: cannot open %s\n", argv[i]);
        exit();
      }
    cat(fd);
    close(fd);
    }
  }
  exit();
}
