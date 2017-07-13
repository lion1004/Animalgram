
--animalgram.sql

drop table amember;
create table amember( --회원DB
   mno number primary key, --회원번호
   idmail varchar2(50) unique, --회원아이디(이메일)
   mpass varchar2(30) not null, --비밀번호
   nickname varchar2(30) unique, --닉네임
   mname varchar2(30) not null, --이름
   birth varchar2(30) not null, --생년월일
   mgender varchar2(20)not null, --성별
   job varchar2(20)default 'user', --직업
   mtel varchar2(30)not null, --전화번호
   maddr varchar2(100) not null, --사는지역
   favorite varchar2(50) not null, --관심분야
   pwcode varchar2(100) not null,   -- 보안코드
   pwcodeas varchar2(100) not null,   -- 보안코드 답변
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
   cuno number primary key, --주문제작번호j
   sno number references seller(sno),--판매자DB(판매자번호)
   cutitle varchar2(100) not null,--글제목
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


drop table custom_attach;
create table custom_attach(
	fullName	varchar2(150) primary key,
	cuno		number not null references custom(cuno),
	cdate date default sysdate
);

select * from CUSTOM_ATTACH;

drop sequence custom_attach_seq;
create sequence custom_attach_seq
      start with 1
      increment by 1
      nocycle
      nocache;   
   
drop table bill;
create table bill( --주문서DB
   bno number primary key, --주문서번호
   mno number references amember(mno),--회원DB(회원번호)
   cuno number references custom(cuno),--주문제작DB(주문제작번호)
   bcount number not null, --주문갯수
   bmemo varchar2(200) not null,--추가 메모
   bsellcount number default '0', -- 주문 누적수량 
   bdate date default sysdate,--주문일자
   bstate varchar2(20) default '상품준비중'
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
   bedate date default sysdate--후기등록날짜
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
   dinfo varchar2(1500) not null,--나눔글 내용
   dadate date default sysdate,--나눔물품등록일자
   dimage varchar2(100) --나눔 상품 이미지
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

drop table donation_ask; --bill
create table donation_ask( --나눔요청DB
   dano number primary key,--나눔신청서번호
   dno number references donation(dno),--나눔DB(나눔번호)
   mno number references amember(mno),--회원DB(회원번호)
   damemo varchar2(200) not null, --나눔신청서 메모
   dadate date default sysdate--나눔신청일자
   dastate varchar2(20) default '상품준비중'
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
   gcount number default 0, --소모임참가제한인원
   gtype  varchar2(30) not null, --소모임종류
   gstate varchar2(30) default '모집', --소모임진행상태
   gdate  varchar2(50) not null,--소모임글등록일자
   gimage varchar2(100) not null,
   gwdate date default sysdate --소모임글등록일자
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
   pimage varchar2(100) not null, --전문가 종류
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
	ctitle varchar2(100) not null,
	ctype varchar2(30) not null,
	cdate varchar2(50) not null,
	cstate varchar2(30) default '예약가능',
	cimage varchar2(100) not null,
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
	castate varchar2(30) default '예약'
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

--shop
--sitehospital.sql


drop table tbl_shop;
--테이블삭제

create table tbl_shop(--테이블생성
 shno number primary key,          --병원번호
 shtype varchar2(20) not null,     --병원타입
 shname varchar2(40) not null,     --병원이름
 shaddr varchar2(100) not null,    --병원주소
 shtel varchar2(50) not null,      --병원전화번호
 shtime varchar2(40) not null,     --병원영업시간
 shsite varchar2(300) not null,    --병원 좌표
 shparking varchar2(100) not null  --병원주차가능여부
);

drop sequence shop_seq;--shno에 대한시퀀스삭제
create sequence shop_seq--shno에 대한시퀀스생성 
	start with 1
	increment by 1
	nocycle
	nocache;
	
	
	--SampleDATA--
	
	--서울--
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
  values (shop_seq.nextval,'애견미용','희망애견미용실','서울특별시 금천구 가산디지털1로 168','010-6818-4409','09:00~21:00','37.480056'||','||'126.882468','주차가능');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
  values (shop_seq.nextval,'애견병원','사랑으로애견병원','서울특별시 영등포구 영중로 15','010-5252-6563','07:00~24:00','37.517152'||','||'126.904153','주차공간협소');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
  values (shop_seq.nextval,'애견용품','내품에애견용품','서울특별시 강남구 역삼동 831-5','010-6785-4545','10:00~20:00','37.494635'||','||'127.030131','주차장공사중');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견종합병원','아프지마애견병원','서울 서초구 이수역','010-3443-7656','9:30~20:30','37.484046'||','||'126.982225','주차장공사중');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'종합동물병원','마음으로 종합병원','서울특별시 은평구 신사1동 23-4','010-3443-7656','9:30~20:30','37.598765'||','||'126.915167','주차장공사중');
  
  --경기--
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견용품','애견으로미용실','경기도 안양시 동안구 호계동','010-5959-5545','11:00~21:00','37.389652'||','||'126.951957','주차가능');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견종합매장','우리애견미용실','경기도 수원시 수원역 2번출구','010-6757-1234','11:00~21:00','37.266441'||','||'127.002276','주차장공사중');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','깜찍한애견미용실','경기도 고양시 덕양구 원흥동 산5-1','010-2331-4542','09:00~19:00','37.653438'||','||'127.002276','주차장공사중');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견종합매장','아가종합매장','경기도 의정부시 금오동 469-3','010-6757-1234','11:00~21:00','37.750905'||','||'127.065856','주차장공사중');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','싱긋견미용실','경기도 수원시 수원역 2번출구','010-6757-1234','11:00~21:00','37.266441'||','||'127.002276','주차장공사중');
  



--강원도

insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견병원','한아름애견병원','강원도 춘천시 효제길 33','010-7865-9812','09:30~22:00','37.871320'||','||'127.736922','주차공간협소');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','맛깔난애견미용실','강원도 홍천군 화촌면 구룡령로 1171-1','010-8967-4577','08:00~23:00','37.749958'||','||'128.056982','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','화끈한 애견 미용일','강원도 홍천군 홍천읍 진리로 32','010-1211-7844','09:00~23:30','37.693339'||','||'127.889234','주차공간협소');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견병원','건강한애견병원','강원도 강릉시 교1동 1890-4 ','010-9099-9986','08:30~24:00','37.762364'||','||'128.876183','주차가능');


