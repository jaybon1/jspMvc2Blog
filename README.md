# JSP 모델2 블로그 프로젝트

&nbsp;

## 설명

- JSP / Oracle DB를 사용한 블로그 입니다.
- 도로명주소, SummerNote, Jsoup API를 사용하였습니다.
- 로그인 및 회원가입
- 게시글 페이징 기능
- 프로필 사진 업로드 기능
- 글쓰기, 글수정, 글삭제 기능
- 댓글쓰기, 댓글삭제 기능
- 유튜브 영상 주소가 있을 경우 미리보기

&nbsp;

## 프레젠테이션

https://docs.google.com/presentation/d/1j9tevdhEa7kLbuQcUK7VuqT_IWw2XdMu13PX79RPZDk/edit?usp=sharing

&nbsp;

## 영상

https://youtu.be/AsomJ8yroHE

&nbsp;

## Oracle DB 설정



### 사용자 생성 및 권한부여

```sql
alter session set "_oracle_script"=true; -- 12c버전 이후는 이 코드를 쓰지않으면 유저명에 @를 써야함
CREATE USER cos IDENTIFIED BY bitc5600; -- 유저명과 비밀번호를 입력하여 사용자릉 생성한다

GRANT CREATE SESSION TO cos; -- 세션을 만들 권한
GRANT CREATE TABLESPACE TO cos; -- 테이블 스페이스를 만들 권한
GRANT CREATE TABLE TO cos; -- 테이블을 만들 권한
GRANT CREATE SEQUENCE TO cos; -- 시퀀스를 만들 권한

-- 테이블에 권한 부여
GRANT ALL ON cos.board TO COS;
GRANT ALL ON cos.users TO COS;
GRANT ALL ON cos.reply TO COS;

-- 해당 유저에게 테이블스페이스 공간 할당
alter user cos default tablespace users quota unlimited on users; 

-- 일부 테이블 설정할 때 GRANT select, insert, delete, update on cos.board TO cos;
```



### 테이블

```sql
CREATE TABLE users(
	id number primary key,
    username varchar2(100) not null unique,
    password varchar2(100) not null,
    email varchar2(100) not null,
    address varchar2(100) not null,
    userProfile varchar2(200),
    userRole VARCHAR2(20),
    createDate timestamp
) ;

CREATE TABLE board(
	id number primary key,
    userId number,
    title varchar2(100) not null,
    content clob,
    readCount number default 0,
    createDate timestamp,
    foreign key (userId) references users (id)
);

CREATE TABLE reply(
	id number primary key,
    userId number,
    boardId number,
    content varchar2(300) not null,
    createDate timestamp,
    foreign key (userId) references users (id) on delete set null,
    foreign key (boardId) references board (id) on delete cascade
);
```



### 시퀀스

```sql
CREATE SEQUENCE USERS_SEQ
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE BOARD_SEQ
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE REPLY_SEQ
    START WITH 1
    INCREMENT BY 1;
```

