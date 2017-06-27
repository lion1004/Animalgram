
--animalgram.sql

drop table amember;
create table amember( --ȸ��DB
   mno number primary key, --ȸ����ȣ
   idmail varchar2(50) unique, --ȸ�����̵�(�̸���)
   mpass varchar2(30) not null, --��й�ȣ
   nickname varchar2(30) not null, --�г���
   mname varchar2(30) not null, --�̸�
   birth varchar2(30) not null, --�������
   mgender varchar2(20)not null, --����
   job varchar2(20)default 'user', --����
   mtel varchar2(30)not null, --��ȭ��ȣ
   maddr varchar2(100) not null, --�������
   favorite varchar2(50) not null, --���ɺо�
   mdate date default sysdate --��������
   );


drop sequence amember_seq; -- ȸ�� ��ȣ ������
create sequence amember_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from amember;

drop table seller;
create table seller( --�Ǹ���DB
   sno number primary key, --�Ǹ��ڹ�ȣ
   mno number references amember(mno), --ȸ��DB(ȸ����ȣ)
   sname varchar2(100) not null, --�Ǹ��ڻ�ȣ��
   stel varchar2(30) not null, --�Ǹ��ڹ�ȣ
   saddr varchar2(100) not null, --�Ǹ��ּ�
   sdate date default sysdate --�Ǹ��� �������
);

drop sequence seller_seq; --�Ǹ��� ��ȣ ������
create sequence seller_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from seller;

drop table custom;
create table custom( --�ֹ����� DB
   cuno number primary key, --�ֹ����۹�ȣ
   sno number references seller(sno),--�Ǹ���DB(�Ǹ��ڹ�ȣ)
   ctitle varchar2(100) not null,--�۹�ȣ
   cprice number not null,--����
   cimage varchar2(100),--�ֹ����۹�ǰ�̹���
   cinfo varchar2(1500) not null,--ǰ������
   cdate date default sysdate--�ֹ����� �Խñ� �ø� ����
   );
   
drop sequence custom_seq; -- �ֹ����� ��ȣ ������
create sequence custom_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from custom;
   
drop table bill;
create table bill( --�ֹ���DB
   bno number primary key, --�ֹ�����ȣ
   mno number references amember(mno),--ȸ��DB(ȸ����ȣ)
   cuno number references custom(cuno),--�ֹ�����DB(�ֹ����۹�ȣ)
   bcount number not null, --�ֹ�����
   bmeno varchar2(200) not null,--�߰� �޸�
   bdeli varchar2(50) not null, --�ֹ� ��ǰ ���� �ּ�
   bdate date default sysdate--�ֹ�����
);

drop sequence bill_seq; --�ֹ��� ��ȣ ������
create sequence bill_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from bill;

drop table bill_ep;
create table bill_ep( --�ֹ��ı�DB
   beno number primary key,--�ı��۹�ȣ
   bno number references bill(bno),--�ֹ���DB(�ֹ�����ȣ)
   bestar number not null,--����
   becontent varchar2(100) not null--�ı⳻��
);

drop sequence bill_ep_seq; -- �ֹ��ı� ��� ��ȣ ������
create sequence bill_ep_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from bill_ep;

drop table donation;
create table donation( --����DB
   dno number primary key,--������ȣ
   mno number references amember(mno),--ȸ��DB(ȸ����ȣ)
   dtitle varchar2(100) not null,--��������
   dcount number not null,--��������
   dimage varchar2(100),--������ ��ǰ �̹���
   dcontent varchar2(1500) not null,--������ ����
   dstate varchar2(30) not null,--���� ����(���,������,��� ���)
   ddate date default sysdate--������ǰ�������
);

drop sequence donation_seq; --���� ��ȣ ������
create sequence donation_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from donation;

drop table donation_join;
create table donation_join( --��������DB
   mno number references amember(mno),--ȸ��DB(ȸ����ȣ)
   dno number references donation(dno)--����DB(�����۹�ȣ)
);

select * from donation_join;

drop table donation_ask;
create table donation_ask( --������ûDB
   dano number primary key,--������û����ȣ
   dno number references donation(dno),--����DB(������ȣ)
   mno number references amember(mno),--ȸ��DB(ȸ����ȣ)
   damemo varchar2(200) not null, --������û�� �޸�
   dadeli varchar2(50) not null,--���� ���� �ּ�
   dadate date default sysdate--������û����
);

drop sequence donation_ask_seq; --������û�� ��ȣ ������
create sequence donation_ask_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from donation_ask;

drop table notice_board;
create table notice_board( --�Խ���DB
   nno number primary key,--�Խ��� ��ȣ
   nname varchar2(50)--�Խ��� �̸�
);

drop sequence notice_board_seq; --�Խ��� ��ȣ ������
create sequence notice_board_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from notice_board;

drop table notice_text;
create table notice_text( --�Խñ�DB
   antno number primary key,--��ü �Խñ� ��ȣ
   mno number references amember(mno), --ȸ��DB(ȸ����ȣ)
   nno number references notice_board(nno), --�Խ���DB(�Խ��� ��ȣ)
   ntno number not null,--�� �Խ��� �� �Խñ� ��ȣ
   ntitle varchar2(100) not null, --�Խñ� ����
   ntcontent varchar2(1500) not null, --�Խñ� ����
   ntimage varchar2(100), -- �Խñ��̹���
   ntdate date default sysdate, --�Խñ� �������
   ntupdate date default sysdate--�Խñ� ��������
);

