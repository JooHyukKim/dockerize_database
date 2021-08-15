## dockerize_database 1.0 

### Overview
- 로컬 환경에서 중복되는 데이터베이스를 관리하기 위하여 사용.
- Spring Boot 기준으로 개발됨.
- (Ver 1.0) PostgreSQL 로 한정되어 있음.  


### Environment

- MacOS , Unix, Linux

### Usage

Command Line 
```postgre.sh <프로젝트명> <포트번호>```

Intellij 

```
1. Add Configuration
2. Templates
3. Shell Script 선택 후 postgre.sh 을 script path 에 추가 
4. (Optional) 위 configuration을 서버 실행 configuration의 before build 작업에 추 
```

### Script Workflow
1. 변수 프로젝트명, 포트번호를 CLI argument로 , 또는 파일 내부 line 1,2에서 설정
2. 설정한 포트 번호를 점유하고 있는 container 종료
3. docker 볼륨 생성
4. 볼륨과 함께 postgresql 맵핑하여 실행

### Enhancement Points
1. docker run 커맨드가 현재 postgresql로 한정되어있음 >> database 도 설정가능하게 변경
2. ENV_VARIABLE 도 dynamic하게 입력 할 수있도록 변경