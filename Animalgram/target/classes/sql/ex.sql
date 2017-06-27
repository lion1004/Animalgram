
--animalgram.sql

drop table amember;
create table amember( --회원DB
   mno number primary key, --회원번호
   idmail varchar2(50) unique, --회원아이디(이메일)
   mpass varchar2(30) not null, --비밀번호
   nickname varchar2(30) not null, --닉네임
   mname varchar2(30) not null, --이름
   birth varchar2(30) not null, --생년월일
   mgender varchar2(20)not null, --성별
   job varchar2(20)default 'user', --직업
   mtel varchar2(30)not null, --전화번호
   maddr varchar2(100) not null, --사는지역
   favorite varchar2(50) not null, --관심분야
   mdate date default sysdate --가입일자
   );


drop sequence amember_seq; -- 회원 번호 시퀀스
create sequence amember_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from amember;

drop table seller;
create table seller( --판매자DB
   sno number primary key, --판매자번호
   mno number references amember(mno), --회원DB(회원번호)
   sname varchar2(100) not null, --판매자상호명
   stel varchar2(30) not null, --판매자번호
   saddr varchar2(100) not null, --판매주소
   sdate date default sysdate --판매자 등록일자
);

drop sequence seller_seq; --판매자 번호 시퀀스
create sequence seller_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from seller;

drop table custom;
create table custom( --주문제작 DB
   cuno number primary key, --주문제작번호
   sno number references seller(sno),--판매자DB(판매자번호)
   ctitle varchar2(100) not null,--글번호
   cprice number not null,--가격
   cimage varchar2(100),--주문제작물품이미지
   cinfo varchar2(1500) not null,--품목정보
   cdate date default sysdate--주문제작 게시글 올린 일자
   );
   
drop sequence custom_seq; -- 주문제작 번호 시퀀스
create sequence custom_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from custom;
   
drop table bill;
create table bill( --주문서DB
   bno number primary key, --주문서번호
   mno number references amember(mno),--회원DB(회원번호)
   cuno number references custom(cuno),--주문제작DB(주문제작번호)
   bcount number not null, --주문갯수
   bmeno varchar2(200) not null,--추가 메모
   bdeli varchar2(50) not null, --주문 물품 받을 주소
   bdate date default sysdate--주문일자
);

drop sequence bill_seq; --주문서 번호 시퀀스
create sequence bill_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from bill;

drop table bill_ep;
create table bill_ep( --주문후기DB
   beno number primary key,--후기댓글번호
   bno number references bill(bno),--주문서DB(주문서번호)
   bestar number not null,--별점
   becontent varchar2(100) not null--후기내용
);

drop sequence bill_ep_seq; -- 주문후기 댓글 번호 시퀀스
create sequence bill_ep_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from bill_ep;

drop table donation;
create table donation( --나눔DB
   dno number primary key,--나눔번호
   mno number references amember(mno),--회원DB(회원번호)
   dtitle varchar2(100) not null,--나눔제목
   dcount number not null,--나눔갯수
   dimage varchar2(100),--나눔할 물품 이미지
   dcontent varchar2(1500) not null,--나눔글 내용
   dstate varchar2(30) not null,--나눔 상태(대기,진행중,취소 등등)
   ddate date default sysdate--나눔물품등록일자
);

drop sequence donation_seq; --나눔 번호 시퀀스
create sequence donation_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from donation;

drop table donation_join;
create table donation_join( --나눔참여DB
   mno number references amember(mno),--회원DB(회원번호)
   dno number references donation(dno)--나눔DB(나눔글번호)
);

select * from donation_join;

drop table donation_ask;
create table donation_ask( --나눔요청DB
   dano number primary key,--나눔신청서번호
   dno number references donation(dno),--나눔DB(나눔번호)
   mno number references amember(mno),--회원DB(회원번호)
   damemo varchar2(200) not null, --나눔신청서 메모
   dadeli varchar2(50) not null,--나눔 받을 주소
   dadate date default sysdate--나눔신청일자
);

drop sequence donation_ask_seq; --나눔신청서 번호 시퀀스
create sequence donation_ask_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from donation_ask;

drop table notice_board;
create table notice_board( --게시판DB
   nno number primary key,--게시판 번호
   nname varchar2(50)--게시판 이름
);

drop sequence notice_board_seq; --게시판 번호 시퀀스
create sequence notice_board_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from notice_board;

drop table notice_text;
create table notice_text( --게시글DB
   antno number primary key,--전체 게시글 번호
   mno number references amember(mno), --회원DB(회원번호)
   nno number references notice_board(nno), --게시판DB(게시판 번호)
   ntno number not null,--각 게시판 당 게시글 번호
   ntitle varchar2(100) not null, --게시글 제목
   ntcontent varchar2(1500) not null, --게시글 내용
   ntimage varchar2(100), -- 게시글이미지
   ntdate date default sysdate, --게시글 등록일자
   ntupdate date default sysdate--게시글 수정일자
);

