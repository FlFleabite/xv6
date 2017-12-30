
_philosopher:     ファイル形式 elf32-i386


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
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int i, pid[N];

  for (i = 0; i < N; i++) {
   f:	31 db                	xor    %ebx,%ebx
	pid[i] = fork();
  11:	e8 44 04 00 00       	call   45a <fork>
	if (pid[i] == 0) {
  16:	85 c0                	test   %eax,%eax
  18:	74 12                	je     2c <main+0x2c>
int
main(int argc, char *argv[])
{
  int i, pid[N];

  for (i = 0; i < N; i++) {
  1a:	83 c3 01             	add    $0x1,%ebx
  1d:	83 fb 03             	cmp    $0x3,%ebx
  20:	75 ef                	jne    11 <main+0x11>
	  printf(1, "philosopher %d is created.\n", getpid());
	  philosopher1(i);
	  exit();
	}
  }
  wait();
  22:	e8 43 04 00 00       	call   46a <wait>
  exit();
  27:	e8 36 04 00 00       	call   462 <exit>
  int i, pid[N];

  for (i = 0; i < N; i++) {
	pid[i] = fork();
	if (pid[i] == 0) {
	  printf(1, "philosopher %d is created.\n", getpid());
  2c:	e8 b1 04 00 00       	call   4e2 <getpid>
  31:	52                   	push   %edx
  32:	50                   	push   %eax
  33:	68 cf 09 00 00       	push   $0x9cf
  38:	6a 01                	push   $0x1
  3a:	e8 81 05 00 00       	call   5c0 <printf>
	  philosopher1(i);
  3f:	89 1c 24             	mov    %ebx,(%esp)
  42:	e8 29 01 00 00       	call   170 <philosopher1>
  47:	66 90                	xchg   %ax,%ax
  49:	66 90                	xchg   %ax,%ax
  4b:	66 90                	xchg   %ax,%ax
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <take_fork>:

/*
 *  i 番目のフォークを取る
 */
void take_fork(int i)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  54:	83 ec 04             	sub    $0x4,%esp
  57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "philosopher %d is trying to take the fork %d.\n", getpid(), i);
  5a:	e8 83 04 00 00       	call   4e2 <getpid>
  5f:	53                   	push   %ebx
  60:	50                   	push   %eax
  61:	68 e0 08 00 00       	push   $0x8e0
  66:	6a 01                	push   $0x1
  68:	e8 53 05 00 00       	call   5c0 <printf>
  lock(i);
  6d:	89 1c 24             	mov    %ebx,(%esp)
  70:	e8 8d 04 00 00       	call   502 <lock>
  printf(1, "philosopher %d takes the fork %d.\n", getpid(), i);
  75:	e8 68 04 00 00       	call   4e2 <getpid>
  7a:	53                   	push   %ebx
  7b:	50                   	push   %eax
  7c:	68 10 09 00 00       	push   $0x910
  81:	6a 01                	push   $0x1
  83:	e8 38 05 00 00       	call   5c0 <printf>
}
  88:	83 c4 20             	add    $0x20,%esp
  8b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8e:	c9                   	leave  
  8f:	c3                   	ret    

00000090 <put_fork>:

/*
 *  i 番目のフォークを置く
 */
void put_fork(int i)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	83 ec 10             	sub    $0x10,%esp
  97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  unlock(i);	
  9a:	53                   	push   %ebx
  9b:	e8 6a 04 00 00       	call   50a <unlock>
  printf(1, "philosopher %d put the fork %d.\n", getpid(), i);
  a0:	e8 3d 04 00 00       	call   4e2 <getpid>
  a5:	53                   	push   %ebx
  a6:	50                   	push   %eax
  a7:	68 34 09 00 00       	push   $0x934
  ac:	6a 01                	push   $0x1
  ae:	e8 0d 05 00 00       	call   5c0 <printf>
}
  b3:	83 c4 20             	add    $0x20,%esp
  b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b9:	c9                   	leave  
  ba:	c3                   	ret    
  bb:	90                   	nop
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000c0 <think>:
 *  考える
 *
 *  考えた後，空腹になる．
 */
void think(int i)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	83 ec 14             	sub    $0x14,%esp
  sleep(3);			/* 考え中 */
  c6:	6a 03                	push   $0x3
  c8:	e8 25 04 00 00       	call   4f2 <sleep>

  lock(EX);
  cd:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
  d4:	e8 29 04 00 00       	call   502 <lock>
  state[i] = HUNGRY;
  printf(1, "philosopher %d becomes hungry.\n", getpid());
  d9:	e8 04 04 00 00       	call   4e2 <getpid>
  de:	83 c4 0c             	add    $0xc,%esp
  e1:	50                   	push   %eax
  e2:	68 58 09 00 00       	push   $0x958
  e7:	6a 01                	push   $0x1
  e9:	e8 d2 04 00 00       	call   5c0 <printf>
  unlock(EX);
  ee:	83 c4 10             	add    $0x10,%esp
  f1:	c7 45 08 09 00 00 00 	movl   $0x9,0x8(%ebp)
}
  f8:	c9                   	leave  
  sleep(3);			/* 考え中 */

  lock(EX);
  state[i] = HUNGRY;
  printf(1, "philosopher %d becomes hungry.\n", getpid());
  unlock(EX);
  f9:	e9 0c 04 00 00       	jmp    50a <unlock>
  fe:	66 90                	xchg   %ax,%ax

