#include "types.h"
#include "stat.h"
#include "user.h"

char buf[512];

void
more(int fd,int screensize)
{
  int n,line;
  char c,console[10];

  line=screensize-1;

  while((n = read(fd, &c, sizeof(char))) > 0 ){
    //write(1, buf, n);
    write(1, &c, n);//文字出力
    
    if (c=='\n'){//改行コードを検出
      line--;
    }  

    if(n < 0){
      printf(1, "cat: read error\n");
      exit();
    }
    
    if(line<0){
      while(console[0]!=' '){
        read(0,console,sizeof(console));
      } 
/*      while(console[0]!='\n'){
        read(0,console,sizeof(console));
      }
*/
       line=screensize;
       console[0]=0;
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
    exit();
  }
}

int
main(int argc, char *argv[])
{
  int fd=0, i;
  int screensize=30;

  if(argc <= 1){
//    cat(0);
    printf(1, "usege: more [filename]");
    exit();
  }


  for(i = 1; i < argc; i++){

    if((*argv[i]=='-') && (*(argv[i]+1)=='n')){
      if((i+2>=argc) || (fd = open(argv[i+2], 0)) < 0){
        printf(1, "more: cannot open %s\n", argv[i+2]);
        exit();
      }
      screensize=atoi(argv[i+1]);
      more(fd,screensize);
      close(fd);
      i++;
      i++;
    }else{
      if((fd = open(argv[i], 0)) < 0){
        printf(1, "more: cannot open %s\n", argv[i]);
        exit();
      }
    more(fd,screensize);
    close(fd);
    }
  }
  exit();
}