drop sequence notice_text_seq;--전체게시글번호 시퀀스
create sequence notice_text_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop sequence knowhow_seq;--노하우게시판 게시글 번호 시퀀스
create sequence knowhow_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop sequence question_seq;--질문답변게시판 게시글 번호 시퀀스
create sequence question_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from notice_text;

drop table areply;
create table areply( --댓글DB
   arno number primary key, --전체 댓글 번호
   mno number references amember(mno), --회원DB(회원번호)
   antno number references notice_text(antno), --게시글DB(전체 게시글 번호)
   rno number not null, --각 게시글에 대한 댓글 번호
   rcontent varchar2(600) not null, --댓글 내용
   rdate date default sysdate, --댓글등록일자
   rupdate date default sysdate --댓글수정일자
);

drop sequence areply_seq;--전체댓글 시퀀스
create sequence areply_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop sequence knowhow_areply_seq;--노하우게시판 게시글 댓글 시퀀스
create sequence knowhow_areply_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop sequence question_areply_seq;--질문답변게시판 게시글 댓글 시퀀스
create sequence question_areply_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from areply;

drop table agroup;
create table agroup(--소모임DB
   gno number primary key, --소모임번호
   gtitle varchar2(100) not null, --소모임제목
   gplace varchar2(100) not null, --소모임장소
   glimit number not null, --소모임참가제한인원
   gtype varchar2(30) not null, --소모임종류
   gstate varchar2(30) not null, --소모임진행상태
   gdate date default sysdate --소모임글등록일자
);

drop sequence agroup_seq; --소모임 번호 시퀀스
create sequence agroup_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from agroup;

drop table animal;
create table animal(--반려동물DB
   ano number primary key, --반려동물번호
   mno number references amember(mno), --회원DB(회원번호)
   aname varchar2(30) not null, --반려동물이름
   agender varchar2(20) not null, --반려동물성별
   aage number not null, --반려동물나이
   atype varchar2(30) not null, --반려동물 종류
   aimage varchar2(100), --반려동물이미지
   adate date default sysdate --반려동물 등록 일자
);

drop sequence animal_seq; --반려동물번호 시퀀스
create sequence animal_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from animal;

drop table agroup_person;
create table agroup_person( --소모임참가자DB
   gpno number primary key, --소모임참가자번호
   mno number references amember(mno), --회원DB(회원번호)
   ano number references animal(ano), --반려동물DB(반려동물번호)
   gno number references agroup(gno) --소모임DB(소모임번호)
);

drop sequence agroup_person_seq; --소모임 참가자 번호 시퀀스
create sequence agroup_person_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from agroup_person;

drop table  professional;
create table professional( --전문가DB
   pno number primary key, --전문가번호
   mno number references amember(mno), --회원DB(회원번호)
   ptype varchar2(30) not null, --전문가 종류
   ptypeno varchar2(50) not null, --전문가 등록번호
   pcareer number not null --전문가경력
);

drop sequence professional_seq; --전문가 번호 시퀀스
create sequence professional_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from professional;

drop table care;
create table care( --훈련정보DB
	cno number primary key,
	pno number references professional(pno),
	ctype varchar2(30) not null,
	ccontent varchar2(1500) not null
);

drop sequence care_seq; --훈련번호 시퀀스
create sequence care_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from care;

drop table care_ask;
create table care_ask( --훈련정보DB
	cano number primary key,
	cno number references care(cno),
	mno number references amember(mno),
	ano number references animal(ano),
	cadate date default sysdate,
	castate varchar2(30) not null
);

drop sequence care_ask_seq; --훈련번호 시퀀스
create sequence care_ask_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from care_ask;
   
   
drop table blacklist;
create table blacklist( --블랙리스트DB
   lno number primary key, --블랙리스트번호
   mno number references amember(mno), --회원DB(회원정보)
   lcause varchar2(1500) not null, --블랙리스트 사유
   ldate date default sysdate --블랙리스트 등록일자
);

drop sequence blacklist_seq; --블랙리스트 번호 시퀀스
create sequence blacklist_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from blacklist;

drop table shop;
create table shop(--샵DB
   shno number primary key, --샵번호
   shtype varchar2(30) not null, --샵종류
   shname varchar2(50) not null, --샵이름
   shaddr varchar2(100) not null, --샵주소
   shtel  varchar2(30) not null, --샵전화번호
   shtime varchar2(50) not null, --샵운영시간
   shsite varchar2(30) not null, --샵위치
   shparking varchar2(20) not null --샵주차장유무
);

drop sequence shop_seq; --샵 번호 시퀀스
create sequence shop_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from shop;