drop sequence notice_text_seq;--��ü�Խñ۹�ȣ ������
create sequence notice_text_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop sequence knowhow_seq;--���Ͽ�Խ��� �Խñ� ��ȣ ������
create sequence knowhow_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop sequence question_seq;--�����亯�Խ��� �Խñ� ��ȣ ������
create sequence question_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from notice_text;

drop table areply;
create table areply( --���DB
   arno number primary key, --��ü ��� ��ȣ
   mno number references amember(mno), --ȸ��DB(ȸ����ȣ)
   antno number references notice_text(antno), --�Խñ�DB(��ü �Խñ� ��ȣ)
   rno number not null, --�� �Խñۿ� ���� ��� ��ȣ
   rcontent varchar2(600) not null, --��� ����
   rdate date default sysdate, --��۵������
   rupdate date default sysdate --��ۼ�������
);

drop sequence areply_seq;--��ü��� ������
create sequence areply_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop sequence knowhow_areply_seq;--���Ͽ�Խ��� �Խñ� ��� ������
create sequence knowhow_areply_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
drop sequence question_areply_seq;--�����亯�Խ��� �Խñ� ��� ������
create sequence question_areply_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from areply;

drop table agroup;
create table agroup(--�Ҹ���DB
   gno number primary key, --�Ҹ��ӹ�ȣ
   gtitle varchar2(100) not null, --�Ҹ�������
   gplace varchar2(100) not null, --�Ҹ������
   glimit number not null, --�Ҹ������������ο�
   gtype varchar2(30) not null, --�Ҹ�������
   gstate varchar2(30) not null, --�Ҹ����������
   gdate date default sysdate --�Ҹ��ӱ۵������
);

drop sequence agroup_seq; --�Ҹ��� ��ȣ ������
create sequence agroup_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from agroup;

drop table animal;
create table animal(--�ݷ�����DB
   ano number primary key, --�ݷ�������ȣ
   mno number references amember(mno), --ȸ��DB(ȸ����ȣ)
   aname varchar2(30) not null, --�ݷ������̸�
   agender varchar2(20) not null, --�ݷ���������
   aage number not null, --�ݷ���������
   atype varchar2(30) not null, --�ݷ����� ����
   aimage varchar2(100), --�ݷ������̹���
   adate date default sysdate --�ݷ����� ��� ����
);

drop sequence animal_seq; --�ݷ�������ȣ ������
create sequence animal_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from animal;

drop table agroup_person;
create table agroup_person( --�Ҹ���������DB
   gpno number primary key, --�Ҹ��������ڹ�ȣ
   mno number references amember(mno), --ȸ��DB(ȸ����ȣ)
   ano number references animal(ano), --�ݷ�����DB(�ݷ�������ȣ)
   gno number references agroup(gno) --�Ҹ���DB(�Ҹ��ӹ�ȣ)
);

drop sequence agroup_person_seq; --�Ҹ��� ������ ��ȣ ������
create sequence agroup_person_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from agroup_person;

drop table  professional;
create table professional( --������DB
   pno number primary key, --��������ȣ
   mno number references amember(mno), --ȸ��DB(ȸ����ȣ)
   ptype varchar2(30) not null, --������ ����
   ptypeno varchar2(50) not null, --������ ��Ϲ�ȣ
   pcareer number not null --���������
);

drop sequence professional_seq; --������ ��ȣ ������
create sequence professional_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from professional;

drop table care;
create table care( --�Ʒ�����DB
	cno number primary key,
	pno number references professional(pno),
	ctype varchar2(30) not null,
	ccontent varchar2(1500) not null
);

drop sequence care_seq; --�Ʒù�ȣ ������
create sequence care_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from care;

drop table care_ask;
create table care_ask( --�Ʒ�����DB
	cano number primary key,
	cno number references care(cno),
	mno number references amember(mno),
	ano number references animal(ano),
	cadate date default sysdate,
	castate varchar2(30) not null
);

drop sequence care_ask_seq; --�Ʒù�ȣ ������
create sequence care_ask_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from care_ask;
   
   
drop table blacklist;
create table blacklist( --������ƮDB
   lno number primary key, --������Ʈ��ȣ
   mno number references amember(mno), --ȸ��DB(ȸ������)
   lcause varchar2(1500) not null, --������Ʈ ����
   ldate date default sysdate --������Ʈ �������
);

drop sequence blacklist_seq; --������Ʈ ��ȣ ������
create sequence blacklist_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from blacklist;

drop table shop;
create table shop(--��DB
   shno number primary key, --����ȣ
   shtype varchar2(30) not null, --������
   shname varchar2(50) not null, --���̸�
   shaddr varchar2(100) not null, --���ּ�
   shtel  varchar2(30) not null, --����ȭ��ȣ
   shtime varchar2(50) not null, --����ð�
   shsite varchar2(30) not null, --����ġ
   shparking varchar2(20) not null --������������
);

drop sequence shop_seq; --�� ��ȣ ������
create sequence shop_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from shop;