
--animalgram.sql

drop table amember;
create table amember( --ȸ��DB
   mno number primary key, --ȸ����ȣ
   idmail varchar2(50) unique, --ȸ�����̵�(�̸���)
   mpass varchar2(30) not null, --��й�ȣ
   nickname varchar2(30) unique, --�г���
   mname varchar2(30) not null, --�̸�
   birth varchar2(30) not null, --�������
   mgender varchar2(20)not null, --����
   job varchar2(20)default 'user', --����
   mtel varchar2(30)not null, --��ȭ��ȣ
   maddr varchar2(100) not null, --�������
   favorite varchar2(50) not null, --���ɺо�
   pwcode varchar2(100) not null,   -- �����ڵ�
   pwcodeas varchar2(100) not null,   -- �����ڵ� �亯
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
   cuno number primary key, --�ֹ����۹�ȣj
   sno number references seller(sno),--�Ǹ���DB(�Ǹ��ڹ�ȣ)
   cutitle varchar2(100) not null,--������
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
create table bill( --�ֹ���DB
   bno number primary key, --�ֹ�����ȣ
   mno number references amember(mno),--ȸ��DB(ȸ����ȣ)
   cuno number references custom(cuno),--�ֹ�����DB(�ֹ����۹�ȣ)
   bcount number not null, --�ֹ�����
   bmemo varchar2(200) not null,--�߰� �޸�
   bsellcount number default '0', -- �ֹ� �������� 
   bdate date default sysdate,--�ֹ�����
   bstate varchar2(20) default '��ǰ�غ���'
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
   bedate date default sysdate--�ı��ϳ�¥
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
   dinfo varchar2(1500) not null,--������ ����
   dadate date default sysdate,--������ǰ�������
   dimage varchar2(100) --���� ��ǰ �̹���
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

drop table donation_ask; --bill
create table donation_ask( --������ûDB
   dano number primary key,--������û����ȣ
   dno number references donation(dno),--����DB(������ȣ)
   mno number references amember(mno),--ȸ��DB(ȸ����ȣ)
   damemo varchar2(200) not null, --������û�� �޸�
   dadate date default sysdate--������û����
   dastate varchar2(20) default '��ǰ�غ���'
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
   gcount number default 0, --�Ҹ������������ο�
   gtype  varchar2(30) not null, --�Ҹ�������
   gstate varchar2(30) default '����', --�Ҹ����������
   gdate  varchar2(50) not null,--�Ҹ��ӱ۵������
   gimage varchar2(100) not null,
   gwdate date default sysdate --�Ҹ��ӱ۵������
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
   pimage varchar2(100) not null, --������ ����
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
	ctitle varchar2(100) not null,
	ctype varchar2(30) not null,
	cdate varchar2(50) not null,
	cstate varchar2(30) default '���డ��',
	cimage varchar2(100) not null,
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
	castate varchar2(30) default '����'
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

--shop
--sitehospital.sql


drop table tbl_shop;
--���̺����

create table tbl_shop(--���̺����
 shno number primary key,          --������ȣ
 shtype varchar2(20) not null,     --����Ÿ��
 shname varchar2(40) not null,     --�����̸�
 shaddr varchar2(100) not null,    --�����ּ�
 shtel varchar2(50) not null,      --������ȭ��ȣ
 shtime varchar2(40) not null,     --���������ð�
 shsite varchar2(300) not null,    --���� ��ǥ
 shparking varchar2(100) not null  --�����������ɿ���
);

drop sequence shop_seq;--shno�� ���ѽ���������
create sequence shop_seq--shno�� ���ѽ��������� 
	start with 1
	increment by 1
	nocycle
	nocache;
	
	
	--SampleDATA--
	
	--����--
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
  values (shop_seq.nextval,'�ְ߹̿�','����ְ߹̿��','����Ư���� ��õ�� ���������1�� 168','010-6818-4409','09:00~21:00','37.480056'||','||'126.882468','��������');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
  values (shop_seq.nextval,'�ְߺ���','������ξְߺ���','����Ư���� �������� ���߷� 15','010-5252-6563','07:00~24:00','37.517152'||','||'126.904153','������������');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
  values (shop_seq.nextval,'�ְ߿�ǰ','��ǰ���ְ߿�ǰ','����Ư���� ������ ���ﵿ 831-5','010-6785-4545','10:00~20:00','37.494635'||','||'127.030131','�����������');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ����պ���','���������ְߺ���','���� ���ʱ� �̼���','010-3443-7656','9:30~20:30','37.484046'||','||'126.982225','�����������');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'���յ�������','�������� ���պ���','����Ư���� ���� �Ż�1�� 23-4','010-3443-7656','9:30~20:30','37.598765'||','||'126.915167','�����������');
  
  --���--
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߿�ǰ','�ְ����ι̿��','��⵵ �Ⱦ�� ���ȱ� ȣ�赿','010-5959-5545','11:00~21:00','37.389652'||','||'126.951957','��������');
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ����ո���','�츮�ְ߹̿��','��⵵ ������ ������ 2���ⱸ','010-6757-1234','11:00~21:00','37.266441'||','||'127.002276','�����������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','�����Ѿְ߹̿��','��⵵ ���� ���籸 ���ﵿ ��5-1','010-2331-4542','09:00~19:00','37.653438'||','||'127.002276','�����������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ����ո���','�ư����ո���','��⵵ �����ν� �ݿ��� 469-3','010-6757-1234','11:00~21:00','37.750905'||','||'127.065856','�����������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','�̱߰߹̿��','��⵵ ������ ������ 2���ⱸ','010-6757-1234','11:00~21:00','37.266441'||','||'127.002276','�����������');
  



--������

insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְߺ���','�ѾƸ��ְߺ���','������ ��õ�� ȿ���� 33','010-7865-9812','09:30~22:00','37.871320'||','||'127.736922','������������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','���򳭾ְ߹̿��','������ ȫõ�� ȭ�̸� ����ɷ� 1171-1','010-8967-4577','08:00~23:00','37.749958'||','||'128.056982','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','ȭ���� �ְ� �̿���','������ ȫõ�� ȫõ�� ������ 32','010-1211-7844','09:00~23:30','37.693339'||','||'127.889234','������������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְߺ���','�ǰ��Ѿְߺ���','������ ������ ��1�� 1890-4 ','010-9099-9986','08:30~24:00','37.762364'||','||'128.876183','��������');


--��û

insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְߺ���','������������','��û���� õ�Ƚ� ���ϱ� ������ 687-8','010-4625-1812','09:30~22:00','36.819335'||','||'127.141869','������������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','�̻������ְ߹̿��','��û���� �ƻ�� �¾�1�� 85-34','010-8237-0017','08:00~20:00','36.782170'||','||'127.005171','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','�̸Ӹ��� �ְ� �̿���','���������� ���� �����370���� 55','010-1231-7844','09:00~21:30','36.335492'||','||'127.395018','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߿�ǰ','�̰͵����ƾְ߿�ǰ','���������� �߱� ���༱ȭ�� 3-8','010-9009-1986','08:30~24:00','36.331829'||','||'127.425242','�����������');

--����

insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְߺ���','�����Ѹ����ְߺ���','����ϵ� ���ֽ� �ϻ걸 ȿ�ڵ�3�� 456-2','010-4025-1822','09:00~22:00','35.821234'||','||'127.104855','������������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','�̰Ǿ�ְ߹̿��','����ϵ� ���ֽ� �ϻ걸 ȿ��1�� 692-1','010-8217-2237','08:00~21:00','35.803623'||','||'127.135170','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','�����̾߾ְ߹̿��','���ֱ����� �ϱ� ���շ� 27','010-1891-7800','09:00~21:30','35.164107'||','||'126.930590','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְߺ���','���־ְߺ���','���ֱ����� ���� ���굿 33','010-9123-6712','08:30~23:30','35.147323'||','||'126.903211','�����������');


--���
--�λ�
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְߺ���','�糪���Ѹ����ְߺ���','�λ걤���� ������ ����2�� 1453-4','010-4023-1122','09:00~22:00','35.179085'||','||'129.077086','������������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','������ֳ׾ְ߹̿��','�λ걤���� �ؿ�뱸 �ݿ��� 1190-1','010-8222-2210','08:00~21:00','35.203426'||','||'129.115749','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','�̷��͵��ְ߹̿��','�λ걤���� ������ ��ȷ�46������ 39','010-1891-7811','09:00~21:30','35.201518'||','||'129.107008','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߿�ǰ','�̻۰��ó��ְ߿�ǰ','�λ걤���� ������ ��Ĵ��108���� 85-16','010-9123-9732','08:30~21:30','35.202487'||','||'129.074010','�����������');

--���

insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְߺ���','�δ��;ְߺ���','��걤���� ȿ���� 303 ��â���񿡸�3������Ʈ','010-4023-1122','09:00~22:00','35.553783'||','||'129.354974','������������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','�ʹ��̻����������̿��','��걤���� �ϱ� ���嵿 834','010-8222-2113','08:00~22:00','35.557783'||','||'129.359311','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߹̿�','����ǥ�ְ߹̿��','��걤���� �߱� ��ȭ��15�� 29','010-1891-8876','09:00~20:30','35.563392'||','||'129.332399','��������');
  
insert into tbl_shop (shno,shtype,shname,shaddr,shtel,shtime,shsite,shparking)
values (shop_seq.nextval,'�ְ߿�ǰ','��길ŭ�̻۾ְ߹̿��','��걤���� �߱� ���ܵ� 434-9','010-9123-9732','08:30~21:30','35.569222'||','||'129.341112','�����������');

select * from tbl_shop;

drop table fastqa;
create table fastqa(--FAQDB
   faqno number primary key, --FAQ��ȣ
   faqtitle varchar2(100) not null, --FAQ����
   faqcontent varchar2(1500) not null, --FAQ����
   faqreply varchar2(1500) not null, --FAQ���
);

drop sequence fastqa_seq; --FAQ ��ȣ ������
create sequence fastqa_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from fastqa;
   
drop table center;
create table center(--������DB
   ctno number primary key, --�����ǹ�ȣ
   mno number references amember(mno), --����ȣ
   cttitle varchar2(100) not null, --����������
   ctcontent varchar2(1500) not null, --�����ǳ���
);

drop sequence center_seq; --���ǹ�ȣ ������
create sequence center_seq
   start with 1
   increment by 1
   nocycle
   nocache;
   
select * from center;
   
   
drop table center_reply;
create table center_reply(--���亯DB
   ctrno number primary key, --���亯��ȣ
   ctno number references center(ctno), --���ǹ�ȣ
   ctrtitle varchar2(100) not null, --�����Ǵ亱����
   ctrcontent varchar2(1500) not null, --�����Ǵ亯����
);

drop sequence center_reply_seq; --���ǹ�ȣ ������
create sequence center_reply_seq
   start with 1
   increment by 1
   nocycle
   nocache;

select * from center_reply;   