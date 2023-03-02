# human_orcle2
휴먼교육센터 오라클 데이터베이스 실습 코드



## CMD 창에서 덤프 명령어 사용

### 덤프파일 가져오기 <br>
imp userid=hr/123456 file='경로\hr.dmp' fromuser=hr touser=hr

### 덤프파일 내보내기 <br>
exp userid=hr/123456 file='C:\KHM\SQL\hr.dmp' log='C:\KHM\SQL\hr.log'
