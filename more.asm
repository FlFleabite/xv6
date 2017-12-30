
_more:     ファイル形式 elf32-i386


セクション .text の逆アセンブル:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 71 04             	mov    0x4(%ecx),%esi
  19:	c7 45 dc 1e 00 00 00 	movl   $0x1e,-0x24(%ebp)
  int fd=0, i;
  int screensize=30;

  if(argc <= 1){
  20:	83 f8 01             	cmp    $0x1,%eax
  }
}

int
main(int argc, char *argv[])
{
  23:	89 45 e0             	mov    %eax,-0x20(%ebp)
  int fd=0, i;
  int screensize=30;

  if(argc <= 1){
  26:	0f 8e d6 00 00 00    	jle    102 <main+0x102>
  2c:	bb 01 00 00 00       	mov    $0x1,%ebx
  31:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  34:	eb 41                	jmp    77 <main+0x77>
  36:	8d 76 00             	lea    0x0(%esi),%esi
  39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      more(fd,screensize);
      close(fd);
      i++;
      i++;
    }else{
      if((fd = open(argv[i], 0)) < 0){
  40:	83 ec 08             	sub    $0x8,%esp
  43:	6a 00                	push   $0x0
  45:	50                   	push   %eax
  46:	e8 07 04 00 00       	call   452 <open>
  4b:	83 c4 10             	add    $0x10,%esp
  4e:	85 c0                	test   %eax,%eax
  50:	89 c7                	mov    %eax,%edi
  52:	0f 88 96 00 00 00    	js     ee <main+0xee>
        printf(1, "more: cannot open %s\n", argv[i]);
        exit();
      }
    more(fd,screensize);
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	ff 75 dc             	pushl  -0x24(%ebp)
    printf(1, "usege: more [filename]");
    exit();
  }


  for(i = 1; i < argc; i++){
  5e:	83 c3 01             	add    $0x1,%ebx
    }else{
      if((fd = open(argv[i], 0)) < 0){
        printf(1, "more: cannot open %s\n", argv[i]);
        exit();
      }
    more(fd,screensize);
  61:	50                   	push   %eax
  62:	e8 c9 00 00 00       	call   130 <more>
    close(fd);
  67:	89 3c 24             	mov    %edi,(%esp)
  6a:	e8 cb 03 00 00       	call   43a <close>
  6f:	83 c4 10             	add    $0x10,%esp
    printf(1, "usege: more [filename]");
    exit();
  }


  for(i = 1; i < argc; i++){
  72:	39 5d e0             	cmp    %ebx,-0x20(%ebp)
  75:	7e 72                	jle    e9 <main+0xe9>

    if((*argv[i]=='-') && (*(argv[i]+1)=='n')){
  77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  7a:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
  81:	89 d9                	mov    %ebx,%ecx
  83:	8d 34 38             	lea    (%eax,%edi,1),%esi
  86:	8b 06                	mov    (%esi),%eax
  88:	80 38 2d             	cmpb   $0x2d,(%eax)
  8b:	75 b3                	jne    40 <main+0x40>
  8d:	80 78 01 6e          	cmpb   $0x6e,0x1(%eax)
  91:	75 ad                	jne    40 <main+0x40>
      if((i+2>=argc) || (fd = open(argv[i+2], 0)) < 0){
  93:	83 c3 02             	add    $0x2,%ebx
  96:	39 5d e0             	cmp    %ebx,-0x20(%ebp)
  99:	7e 7a                	jle    115 <main+0x115>
  9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  9e:	83 ec 08             	sub    $0x8,%esp
  a1:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  a4:	6a 00                	push   $0x0
  a6:	ff 74 38 08          	pushl  0x8(%eax,%edi,1)
  aa:	e8 a3 03 00 00       	call   452 <open>
  af:	83 c4 10             	add    $0x10,%esp
  b2:	85 c0                	test   %eax,%eax
  b4:	89 c6                	mov    %eax,%esi
  b6:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  b9:	78 5a                	js     115 <main+0x115>
        printf(1, "more: cannot open %s\n", argv[i+2]);
        exit();
      }
      screensize=atoi(argv[i+1]);
  bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  be:	83 ec 0c             	sub    $0xc,%esp
    printf(1, "usege: more [filename]");
    exit();
  }


  for(i = 1; i < argc; i++){
  c1:	83 c3 01             	add    $0x1,%ebx
    if((*argv[i]=='-') && (*(argv[i]+1)=='n')){
      if((i+2>=argc) || (fd = open(argv[i+2], 0)) < 0){
        printf(1, "more: cannot open %s\n", argv[i+2]);
        exit();
      }
      screensize=atoi(argv[i+1]);
  c4:	ff 74 38 04          	pushl  0x4(%eax,%edi,1)
  c8:	e8 d3 02 00 00       	call   3a0 <atoi>
      more(fd,screensize);
  cd:	5a                   	pop    %edx
  ce:	59                   	pop    %ecx
  cf:	50                   	push   %eax
  d0:	56                   	push   %esi
    if((*argv[i]=='-') && (*(argv[i]+1)=='n')){
      if((i+2>=argc) || (fd = open(argv[i+2], 0)) < 0){
        printf(1, "more: cannot open %s\n", argv[i+2]);
        exit();
      }
      screensize=atoi(argv[i+1]);
  d1:	89 45 dc             	mov    %eax,-0x24(%ebp)
      more(fd,screensize);
  d4:	e8 57 00 00 00       	call   130 <more>
      close(fd);
  d9:	89 34 24             	mov    %esi,(%esp)
  dc:	e8 59 03 00 00       	call   43a <close>
      i++;
      i++;
  e1:	83 c4 10             	add    $0x10,%esp
    printf(1, "usege: more [filename]");
    exit();
  }


  for(i = 1; i < argc; i++){
  e4:	39 5d e0             	cmp    %ebx,-0x20(%ebp)
  e7:	7f 8e                	jg     77 <main+0x77>
      }
    more(fd,screensize);
    close(fd);
    }
  }
  exit();
  e9:	e8 24 03 00 00       	call   412 <exit>
      close(fd);
      i++;
      i++;
    }else{
      if((fd = open(argv[i], 0)) < 0){
        printf(1, "more: cannot open %s\n", argv[i]);
  ee:	50                   	push   %eax
  ef:	ff 36                	pushl  (%esi)
  f1:	68 b8 08 00 00       	push   $0x8b8
  f6:	6a 01                	push   $0x1
  f8:	e8 73 04 00 00       	call   570 <printf>
        exit();
  fd:	e8 10 03 00 00       	call   412 <exit>
  int fd=0, i;
  int screensize=30;

  if(argc <= 1){
//    cat(0);
    printf(1, "usege: more [filename]");
 102:	56                   	push   %esi
 103:	56                   	push   %esi
 104:	68 a1 08 00 00       	push   $0x8a1
 109:	6a 01                	push   $0x1
 10b:	e8 60 04 00 00       	call   570 <printf>
    exit();
 110:	e8 fd 02 00 00       	call   412 <exit>
 115:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  for(i = 1; i < argc; i++){

    if((*argv[i]=='-') && (*(argv[i]+1)=='n')){
      if((i+2>=argc) || (fd = open(argv[i+2], 0)) < 0){
        printf(1, "more: cannot open %s\n", argv[i+2]);
 118:	53                   	push   %ebx
 119:	ff 74 8e 08          	pushl  0x8(%esi,%ecx,4)
 11d:	68 b8 08 00 00       	push   $0x8b8
 122:	6a 01                	push   $0x1
 124:	e8 47 04 00 00       	call   570 <printf>
        exit();
 129:	e8 e4 02 00 00       	call   412 <exit>
 12e:	66 90                	xchg   %ax,%ax

00000130 <more>:

char buf[512];

void
more(int fd,int screensize)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	56                   	push   %esi
 135:	53                   	push   %ebx
 136:	8d 75 dd             	lea    -0x23(%ebp),%esi
 139:	83 ec 1c             	sub    $0x1c,%esp
  int n,line;
  char c,console[10];

  line=screensize-1;
 13c:	8b 45 0c             	mov    0xc(%ebp),%eax

char buf[512];

void
more(int fd,int screensize)
{
 13f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int n,line;
  char c,console[10];

  line=screensize-1;
 142:	8d 58 ff             	lea    -0x1(%eax),%ebx

  while((n = read(fd, &c, sizeof(char))) > 0 ){
 145:	eb 25                	jmp    16c <more+0x3c>
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    //write(1, buf, n);
    write(1, &c, n);//文字出力
 150:	83 ec 04             	sub    $0x4,%esp
 153:	50                   	push   %eax
 154:	56                   	push   %esi
 155:	6a 01                	push   $0x1
 157:	e8 d6 02 00 00       	call   432 <write>
    
    if (c=='\n'){//改行コードを検出
      line--;
 15c:	31 c0                	xor    %eax,%eax

  while((n = read(fd, &c, sizeof(char))) > 0 ){
    //write(1, buf, n);
    write(1, &c, n);//文字出力
    
    if (c=='\n'){//改行コードを検出
 15e:	83 c4 10             	add    $0x10,%esp
      line--;
 161:	80 7d dd 0a          	cmpb   $0xa,-0x23(%ebp)
 165:	0f 94 c0             	sete   %al
    if(n < 0){
      printf(1, "cat: read error\n");
      exit();
    }
    
    if(line<0){
 168:	29 c3                	sub    %eax,%ebx
 16a:	78 37                	js     1a3 <more+0x73>
  int n,line;
  char c,console[10];

  line=screensize-1;

  while((n = read(fd, &c, sizeof(char))) > 0 ){
 16c:	83 ec 04             	sub    $0x4,%esp
 16f:	6a 01                	push   $0x1
 171:	56                   	push   %esi
 172:	57                   	push   %edi
 173:	e8 b2 02 00 00       	call   42a <read>
 178:	83 c4 10             	add    $0x10,%esp
 17b:	83 f8 00             	cmp    $0x0,%eax
 17e:	7f d0                	jg     150 <more+0x20>
*/
       line=screensize;
       console[0]=0;
    }
  }
  if(n < 0){
 180:	75 30                	jne    1b2 <more+0x82>
    printf(1, "cat: read error\n");
    exit();
  }
}
 182:	8d 65 f4             	lea    -0xc(%ebp),%esp
 185:	5b                   	pop    %ebx
 186:	5e                   	pop    %esi
 187:	5f                   	pop    %edi
 188:	5d                   	pop    %ebp
 189:	c3                   	ret    
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
    }
    
    if(line<0){
      while(console[0]!=' '){
        read(0,console,sizeof(console));
 190:	8d 45 de             	lea    -0x22(%ebp),%eax
 193:	83 ec 04             	sub    $0x4,%esp
 196:	6a 0a                	push   $0xa
 198:	50                   	push   %eax
 199:	6a 00                	push   $0x0
 19b:	e8 8a 02 00 00       	call   42a <read>
      printf(1, "cat: read error\n");
      exit();
    }
    
    if(line<0){
      while(console[0]!=' '){
 1a0:	83 c4 10             	add    $0x10,%esp
 1a3:	80 7d de 20          	cmpb   $0x20,-0x22(%ebp)
 1a7:	75 e7                	jne    190 <more+0x60>
/*      while(console[0]!='\n'){
        read(0,console,sizeof(console));
      }
*/
       line=screensize;
       console[0]=0;
 1a9:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
      } 
/*      while(console[0]!='\n'){
        read(0,console,sizeof(console));
      }
*/
       line=screensize;
 1ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1b0:	eb ba                	jmp    16c <more+0x3c>
       console[0]=0;
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
 1b2:	83 ec 08             	sub    $0x8,%esp
 1b5:	68 90 08 00 00       	push   $0x890
 1ba:	6a 01                	push   $0x1
 1bc:	e8 af 03 00 00       	call   570 <printf>
    exit();
 1c1:	e8 4c 02 00 00       	call   412 <exit>
 1c6:	66 90                	xchg   %ax,%ax
 1c8:	66 90                	xchg   %ax,%ax
 1ca:	66 90                	xchg   %ax,%ax
 1cc:	66 90                	xchg   %ax,%ax
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1da:	89 c2                	mov    %eax,%edx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e0:	83 c1 01             	add    $0x1,%ecx
 1e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1e7:	83 c2 01             	add    $0x1,%edx
 1ea:	84 db                	test   %bl,%bl
 1ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 1ef:	75 ef                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1f1:	5b                   	pop    %ebx
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	8b 55 08             	mov    0x8(%ebp),%edx
 208:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20b:	0f b6 02             	movzbl (%edx),%eax
 20e:	0f b6 19             	movzbl (%ecx),%ebx
 211:	84 c0                	test   %al,%al
 213:	75 1e                	jne    233 <strcmp+0x33>
 215:	eb 29                	jmp    240 <strcmp+0x40>
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 220:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 223:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 226:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 229:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 22d:	84 c0                	test   %al,%al
 22f:	74 0f                	je     240 <strcmp+0x40>
 231:	89 f1                	mov    %esi,%ecx
 233:	38 d8                	cmp    %bl,%al
 235:	74 e9                	je     220 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 237:	29 d8                	sub    %ebx,%eax
}
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 240:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 242:	29 d8                	sub    %ebx,%eax
}
 244:	5b                   	pop    %ebx
 245:	5e                   	pop    %esi
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <strlen>:

uint
strlen(char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 39 00             	cmpb   $0x0,(%ecx)
 259:	74 12                	je     26d <strlen+0x1d>
 25b:	31 d2                	xor    %edx,%edx
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c2 01             	add    $0x1,%edx
 263:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 267:	89 d0                	mov    %edx,%eax
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 26d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	eb 0d                	jmp    280 <memset>
 273:	90                   	nop
 274:	90                   	nop
 275:	90                   	nop
 276:	90                   	nop
 277:	90                   	nop
 278:	90                   	nop
 279:	90                   	nop
 27a:	90                   	nop
 27b:	90                   	nop
 27c:	90                   	nop
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	89 d0                	mov    %edx,%eax
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	84 d2                	test   %dl,%dl
 2af:	74 1d                	je     2ce <strchr+0x2e>
    if(*s == c)
 2b1:	38 d3                	cmp    %dl,%bl
 2b3:	89 d9                	mov    %ebx,%ecx
 2b5:	75 0d                	jne    2c4 <strchr+0x24>
 2b7:	eb 17                	jmp    2d0 <strchr+0x30>
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c0:	38 ca                	cmp    %cl,%dl
 2c2:	74 0c                	je     2d0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2c4:	83 c0 01             	add    $0x1,%eax
 2c7:	0f b6 10             	movzbl (%eax),%edx
 2ca:	84 d2                	test   %dl,%dl
 2cc:	75 f2                	jne    2c0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2ce:	31 c0                	xor    %eax,%eax
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 2e8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 2eb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ee:	eb 29                	jmp    319 <gets+0x39>
    cc = read(0, &c, 1);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	6a 01                	push   $0x1
 2f5:	57                   	push   %edi
 2f6:	6a 00                	push   $0x0
 2f8:	e8 2d 01 00 00       	call   42a <read>
    if(cc < 1)
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	85 c0                	test   %eax,%eax
 302:	7e 1d                	jle    321 <gets+0x41>
      break;
    buf[i++] = c;
 304:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 308:	8b 55 08             	mov    0x8(%ebp),%edx
 30b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 30d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 30f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 313:	74 1b                	je     330 <gets+0x50>
 315:	3c 0d                	cmp    $0xd,%al
 317:	74 17                	je     330 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 319:	8d 5e 01             	lea    0x1(%esi),%ebx
 31c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31f:	7c cf                	jl     2f0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 321:	8b 45 08             	mov    0x8(%ebp),%eax
 324:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 328:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32b:	5b                   	pop    %ebx
 32c:	5e                   	pop    %esi
 32d:	5f                   	pop    %edi
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 330:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 333:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 335:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 339:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33c:	5b                   	pop    %ebx
 33d:	5e                   	pop    %esi
 33e:	5f                   	pop    %edi
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	eb 0d                	jmp    350 <stat>
 343:	90                   	nop
 344:	90                   	nop
 345:	90                   	nop
 346:	90                   	nop
 347:	90                   	nop
 348:	90                   	nop
 349:	90                   	nop
 34a:	90                   	nop
 34b:	90                   	nop
 34c:	90                   	nop
 34d:	90                   	nop
 34e:	90                   	nop
 34f:	90                   	nop

00000350 <stat>:

int
stat(char *n, struct stat *st)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 00                	push   $0x0
 35a:	ff 75 08             	pushl  0x8(%ebp)
 35d:	e8 f0 00 00 00       	call   452 <open>
  if(fd < 0)
 362:	83 c4 10             	add    $0x10,%esp
 365:	85 c0                	test   %eax,%eax
 367:	78 27                	js     390 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 369:	83 ec 08             	sub    $0x8,%esp
 36c:	ff 75 0c             	pushl  0xc(%ebp)
 36f:	89 c3                	mov    %eax,%ebx
 371:	50                   	push   %eax
 372:	e8 f3 00 00 00       	call   46a <fstat>
 377:	89 c6                	mov    %eax,%esi
  close(fd);
 379:	89 1c 24             	mov    %ebx,(%esp)
 37c:	e8 b9 00 00 00       	call   43a <close>
  return r;
 381:	83 c4 10             	add    $0x10,%esp
 384:	89 f0                	mov    %esi,%eax
}
 386:	8d 65 f8             	lea    -0x8(%ebp),%esp
 389:	5b                   	pop    %ebx
 38a:	5e                   	pop    %esi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 390:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 395:	eb ef                	jmp    386 <stat+0x36>
 397:	89 f6                	mov    %esi,%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a7:	0f be 11             	movsbl (%ecx),%edx
 3aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 3ad:	3c 09                	cmp    $0x9,%al
 3af:	b8 00 00 00 00       	mov    $0x0,%eax
 3b4:	77 1f                	ja     3d5 <atoi+0x35>
 3b6:	8d 76 00             	lea    0x0(%esi),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 3c0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3c3:	83 c1 01             	add    $0x1,%ecx
 3c6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ca:	0f be 11             	movsbl (%ecx),%edx
 3cd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3d0:	80 fb 09             	cmp    $0x9,%bl
 3d3:	76 eb                	jbe    3c0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 3d5:	5b                   	pop    %ebx
 3d6:	5d                   	pop    %ebp
 3d7:	c3                   	ret    
 3d8:	90                   	nop
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003e0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
 3e5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3e8:	8b 45 08             	mov    0x8(%ebp),%eax
 3eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ee:	85 db                	test   %ebx,%ebx
 3f0:	7e 14                	jle    406 <memmove+0x26>
 3f2:	31 d2                	xor    %edx,%edx
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3ff:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 402:	39 da                	cmp    %ebx,%edx
 404:	75 f2                	jne    3f8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 406:	5b                   	pop    %ebx
 407:	5e                   	pop    %esi
 408:	5d                   	pop    %ebp
 409:	c3                   	ret    

0000040a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40a:	b8 01 00 00 00       	mov    $0x1,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <exit>:
SYSCALL(exit)
 412:	b8 02 00 00 00       	mov    $0x2,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <wait>:
SYSCALL(wait)
 41a:	b8 03 00 00 00       	mov    $0x3,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <pipe>:
SYSCALL(pipe)
 422:	b8 04 00 00 00       	mov    $0x4,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <read>:
SYSCALL(read)
 42a:	b8 05 00 00 00       	mov    $0x5,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <write>:
SYSCALL(write)
 432:	b8 10 00 00 00       	mov    $0x10,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <close>:
SYSCALL(close)
 43a:	b8 15 00 00 00       	mov    $0x15,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <kill>:
SYSCALL(kill)
 442:	b8 06 00 00 00       	mov    $0x6,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <exec>:
SYSCALL(exec)
 44a:	b8 07 00 00 00       	mov    $0x7,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <open>:
SYSCALL(open)
 452:	b8 0f 00 00 00       	mov    $0xf,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <mknod>:
SYSCALL(mknod)
 45a:	b8 11 00 00 00       	mov    $0x11,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <unlink>:
SYSCALL(unlink)
 462:	b8 12 00 00 00       	mov    $0x12,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <fstat>:
SYSCALL(fstat)
 46a:	b8 08 00 00 00       	mov    $0x8,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <link>:
SYSCALL(link)
 472:	b8 13 00 00 00       	mov    $0x13,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <mkdir>:
SYSCALL(mkdir)
 47a:	b8 14 00 00 00       	mov    $0x14,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <chdir>:
SYSCALL(chdir)
 482:	b8 09 00 00 00       	mov    $0x9,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <dup>:
SYSCALL(dup)
 48a:	b8 0a 00 00 00       	mov    $0xa,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <getpid>:
SYSCALL(getpid)
 492:	b8 0b 00 00 00       	mov    $0xb,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <sbrk>:
SYSCALL(sbrk)
 49a:	b8 0c 00 00 00       	mov    $0xc,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <sleep>:
SYSCALL(sleep)
 4a2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <uptime>:
SYSCALL(uptime)
 4aa:	b8 0e 00 00 00       	mov    $0xe,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <lock>:
SYSCALL(lock)			// for lock-related system call
 4b2:	b8 16 00 00 00       	mov    $0x16,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <unlock>:
 4ba:	b8 17 00 00 00       	mov    $0x17,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    
 4c2:	66 90                	xchg   %ax,%ax
 4c4:	66 90                	xchg   %ax,%ax
 4c6:	66 90                	xchg   %ax,%ax
 4c8:	66 90                	xchg   %ax,%ax
 4ca:	66 90                	xchg   %ax,%ax
 4cc:	66 90                	xchg   %ax,%ax
 4ce:	66 90                	xchg   %ax,%ax

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	89 c6                	mov    %eax,%esi
 4d8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4de:	85 db                	test   %ebx,%ebx
 4e0:	74 7e                	je     560 <printint+0x90>
 4e2:	89 d0                	mov    %edx,%eax
 4e4:	c1 e8 1f             	shr    $0x1f,%eax
 4e7:	84 c0                	test   %al,%al
 4e9:	74 75                	je     560 <printint+0x90>
    neg = 1;
    x = -xx;
 4eb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 4ed:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 4f4:	f7 d8                	neg    %eax
 4f6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4f9:	31 ff                	xor    %edi,%edi
 4fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4fe:	89 ce                	mov    %ecx,%esi
 500:	eb 08                	jmp    50a <printint+0x3a>
 502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 508:	89 cf                	mov    %ecx,%edi
 50a:	31 d2                	xor    %edx,%edx
 50c:	8d 4f 01             	lea    0x1(%edi),%ecx
 50f:	f7 f6                	div    %esi
 511:	0f b6 92 d8 08 00 00 	movzbl 0x8d8(%edx),%edx
  }while((x /= base) != 0);
 518:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 51a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 51d:	75 e9                	jne    508 <printint+0x38>
  if(neg)
 51f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 522:	8b 75 c0             	mov    -0x40(%ebp),%esi
 525:	85 c0                	test   %eax,%eax
 527:	74 08                	je     531 <printint+0x61>
    buf[i++] = '-';
 529:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 52e:	8d 4f 02             	lea    0x2(%edi),%ecx
 531:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 535:	8d 76 00             	lea    0x0(%esi),%esi
 538:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 53b:	83 ec 04             	sub    $0x4,%esp
 53e:	83 ef 01             	sub    $0x1,%edi
 541:	6a 01                	push   $0x1
 543:	53                   	push   %ebx
 544:	56                   	push   %esi
 545:	88 45 d7             	mov    %al,-0x29(%ebp)
 548:	e8 e5 fe ff ff       	call   432 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 54d:	83 c4 10             	add    $0x10,%esp
 550:	39 df                	cmp    %ebx,%edi
 552:	75 e4                	jne    538 <printint+0x68>
    putc(fd, buf[i]);
}
 554:	8d 65 f4             	lea    -0xc(%ebp),%esp
 557:	5b                   	pop    %ebx
 558:	5e                   	pop    %esi
 559:	5f                   	pop    %edi
 55a:	5d                   	pop    %ebp
 55b:	c3                   	ret    
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 560:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 562:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 569:	eb 8b                	jmp    4f6 <printint+0x26>
 56b:	90                   	nop
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000570 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
 575:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 576:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 579:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 57c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 57f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 582:	89 45 d0             	mov    %eax,-0x30(%ebp)
 585:	0f b6 1e             	movzbl (%esi),%ebx
 588:	83 c6 01             	add    $0x1,%esi
 58b:	84 db                	test   %bl,%bl
 58d:	0f 84 b0 00 00 00    	je     643 <printf+0xd3>
 593:	31 d2                	xor    %edx,%edx
 595:	eb 39                	jmp    5d0 <printf+0x60>
 597:	89 f6                	mov    %esi,%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5a0:	83 f8 25             	cmp    $0x25,%eax
 5a3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 5a6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5ab:	74 18                	je     5c5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ad:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 5b6:	6a 01                	push   $0x1
 5b8:	50                   	push   %eax
 5b9:	57                   	push   %edi
 5ba:	e8 73 fe ff ff       	call   432 <write>
 5bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5c2:	83 c4 10             	add    $0x10,%esp
 5c5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5cc:	84 db                	test   %bl,%bl
 5ce:	74 73                	je     643 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 5d0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 5d2:	0f be cb             	movsbl %bl,%ecx
 5d5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5d8:	74 c6                	je     5a0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5da:	83 fa 25             	cmp    $0x25,%edx
 5dd:	75 e6                	jne    5c5 <printf+0x55>
      if(c == 'd'){
 5df:	83 f8 64             	cmp    $0x64,%eax
 5e2:	0f 84 f8 00 00 00    	je     6e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5e8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5ee:	83 f9 70             	cmp    $0x70,%ecx
 5f1:	74 5d                	je     650 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5f3:	83 f8 73             	cmp    $0x73,%eax
 5f6:	0f 84 84 00 00 00    	je     680 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5fc:	83 f8 63             	cmp    $0x63,%eax
 5ff:	0f 84 ea 00 00 00    	je     6ef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 605:	83 f8 25             	cmp    $0x25,%eax
 608:	0f 84 c2 00 00 00    	je     6d0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 60e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 611:	83 ec 04             	sub    $0x4,%esp
 614:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 618:	6a 01                	push   $0x1
 61a:	50                   	push   %eax
 61b:	57                   	push   %edi
 61c:	e8 11 fe ff ff       	call   432 <write>
 621:	83 c4 0c             	add    $0xc,%esp
 624:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 627:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 62a:	6a 01                	push   $0x1
 62c:	50                   	push   %eax
 62d:	57                   	push   %edi
 62e:	83 c6 01             	add    $0x1,%esi
 631:	e8 fc fd ff ff       	call   432 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 636:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 63a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 63d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 63f:	84 db                	test   %bl,%bl
 641:	75 8d                	jne    5d0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 643:	8d 65 f4             	lea    -0xc(%ebp),%esp
 646:	5b                   	pop    %ebx
 647:	5e                   	pop    %esi
 648:	5f                   	pop    %edi
 649:	5d                   	pop    %ebp
 64a:	c3                   	ret    
 64b:	90                   	nop
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 10 00 00 00       	mov    $0x10,%ecx
 658:	6a 00                	push   $0x0
 65a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 65d:	89 f8                	mov    %edi,%eax
 65f:	8b 13                	mov    (%ebx),%edx
 661:	e8 6a fe ff ff       	call   4d0 <printint>
        ap++;
 666:	89 d8                	mov    %ebx,%eax
 668:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 66b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 66d:	83 c0 04             	add    $0x4,%eax
 670:	89 45 d0             	mov    %eax,-0x30(%ebp)
 673:	e9 4d ff ff ff       	jmp    5c5 <printf+0x55>
 678:	90                   	nop
 679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 680:	8b 45 d0             	mov    -0x30(%ebp),%eax
 683:	8b 18                	mov    (%eax),%ebx
        ap++;
 685:	83 c0 04             	add    $0x4,%eax
 688:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 68b:	b8 ce 08 00 00       	mov    $0x8ce,%eax
 690:	85 db                	test   %ebx,%ebx
 692:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 695:	0f b6 03             	movzbl (%ebx),%eax
 698:	84 c0                	test   %al,%al
 69a:	74 23                	je     6bf <printf+0x14f>
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6a0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6a3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 6a6:	83 ec 04             	sub    $0x4,%esp
 6a9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 6ab:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6ae:	50                   	push   %eax
 6af:	57                   	push   %edi
 6b0:	e8 7d fd ff ff       	call   432 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6b5:	0f b6 03             	movzbl (%ebx),%eax
 6b8:	83 c4 10             	add    $0x10,%esp
 6bb:	84 c0                	test   %al,%al
 6bd:	75 e1                	jne    6a0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 ff fe ff ff       	jmp    5c5 <printf+0x55>
 6c6:	8d 76 00             	lea    0x0(%esi),%esi
 6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
 6d3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6d9:	6a 01                	push   $0x1
 6db:	e9 4c ff ff ff       	jmp    62c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	e9 6b ff ff ff       	jmp    65a <printf+0xea>
 6ef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6f2:	83 ec 04             	sub    $0x4,%esp
 6f5:	8b 03                	mov    (%ebx),%eax
 6f7:	6a 01                	push   $0x1
 6f9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 6fc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6ff:	50                   	push   %eax
 700:	57                   	push   %edi
 701:	e8 2c fd ff ff       	call   432 <write>
 706:	e9 5b ff ff ff       	jmp    666 <printf+0xf6>
 70b:	66 90                	xchg   %ax,%ax
 70d:	66 90                	xchg   %ax,%ax
 70f:	90                   	nop

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 c0 0b 00 00       	mov    0xbc0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 71e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 720:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 723:	39 c8                	cmp    %ecx,%eax
 725:	73 19                	jae    740 <free+0x30>
 727:	89 f6                	mov    %esi,%esi
 729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 730:	39 d1                	cmp    %edx,%ecx
 732:	72 1c                	jb     750 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 734:	39 d0                	cmp    %edx,%eax
 736:	73 18                	jae    750 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 738:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73e:	72 f0                	jb     730 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	39 d0                	cmp    %edx,%eax
 742:	72 f4                	jb     738 <free+0x28>
 744:	39 d1                	cmp    %edx,%ecx
 746:	73 f0                	jae    738 <free+0x28>
 748:	90                   	nop
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 750:	8b 73 fc             	mov    -0x4(%ebx),%esi
 753:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 756:	39 d7                	cmp    %edx,%edi
 758:	74 19                	je     773 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 75a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 50 04             	mov    0x4(%eax),%edx
 760:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 763:	39 f1                	cmp    %esi,%ecx
 765:	74 23                	je     78a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 767:	89 08                	mov    %ecx,(%eax)
  freep = p;
 769:	a3 c0 0b 00 00       	mov    %eax,0xbc0
}
 76e:	5b                   	pop    %ebx
 76f:	5e                   	pop    %esi
 770:	5f                   	pop    %edi
 771:	5d                   	pop    %ebp
 772:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 773:	03 72 04             	add    0x4(%edx),%esi
 776:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 779:	8b 10                	mov    (%eax),%edx
 77b:	8b 12                	mov    (%edx),%edx
 77d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 780:	8b 50 04             	mov    0x4(%eax),%edx
 783:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 786:	39 f1                	cmp    %esi,%ecx
 788:	75 dd                	jne    767 <free+0x57>
    p->s.size += bp->s.size;
 78a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 78d:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 792:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 795:	8b 53 f8             	mov    -0x8(%ebx),%edx
 798:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 79a:	5b                   	pop    %ebx
 79b:	5e                   	pop    %esi
 79c:	5f                   	pop    %edi
 79d:	5d                   	pop    %ebp
 79e:	c3                   	ret    
 79f:	90                   	nop

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 15 c0 0b 00 00    	mov    0xbc0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 78 07             	lea    0x7(%eax),%edi
 7b5:	c1 ef 03             	shr    $0x3,%edi
 7b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7bb:	85 d2                	test   %edx,%edx
 7bd:	0f 84 a3 00 00 00    	je     866 <malloc+0xc6>
 7c3:	8b 02                	mov    (%edx),%eax
 7c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7c8:	39 cf                	cmp    %ecx,%edi
 7ca:	76 74                	jbe    840 <malloc+0xa0>
 7cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7d2:	be 00 10 00 00       	mov    $0x1000,%esi
 7d7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 7de:	0f 43 f7             	cmovae %edi,%esi
 7e1:	ba 00 80 00 00       	mov    $0x8000,%edx
 7e6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 7ec:	0f 46 da             	cmovbe %edx,%ebx
 7ef:	eb 10                	jmp    801 <malloc+0x61>
 7f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7fa:	8b 48 04             	mov    0x4(%eax),%ecx
 7fd:	39 cf                	cmp    %ecx,%edi
 7ff:	76 3f                	jbe    840 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 801:	39 05 c0 0b 00 00    	cmp    %eax,0xbc0
 807:	89 c2                	mov    %eax,%edx
 809:	75 ed                	jne    7f8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 80b:	83 ec 0c             	sub    $0xc,%esp
 80e:	53                   	push   %ebx
 80f:	e8 86 fc ff ff       	call   49a <sbrk>
  if(p == (char*)-1)
 814:	83 c4 10             	add    $0x10,%esp
 817:	83 f8 ff             	cmp    $0xffffffff,%eax
 81a:	74 1c                	je     838 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 81c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 81f:	83 ec 0c             	sub    $0xc,%esp
 822:	83 c0 08             	add    $0x8,%eax
 825:	50                   	push   %eax
 826:	e8 e5 fe ff ff       	call   710 <free>
  return freep;
 82b:	8b 15 c0 0b 00 00    	mov    0xbc0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 831:	83 c4 10             	add    $0x10,%esp
 834:	85 d2                	test   %edx,%edx
 836:	75 c0                	jne    7f8 <malloc+0x58>
        return 0;
 838:	31 c0                	xor    %eax,%eax
 83a:	eb 1c                	jmp    858 <malloc+0xb8>
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 840:	39 cf                	cmp    %ecx,%edi
 842:	74 1c                	je     860 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 844:	29 f9                	sub    %edi,%ecx
 846:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 849:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 84c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 84f:	89 15 c0 0b 00 00    	mov    %edx,0xbc0
      return (void*)(p + 1);
 855:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 858:	8d 65 f4             	lea    -0xc(%ebp),%esp
 85b:	5b                   	pop    %ebx
 85c:	5e                   	pop    %esi
 85d:	5f                   	pop    %edi
 85e:	5d                   	pop    %ebp
 85f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb e9                	jmp    84f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 866:	c7 05 c0 0b 00 00 c4 	movl   $0xbc4,0xbc0
 86d:	0b 00 00 
 870:	c7 05 c4 0b 00 00 c4 	movl   $0xbc4,0xbc4
 877:	0b 00 00 
    base.s.size = 0;
 87a:	b8 c4 0b 00 00       	mov    $0xbc4,%eax
 87f:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 886:	00 00 00 
 889:	e9 3e ff ff ff       	jmp    7cc <malloc+0x2c>