00000100 <eat>:

/*
 *  食事をする
 */
void eat(int i)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 14             	sub    $0x14,%esp
  lock(EX);
 106:	6a 09                	push   $0x9
 108:	e8 f5 03 00 00       	call   502 <lock>
  state[i] = EATING;
  printf(1, "philosopher %d is eating.\n", getpid());
 10d:	e8 d0 03 00 00       	call   4e2 <getpid>
 112:	83 c4 0c             	add    $0xc,%esp
 115:	50                   	push   %eax
 116:	68 b4 09 00 00       	push   $0x9b4
 11b:	6a 01                	push   $0x1
 11d:	e8 9e 04 00 00       	call   5c0 <printf>
  unlock(EX);
 122:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
 129:	e8 dc 03 00 00       	call   50a <unlock>

  sleep(2);		/* 食事中 */
 12e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 135:	e8 b8 03 00 00       	call   4f2 <sleep>

  lock(EX);  
 13a:	c7 04 24 09 00 00 00 	movl   $0x9,(%esp)
 141:	e8 bc 03 00 00       	call   502 <lock>
  state[i] = THINKING;
  printf(1, "philosopher %d finished eating and then starts thinking.\n", getpid());
 146:	e8 97 03 00 00       	call   4e2 <getpid>
 14b:	83 c4 0c             	add    $0xc,%esp
 14e:	50                   	push   %eax
 14f:	68 78 09 00 00       	push   $0x978
 154:	6a 01                	push   $0x1
 156:	e8 65 04 00 00       	call   5c0 <printf>
  unlock(EX);  
 15b:	83 c4 10             	add    $0x10,%esp
 15e:	c7 45 08 09 00 00 00 	movl   $0x9,0x8(%ebp)
}
 165:	c9                   	leave  
  sleep(2);		/* 食事中 */

  lock(EX);  
  state[i] = THINKING;
  printf(1, "philosopher %d finished eating and then starts thinking.\n", getpid());
  unlock(EX);  
 166:	e9 9f 03 00 00       	jmp    50a <unlock>
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <philosopher1>:
/*
 *  哲学者の行動（デッドロックが発生する例）
 */