--충청

insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견병원','아프지마병원','충청남도 천안시 서북구 성정동 687-8','010-4625-1812','09:30~22:00','36.819335'||','||'127.141869','주차공간협소');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','이뻐저라얍애견미용실','충청남도 아산시 온양1동 85-34','010-8237-0017','08:00~20:00','36.782170'||','||'127.005171','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','이머리야 애견 미용일','대전광역시 서구 도산로370번길 55','010-1231-7844','09:00~21:30','36.335492'||','||'127.395018','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견용품','이것두좋아애견용품','대전광역시 중구 은행선화동 3-8','010-9009-1986','08:30~24:00','36.331829'||','||'127.425242','주차장공사중');

--전라도

insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견병원','전통한마음애견병원','전라북도 전주시 완산구 효자동3가 456-2','010-4025-1822','09:00~22:00','35.821234'||','||'127.104855','주차공간협소');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','이건어떄애견미용실','전라북도 전주시 완산구 효자1동 692-1','010-8217-2237','08:00~21:00','35.803623'||','||'127.135170','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','예술이야애견미용실','광주광역시 북구 군왕로 27','010-1891-7800','09:00~21:30','35.164107'||','||'126.930590','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견병원','광주애견병원','광주광역시 남구 월산동 33','010-9123-6712','08:30~23:30','35.147323'||','||'126.903211','주차장공사중');


--경상도
--부산
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견병원','사나이한마음애견병원','부산광역시 연제구 연산2동 1453-4','010-4023-1122','09:00~22:00','35.179085'||','||'129.077086','주차공간협소');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','마살아있네애견미용실','부산광역시 해운대구 반여동 1190-1','010-8222-2210','08:00~21:00','35.203426'||','||'129.115749','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','이런것도애견미용실','부산광역시 동래구 명안로46번마길 39','010-1891-7811','09:00~21:30','35.201518'||','||'129.107008','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견용품','이쁜가시나애견용품','부산광역시 동래구 충렬대로108번길 85-16','010-9123-9732','08:30~21:30','35.202487'||','||'129.074010','주차장공사중');

--울산

insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견병원','인누와애견병원','울산광역시 효문동 303 평창리비에르3차아파트','010-4023-1122','09:00~22:00','35.553783'||','||'129.354974','주차공간협소');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','너무이뻐꼬집을래미용실','울산광역시 북구 진장동 834','010-8222-2113','08:00~22:00','35.557783'||','||'129.359311','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견미용','울산대표애견미용실','울산광역시 중구 도화골15길 29','010-1891-8876','09:00~20:30','35.563392'||','||'129.332399','주차가능');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'애견용품','울산만큼이쁜애견미용실','울산광역시 중구 남외동 434-9','010-9123-9732','08:30~21:30','35.569222'||','||'129.341112','주차장공사중');

select * from tbl_shop;

drop table fastqa;
create table fastqa(--FAQDB
   faqno number primary key, --FAQ번호
   faqtitle varchar2(100) not null, --FAQ제목
   faqcontent varchar2(1500) not null, --FAQ내용
   faqreply varchar2(1500) not null, --FAQ답글
);

drop sequence fastqa_seq; --FAQ 번호 시퀀스
create sequence fastqa_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from fastqa;
   
drop table center;
create table center(--고객문의DB
   ctno number primary key, --고객문의번호
   mno number references amember(mno), --고객번호
   cttitle varchar2(100) not null, --고객문의제목
   ctcontent varchar2(1500) not null, --고객문의내용
);

drop sequence center_seq; --문의번호 시퀀스
create sequence center_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from center;
   
   
drop table center_reply;
create table center_reply(--고객답변DB
   ctrno number primary key, --고객답변번호
   ctno number references center(ctno), --문의번호
   ctrtitle varchar2(100) not null, --고객문의답볍제목
   ctrcontent varchar2(1500) not null, --고객문의답변내용
);

drop sequence center_reply_seq; --문의번호 시퀀스
create sequence center_reply_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from center_reply;   