void
philosopher1(int i)
{
 170:	55                   	push   %ebp
 171:	ba 56 55 55 55       	mov    $0x55555556,%edx
 176:	89 e5                	mov    %esp,%ebp
 178:	56                   	push   %esi
 179:	53                   	push   %ebx
 17a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 17d:	8d 4b 01             	lea    0x1(%ebx),%ecx
 180:	89 c8                	mov    %ecx,%eax
 182:	f7 ea                	imul   %edx
 184:	89 c8                	mov    %ecx,%eax
 186:	c1 f8 1f             	sar    $0x1f,%eax
 189:	29 c2                	sub    %eax,%edx
 18b:	8d 04 52             	lea    (%edx,%edx,2),%eax
 18e:	29 c1                	sub    %eax,%ecx
 190:	89 ce                	mov    %ecx,%esi
 192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  while (1) {
  	think(i);
 198:	83 ec 0c             	sub    $0xc,%esp
 19b:	53                   	push   %ebx
 19c:	e8 1f ff ff ff       	call   c0 <think>
    if(LEFT>RIGHT){
 1a1:	83 c4 10             	add    $0x10,%esp
 1a4:	39 f3                	cmp    %esi,%ebx
 1a6:	7e 3c                	jle    1e4 <philosopher1+0x74>
      take_fork(LEFT);				/* 左側のフォークを取る */
 1a8:	83 ec 0c             	sub    $0xc,%esp
 1ab:	53                   	push   %ebx
 1ac:	e8 9f fe ff ff       	call   50 <take_fork>
      take_fork(RIGHT);				/* 右側のフォークを取る */
 1b1:	89 34 24             	mov    %esi,(%esp)
 1b4:	e8 97 fe ff ff       	call   50 <take_fork>
      eat(i);
 1b9:	89 1c 24             	mov    %ebx,(%esp)
 1bc:	e8 3f ff ff ff       	call   100 <eat>
      put_fork(RIGHT);
 1c1:	89 34 24             	mov    %esi,(%esp)
 1c4:	e8 c7 fe ff ff       	call   90 <put_fork>
      put_fork(LEFT);
 1c9:	89 1c 24             	mov    %ebx,(%esp)
 1cc:	e8 bf fe ff ff       	call   90 <put_fork>
 1d1:	83 c4 10             	add    $0x10,%esp
 */
void
philosopher1(int i)
{
  while (1) {
  	think(i);
 1d4:	83 ec 0c             	sub    $0xc,%esp
 1d7:	53                   	push   %ebx
 1d8:	e8 e3 fe ff ff       	call   c0 <think>
    if(LEFT>RIGHT){
 1dd:	83 c4 10             	add    $0x10,%esp
 1e0:	39 f3                	cmp    %esi,%ebx
 1e2:	7f c4                	jg     1a8 <philosopher1+0x38>
      take_fork(RIGHT);				/* 右側のフォークを取る */
      eat(i);
      put_fork(RIGHT);
      put_fork(LEFT);
    }else{
      take_fork(RIGHT);				/* 右側のフォークを取る */
 1e4:	83 ec 0c             	sub    $0xc,%esp
 1e7:	56                   	push   %esi
 1e8:	e8 63 fe ff ff       	call   50 <take_fork>
    	take_fork(LEFT);				/* 左側のフォークを取る */
 1ed:	89 1c 24             	mov    %ebx,(%esp)
 1f0:	e8 5b fe ff ff       	call   50 <take_fork>
      eat(i);
 1f5:	89 1c 24             	mov    %ebx,(%esp)
 1f8:	e8 03 ff ff ff       	call   100 <eat>
      put_fork(LEFT);
 1fd:	89 1c 24             	mov    %ebx,(%esp)
 200:	e8 8b fe ff ff       	call   90 <put_fork>
      put_fork(RIGHT);
 205:	89 34 24             	mov    %esi,(%esp)
 208:	e8 83 fe ff ff       	call   90 <put_fork>
 20d:	83 c4 10             	add    $0x10,%esp
 210:	eb 86                	jmp    198 <philosopher1+0x28>
 212:	66 90                	xchg   %ax,%ax
 214:	66 90                	xchg   %ax,%ax
 216:	66 90                	xchg   %ax,%ax
 218:	66 90                	xchg   %ax,%ax
 21a:	66 90                	xchg   %ax,%ax
 21c:	66 90                	xchg   %ax,%ax
 21e:	66 90                	xchg   %ax,%ax

00000220 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 22a:	89 c2                	mov    %eax,%edx
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 230:	83 c1 01             	add    $0x1,%ecx
 233:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 237:	83 c2 01             	add    $0x1,%edx
 23a:	84 db                	test   %bl,%bl
 23c:	88 5a ff             	mov    %bl,-0x1(%edx)
 23f:	75 ef                	jne    230 <strcpy+0x10>
    ;
  return os;
}
 241:	5b                   	pop    %ebx
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    
 244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 24a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000250 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
 255:	8b 55 08             	mov    0x8(%ebp),%edx
 258:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 25b:	0f b6 02             	movzbl (%edx),%eax
 25e:	0f b6 19             	movzbl (%ecx),%ebx
 261:	84 c0                	test   %al,%al
 263:	75 1e                	jne    283 <strcmp+0x33>
 265:	eb 29                	jmp    290 <strcmp+0x40>
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 270:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 273:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 276:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 279:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 27d:	84 c0                	test   %al,%al
 27f:	74 0f                	je     290 <strcmp+0x40>
 281:	89 f1                	mov    %esi,%ecx
 283:	38 d8                	cmp    %bl,%al
 285:	74 e9                	je     270 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 287:	29 d8                	sub    %ebx,%eax
}
 289:	5b                   	pop    %ebx
 28a:	5e                   	pop    %esi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 290:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 292:	29 d8                	sub    %ebx,%eax
}
 294:	5b                   	pop    %ebx
 295:	5e                   	pop    %esi
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
 298:	90                   	nop
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strlen>:

uint
strlen(char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2a6:	80 39 00             	cmpb   $0x0,(%ecx)
 2a9:	74 12                	je     2bd <strlen+0x1d>
 2ab:	31 d2                	xor    %edx,%edx
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2b7:	89 d0                	mov    %edx,%eax
 2b9:	75 f5                	jne    2b0 <strlen+0x10>
    ;
  return n;
}
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 2bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	eb 0d                	jmp    2d0 <memset>
 2c3:	90                   	nop
 2c4:	90                   	nop
 2c5:	90                   	nop
 2c6:	90                   	nop
 2c7:	90                   	nop
 2c8:	90                   	nop
 2c9:	90                   	nop
 2ca:	90                   	nop
 2cb:	90                   	nop
 2cc:	90                   	nop
 2cd:	90                   	nop
 2ce:	90                   	nop
 2cf:	90                   	nop

000002d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	89 d7                	mov    %edx,%edi
 2df:	fc                   	cld    
 2e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e2:	89 d0                	mov    %edx,%eax
 2e4:	5f                   	pop    %edi
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	53                   	push   %ebx
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 2fa:	0f b6 10             	movzbl (%eax),%edx
 2fd:	84 d2                	test   %dl,%dl
 2ff:	74 1d                	je     31e <strchr+0x2e>
    if(*s == c)
 301:	38 d3                	cmp    %dl,%bl
 303:	89 d9                	mov    %ebx,%ecx
 305:	75 0d                	jne    314 <strchr+0x24>
 307:	eb 17                	jmp    320 <strchr+0x30>
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 310:	38 ca                	cmp    %cl,%dl
 312:	74 0c                	je     320 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 314:	83 c0 01             	add    $0x1,%eax
 317:	0f b6 10             	movzbl (%eax),%edx
 31a:	84 d2                	test   %dl,%dl
 31c:	75 f2                	jne    310 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 31e:	31 c0                	xor    %eax,%eax
}
 320:	5b                   	pop    %ebx
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <gets>:

char*
gets(char *buf, int max)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 336:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 338:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 33b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 33e:	eb 29                	jmp    369 <gets+0x39>
    cc = read(0, &c, 1);
 340:	83 ec 04             	sub    $0x4,%esp
 343:	6a 01                	push   $0x1
 345:	57                   	push   %edi
 346:	6a 00                	push   $0x0
 348:	e8 2d 01 00 00       	call   47a <read>
    if(cc < 1)
 34d:	83 c4 10             	add    $0x10,%esp
 350:	85 c0                	test   %eax,%eax
 352:	7e 1d                	jle    371 <gets+0x41>
      break;
    buf[i++] = c;
 354:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 358:	8b 55 08             	mov    0x8(%ebp),%edx
 35b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 35d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 35f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 363:	74 1b                	je     380 <gets+0x50>
 365:	3c 0d                	cmp    $0xd,%al
 367:	74 17                	je     380 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 369:	8d 5e 01             	lea    0x1(%esi),%ebx
 36c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 36f:	7c cf                	jl     340 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 371:	8b 45 08             	mov    0x8(%ebp),%eax
 374:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 378:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37b:	5b                   	pop    %ebx
 37c:	5e                   	pop    %esi
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 380:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 383:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 385:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 389:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5f                   	pop    %edi
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    
 391:	eb 0d                	jmp    3a0 <stat>
 393:	90                   	nop
 394:	90                   	nop
 395:	90                   	nop
 396:	90                   	nop
 397:	90                   	nop
 398:	90                   	nop
 399:	90                   	nop
 39a:	90                   	nop
 39b:	90                   	nop
 39c:	90                   	nop
 39d:	90                   	nop
 39e:	90                   	nop
 39f:	90                   	nop

000003a0 <stat>:

int
stat(char *n, struct stat *st)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3a5:	83 ec 08             	sub    $0x8,%esp
 3a8:	6a 00                	push   $0x0
 3aa:	ff 75 08             	pushl  0x8(%ebp)
 3ad:	e8 f0 00 00 00       	call   4a2 <open>
  if(fd < 0)
 3b2:	83 c4 10             	add    $0x10,%esp
 3b5:	85 c0                	test   %eax,%eax
 3b7:	78 27                	js     3e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3b9:	83 ec 08             	sub    $0x8,%esp
 3bc:	ff 75 0c             	pushl  0xc(%ebp)
 3bf:	89 c3                	mov    %eax,%ebx
 3c1:	50                   	push   %eax
 3c2:	e8 f3 00 00 00       	call   4ba <fstat>
 3c7:	89 c6                	mov    %eax,%esi
  close(fd);
 3c9:	89 1c 24             	mov    %ebx,(%esp)
 3cc:	e8 b9 00 00 00       	call   48a <close>
  return r;
 3d1:	83 c4 10             	add    $0x10,%esp
 3d4:	89 f0                	mov    %esi,%eax
}
 3d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d9:	5b                   	pop    %ebx
 3da:	5e                   	pop    %esi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 3e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3e5:	eb ef                	jmp    3d6 <stat+0x36>
 3e7:	89 f6                	mov    %esi,%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3f7:	0f be 11             	movsbl (%ecx),%edx
 3fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 3fd:	3c 09                	cmp    $0x9,%al
 3ff:	b8 00 00 00 00       	mov    $0x0,%eax
 404:	77 1f                	ja     425 <atoi+0x35>
 406:	8d 76 00             	lea    0x0(%esi),%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 410:	8d 04 80             	lea    (%eax,%eax,4),%eax
 413:	83 c1 01             	add    $0x1,%ecx
 416:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 41a:	0f be 11             	movsbl (%ecx),%edx
 41d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 420:	80 fb 09             	cmp    $0x9,%bl
 423:	76 eb                	jbe    410 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 425:	5b                   	pop    %ebx
 426:	5d                   	pop    %ebp
 427:	c3                   	ret    
 428:	90                   	nop
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000430 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	8b 5d 10             	mov    0x10(%ebp),%ebx
 438:	8b 45 08             	mov    0x8(%ebp),%eax
 43b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 43e:	85 db                	test   %ebx,%ebx
 440:	7e 14                	jle    456 <memmove+0x26>
 442:	31 d2                	xor    %edx,%edx
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 448:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 44c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 44f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 452:	39 da                	cmp    %ebx,%edx
 454:	75 f2                	jne    448 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 456:	5b                   	pop    %ebx
 457:	5e                   	pop    %esi
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45a:	b8 01 00 00 00       	mov    $0x1,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <exit>:
SYSCALL(exit)
 462:	b8 02 00 00 00       	mov    $0x2,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <wait>:
SYSCALL(wait)
 46a:	b8 03 00 00 00       	mov    $0x3,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <pipe>:
SYSCALL(pipe)
 472:	b8 04 00 00 00       	mov    $0x4,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <read>:
SYSCALL(read)
 47a:	b8 05 00 00 00       	mov    $0x5,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <write>:
SYSCALL(write)
 482:	b8 10 00 00 00       	mov    $0x10,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <close>:
SYSCALL(close)
 48a:	b8 15 00 00 00       	mov    $0x15,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <kill>:
SYSCALL(kill)
 492:	b8 06 00 00 00       	mov    $0x6,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <exec>:
SYSCALL(exec)
 49a:	b8 07 00 00 00       	mov    $0x7,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <open>:
SYSCALL(open)
 4a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <mknod>:
SYSCALL(mknod)
 4aa:	b8 11 00 00 00       	mov    $0x11,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <unlink>:
SYSCALL(unlink)
 4b2:	b8 12 00 00 00       	mov    $0x12,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <fstat>:
SYSCALL(fstat)
 4ba:	b8 08 00 00 00       	mov    $0x8,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <link>:
SYSCALL(link)
 4c2:	b8 13 00 00 00       	mov    $0x13,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <mkdir>:
SYSCALL(mkdir)
 4ca:	b8 14 00 00 00       	mov    $0x14,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <chdir>:
SYSCALL(chdir)
 4d2:	b8 09 00 00 00       	mov    $0x9,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <dup>:
SYSCALL(dup)
 4da:	b8 0a 00 00 00       	mov    $0xa,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <getpid>:
SYSCALL(getpid)
 4e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <sbrk>:
SYSCALL(sbrk)
 4ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <sleep>:
SYSCALL(sleep)
 4f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <uptime>:
SYSCALL(uptime)
 4fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <lock>:
SYSCALL(lock)			// for lock-related system call
 502:	b8 16 00 00 00       	mov    $0x16,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <unlock>:
 50a:	b8 17 00 00 00       	mov    $0x17,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    
 512:	66 90                	xchg   %ax,%ax
 514:	66 90                	xchg   %ax,%ax
 516:	66 90                	xchg   %ax,%ax
 518:	66 90                	xchg   %ax,%ax
 51a:	66 90                	xchg   %ax,%ax
 51c:	66 90                	xchg   %ax,%ax
 51e:	66 90                	xchg   %ax,%ax

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	89 c6                	mov    %eax,%esi
 528:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 52b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 52e:	85 db                	test   %ebx,%ebx
 530:	74 7e                	je     5b0 <printint+0x90>
 532:	89 d0                	mov    %edx,%eax
 534:	c1 e8 1f             	shr    $0x1f,%eax
 537:	84 c0                	test   %al,%al
 539:	74 75                	je     5b0 <printint+0x90>
    neg = 1;
    x = -xx;
 53b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 53d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 544:	f7 d8                	neg    %eax
 546:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 549:	31 ff                	xor    %edi,%edi
 54b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 54e:	89 ce                	mov    %ecx,%esi
 550:	eb 08                	jmp    55a <printint+0x3a>
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 558:	89 cf                	mov    %ecx,%edi
 55a:	31 d2                	xor    %edx,%edx
 55c:	8d 4f 01             	lea    0x1(%edi),%ecx
 55f:	f7 f6                	div    %esi
 561:	0f b6 92 f4 09 00 00 	movzbl 0x9f4(%edx),%edx
  }while((x /= base) != 0);
 568:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 56a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 56d:	75 e9                	jne    558 <printint+0x38>
  if(neg)
 56f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 572:	8b 75 c0             	mov    -0x40(%ebp),%esi
 575:	85 c0                	test   %eax,%eax
 577:	74 08                	je     581 <printint+0x61>
    buf[i++] = '-';
 579:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 57e:	8d 4f 02             	lea    0x2(%edi),%ecx
 581:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 585:	8d 76 00             	lea    0x0(%esi),%esi
 588:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 58b:	83 ec 04             	sub    $0x4,%esp
 58e:	83 ef 01             	sub    $0x1,%edi
 591:	6a 01                	push   $0x1
 593:	53                   	push   %ebx
 594:	56                   	push   %esi
 595:	88 45 d7             	mov    %al,-0x29(%ebp)
 598:	e8 e5 fe ff ff       	call   482 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 59d:	83 c4 10             	add    $0x10,%esp
 5a0:	39 df                	cmp    %ebx,%edi
 5a2:	75 e4                	jne    588 <printint+0x68>
    putc(fd, buf[i]);
}
 5a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a7:	5b                   	pop    %ebx
 5a8:	5e                   	pop    %esi
 5a9:	5f                   	pop    %edi
 5aa:	5d                   	pop    %ebp
 5ab:	c3                   	ret    
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5b0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5b2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5b9:	eb 8b                	jmp    546 <printint+0x26>
 5bb:	90                   	nop
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5c9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5cc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d5:	0f b6 1e             	movzbl (%esi),%ebx
 5d8:	83 c6 01             	add    $0x1,%esi
 5db:	84 db                	test   %bl,%bl
 5dd:	0f 84 b0 00 00 00    	je     693 <printf+0xd3>
 5e3:	31 d2                	xor    %edx,%edx
 5e5:	eb 39                	jmp    620 <printf+0x60>
 5e7:	89 f6                	mov    %esi,%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5f0:	83 f8 25             	cmp    $0x25,%eax
 5f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 5f6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5fb:	74 18                	je     615 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5fd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 600:	83 ec 04             	sub    $0x4,%esp
 603:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 606:	6a 01                	push   $0x1
 608:	50                   	push   %eax
 609:	57                   	push   %edi
 60a:	e8 73 fe ff ff       	call   482 <write>
 60f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 612:	83 c4 10             	add    $0x10,%esp
 615:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 618:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 61c:	84 db                	test   %bl,%bl
 61e:	74 73                	je     693 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 620:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 622:	0f be cb             	movsbl %bl,%ecx
 625:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 628:	74 c6                	je     5f0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 62a:	83 fa 25             	cmp    $0x25,%edx
 62d:	75 e6                	jne    615 <printf+0x55>
      if(c == 'd'){
 62f:	83 f8 64             	cmp    $0x64,%eax
 632:	0f 84 f8 00 00 00    	je     730 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 638:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 63e:	83 f9 70             	cmp    $0x70,%ecx
 641:	74 5d                	je     6a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 643:	83 f8 73             	cmp    $0x73,%eax
 646:	0f 84 84 00 00 00    	je     6d0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 64c:	83 f8 63             	cmp    $0x63,%eax
 64f:	0f 84 ea 00 00 00    	je     73f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 655:	83 f8 25             	cmp    $0x25,%eax
 658:	0f 84 c2 00 00 00    	je     720 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 65e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 661:	83 ec 04             	sub    $0x4,%esp
 664:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 668:	6a 01                	push   $0x1
 66a:	50                   	push   %eax
 66b:	57                   	push   %edi
 66c:	e8 11 fe ff ff       	call   482 <write>
 671:	83 c4 0c             	add    $0xc,%esp
 674:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 677:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 67a:	6a 01                	push   $0x1
 67c:	50                   	push   %eax
 67d:	57                   	push   %edi
 67e:	83 c6 01             	add    $0x1,%esi
 681:	e8 fc fd ff ff       	call   482 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 686:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 68a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 68d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 68f:	84 db                	test   %bl,%bl
 691:	75 8d                	jne    620 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 693:	8d 65 f4             	lea    -0xc(%ebp),%esp
 696:	5b                   	pop    %ebx
 697:	5e                   	pop    %esi
 698:	5f                   	pop    %edi
 699:	5d                   	pop    %ebp
 69a:	c3                   	ret    
 69b:	90                   	nop
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a8:	6a 00                	push   $0x0
 6aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6ad:	89 f8                	mov    %edi,%eax
 6af:	8b 13                	mov    (%ebx),%edx
 6b1:	e8 6a fe ff ff       	call   520 <printint>
        ap++;
 6b6:	89 d8                	mov    %ebx,%eax
 6b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6bb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 6bd:	83 c0 04             	add    $0x4,%eax
 6c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6c3:	e9 4d ff ff ff       	jmp    615 <printf+0x55>
 6c8:	90                   	nop
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 6d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 6d5:	83 c0 04             	add    $0x4,%eax
 6d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 6db:	b8 eb 09 00 00       	mov    $0x9eb,%eax
 6e0:	85 db                	test   %ebx,%ebx
 6e2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 6e5:	0f b6 03             	movzbl (%ebx),%eax
 6e8:	84 c0                	test   %al,%al
 6ea:	74 23                	je     70f <printf+0x14f>
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 6f6:	83 ec 04             	sub    $0x4,%esp
 6f9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 6fb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6fe:	50                   	push   %eax
 6ff:	57                   	push   %edi
 700:	e8 7d fd ff ff       	call   482 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 705:	0f b6 03             	movzbl (%ebx),%eax
 708:	83 c4 10             	add    $0x10,%esp
 70b:	84 c0                	test   %al,%al
 70d:	75 e1                	jne    6f0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 70f:	31 d2                	xor    %edx,%edx
 711:	e9 ff fe ff ff       	jmp    615 <printf+0x55>
 716:	8d 76 00             	lea    0x0(%esi),%esi
 719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 720:	83 ec 04             	sub    $0x4,%esp
 723:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 726:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 729:	6a 01                	push   $0x1
 72b:	e9 4c ff ff ff       	jmp    67c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 730:	83 ec 0c             	sub    $0xc,%esp
 733:	b9 0a 00 00 00       	mov    $0xa,%ecx
 738:	6a 01                	push   $0x1
 73a:	e9 6b ff ff ff       	jmp    6aa <printf+0xea>
 73f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 742:	83 ec 04             	sub    $0x4,%esp
 745:	8b 03                	mov    (%ebx),%eax
 747:	6a 01                	push   $0x1
 749:	88 45 e4             	mov    %al,-0x1c(%ebp)
 74c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 74f:	50                   	push   %eax
 750:	57                   	push   %edi
 751:	e8 2c fd ff ff       	call   482 <write>
 756:	e9 5b ff ff ff       	jmp    6b6 <printf+0xf6>
 75b:	66 90                	xchg   %ax,%ax
 75d:	66 90                	xchg   %ax,%ax
 75f:	90                   	nop

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 38 0d 00 00       	mov    0xd38,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 76e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 770:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 773:	39 c8                	cmp    %ecx,%eax
 775:	73 19                	jae    790 <free+0x30>
 777:	89 f6                	mov    %esi,%esi
 779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 780:	39 d1                	cmp    %edx,%ecx
 782:	72 1c                	jb     7a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 784:	39 d0                	cmp    %edx,%eax
 786:	73 18                	jae    7a0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 788:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78e:	72 f0                	jb     780 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 d0                	cmp    %edx,%eax
 792:	72 f4                	jb     788 <free+0x28>
 794:	39 d1                	cmp    %edx,%ecx
 796:	73 f0                	jae    788 <free+0x28>
 798:	90                   	nop
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7a6:	39 d7                	cmp    %edx,%edi
 7a8:	74 19                	je     7c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ad:	8b 50 04             	mov    0x4(%eax),%edx
 7b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7b3:	39 f1                	cmp    %esi,%ecx
 7b5:	74 23                	je     7da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7b9:	a3 38 0d 00 00       	mov    %eax,0xd38
}
 7be:	5b                   	pop    %ebx
 7bf:	5e                   	pop    %esi
 7c0:	5f                   	pop    %edi
 7c1:	5d                   	pop    %ebp
 7c2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7c3:	03 72 04             	add    0x4(%edx),%esi
 7c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c9:	8b 10                	mov    (%eax),%edx
 7cb:	8b 12                	mov    (%edx),%edx
 7cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7d0:	8b 50 04             	mov    0x4(%eax),%edx
 7d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7d6:	39 f1                	cmp    %esi,%ecx
 7d8:	75 dd                	jne    7b7 <free+0x57>
    p->s.size += bp->s.size;
 7da:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 7dd:	a3 38 0d 00 00       	mov    %eax,0xd38
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7e8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7ea:	5b                   	pop    %ebx
 7eb:	5e                   	pop    %esi
 7ec:	5f                   	pop    %edi
 7ed:	5d                   	pop    %ebp
 7ee:	c3                   	ret    
 7ef:	90                   	nop

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 15 38 0d 00 00    	mov    0xd38,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 78 07             	lea    0x7(%eax),%edi
 805:	c1 ef 03             	shr    $0x3,%edi
 808:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 80b:	85 d2                	test   %edx,%edx
 80d:	0f 84 a3 00 00 00    	je     8b6 <malloc+0xc6>
 813:	8b 02                	mov    (%edx),%eax
 815:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 818:	39 cf                	cmp    %ecx,%edi
 81a:	76 74                	jbe    890 <malloc+0xa0>
 81c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 822:	be 00 10 00 00       	mov    $0x1000,%esi
 827:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 82e:	0f 43 f7             	cmovae %edi,%esi
 831:	ba 00 80 00 00       	mov    $0x8000,%edx
 836:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 83c:	0f 46 da             	cmovbe %edx,%ebx
 83f:	eb 10                	jmp    851 <malloc+0x61>
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 848:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 84a:	8b 48 04             	mov    0x4(%eax),%ecx
 84d:	39 cf                	cmp    %ecx,%edi
 84f:	76 3f                	jbe    890 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 851:	39 05 38 0d 00 00    	cmp    %eax,0xd38
 857:	89 c2                	mov    %eax,%edx
 859:	75 ed                	jne    848 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 85b:	83 ec 0c             	sub    $0xc,%esp
 85e:	53                   	push   %ebx
 85f:	e8 86 fc ff ff       	call   4ea <sbrk>
  if(p == (char*)-1)
 864:	83 c4 10             	add    $0x10,%esp
 867:	83 f8 ff             	cmp    $0xffffffff,%eax
 86a:	74 1c                	je     888 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 86c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 86f:	83 ec 0c             	sub    $0xc,%esp
 872:	83 c0 08             	add    $0x8,%eax
 875:	50                   	push   %eax
 876:	e8 e5 fe ff ff       	call   760 <free>
  return freep;
 87b:	8b 15 38 0d 00 00    	mov    0xd38,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 881:	83 c4 10             	add    $0x10,%esp
 884:	85 d2                	test   %edx,%edx
 886:	75 c0                	jne    848 <malloc+0x58>
        return 0;
 888:	31 c0                	xor    %eax,%eax
 88a:	eb 1c                	jmp    8a8 <malloc+0xb8>
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 890:	39 cf                	cmp    %ecx,%edi
 892:	74 1c                	je     8b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 894:	29 f9                	sub    %edi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 89f:	89 15 38 0d 00 00    	mov    %edx,0xd38
      return (void*)(p + 1);
 8a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 8b0:	8b 08                	mov    (%eax),%ecx
 8b2:	89 0a                	mov    %ecx,(%edx)
 8b4:	eb e9                	jmp    89f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 8b6:	c7 05 38 0d 00 00 3c 	movl   $0xd3c,0xd38
 8bd:	0d 00 00 
 8c0:	c7 05 3c 0d 00 00 3c 	movl   $0xd3c,0xd3c
 8c7:	0d 00 00 
    base.s.size = 0;
 8ca:	b8 3c 0d 00 00       	mov    $0xd3c,%eax
 8cf:	c7 05 40 0d 00 00 00 	movl   $0x0,0xd40
 8d6:	00 00 00 
 8d9:	e9 3e ff ff ff       	jmp    81c <malloc+0x2c>
