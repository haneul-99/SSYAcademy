

-----------------------------------------------
------------------- 민수님 
--학생
create table tblStudent(
    stuseq number primary key,
    stuname varchar2(30) not null,
    stubirth date not null,
    stuTel varchar2(30) not null,
    stugender varchar2(4) check(stugender in ('F', 'M')),
    stuid varchar2(30) not null,
    stupw varchar2(30) not null,
    stuaddress varchar2(100) not null,
    stuImage varchar2(500) default 'default.jpg' not null,
    stuemail varchar2(100) not null,
    sturegdate date default sysdate not null
);

create sequence seqStudent;


--지역테이블
create table tblLocation(
   lseq number primary key,
   lName varchar2(100) not null
);

create sequence seqLocation;


--질문 게시판 
create table tblQna(
   qSeq number primary key,
   qSubject varchar2(300) not null,
   qContent varchar2(3000) not null, 
   qRegdate date default sysdate not null,
   stuSeq number not null references tblStudent(stuSeq),
   aSeq number not null references tblAcademy(aSeq)
);

-- 질문 게시판 시퀀스
create sequence seqQna;


--질문게시판답변테이블
create table tblQnaAnswer(
   qaSeq number primary key,
   qaSubject varchar2(300) not null,
   qaContent varchar2(3000) not null,
   qaRegdate date default sysdate not null,
   qSeq number not null references tblQna(qSeq)
);

--질문게시판답변시퀀스
create sequence seqQnaAnswer;

------------------- 동석님 

--학원
create table tblAcademy(
   aSeq number primary key,      -- 학원 번호
   aName varchar2(150) not null,      -- 학원 이름
   aTel varchar2(30) not null,      -- 학원 연락처
   aImage varchar2(30) not null,   -- 학원 이미지
   aEmail varchar2(30) not null,      -- 학원 이메일
   aLink varchar2(100) not null,      -- 학원 링크
   aPay varchar2(30) not null,      -- 학원 등록비용
   aAddr varchar2(110) not null,      -- 학원 주소
   aInfo varchar2(3000) not null,   -- 학원 설명
   interviewOX varchar2(10) not null,   -- 면접여부
   aRgdate date default sysdate,      -- 등록날짜
   aRegOX varchar2(10) not null,   -- 등록 상태
   aId varchar2(30) not null,      -- 아이디
   aPw varchar2(30) not null,      -- 비번
   lSeq number not null references tblLocation(lSeq),
   acTSeq number not null references tblAcademyType(actSeq)
);
create sequence seqAcademy;

--학원 수료생 후기 게시판
create table tblCompleteReview(
   crSeq number primary key,      -- 수료생 후기 게시판 번호
   crSubject varchar2(300) not null,   -- 제목
   crContent varchar2(3000) not null,   -- 내용
   crRegdate date default sysdate,   -- 작성일
   stuSeq number not null references tblStudent(stuSeq),
   aSeq number not null references tblAcademy(aSeq)
);
create sequence seqCompleteReview;

--학원유형
create table tblAcademyType(
   acTSeq number primary key,      -- 학원유형 번호
   acType varchar2(30) not null      -- 학원 유형
);
create sequence seqAcademyType;

--코딩테스트
create table tblCodeTest(
   ctSeq number primary key,      -- 코딩 테스트 번호
   ctSubject varchar2(300) not null,   -- 문제 제목
   ctlevel varchar2(10) not null,      -- 난이도
   ansRate number not null,      -- 정답률
   skSeq number not null references tblSkils(skSeq)
);
create sequence seqCodeTest;

------------------- 동환님
create table tblClassReview (
    crSeq number primary key, --과정후기번호
    crContent varchar2(3000) not null, --후기내용
    crRegdate date default sysdate not null, --작성일
    crStar varchar2(10) not null,
    stuSeq number not null references tblStudent(stuSeq), --학생번호
    cSeq number   not null references tblClass(cSeq) --개설과정번호
    

)
create sequence seqClassReview;


create table tblAdmin (
adSeq  number primary key, -- 관리자 번호
adTel  varchar2(30) not null,    -- 연락처
adName varchar2(30)   not null, -- 이름
adEmail   varchar2(30) not null,    -- 이메일
adPw varchar2(30) not null, -- 비밀번호
adId   varchar2(30) not null -- 아이디
)
create sequence seqAdmin;

create table tblJjim (
jSeq number   primary key, -- 관심학원번호
stuSeq number not null references tblStudent(stuSeq), -- 학생번호
aSeq number not null references tblAcademy(aSeq) -- 학원 번호
)

create sequence seqJjim;

create table tblArrestBoard (
abSeq number primary key,                           --신고게시물번호                      
crSeq number references tblCompleteReview(crSeq)    --  수료생 후기게시판 번호
)

create sequence seqArrestBoard;

create table tblResume (
    rSeq number primary key, --이력서 번호
    edu varchar2(100),--최종학력
    army varchar2(100),--병력
    license varchar2(100), --자격증여부
    introduce varchar2(3000), --자기소개
    stuSeq number references tblStudent(stuSeq) --학생번호
)

create sequence seqResume;


------------------- 김하늘 
-- 팀프로젝트
create table tblProject (
    prSeq number primary key,                       -- 팀프로젝트번호
    prSubject varchar2(300) not null,               -- 주제
    prInfo varchar2(3000) not null,                 -- 상세정보
    stuCnt number not null,                         -- 희망 인원 수
    prPeriod varchar2(50) not null,                 -- 프로젝트 기간
    prRegdate DATE default sysdate,                 -- 프로젝트 게시일
    prStatus varchar2(30) not null                  -- 프로젝트 진행상태
);

create sequence seqProject;

-- 팀 프로젝트 신청
create table tblApplyProject (
    apSeq number primary key,                               -- 신청번호
    stuSeq number not null references tblStudent(stuSeq),   -- 학생번호
    prSeq number not null references tblProject(prSeq)      -- 팀 프로젝트 번호
);

create sequence seqApplyProject;

-- 팀 프로젝트 직위
create table tblProjectLv( 
    plSeq number primary key,               -- 직위번호
    lvName varchar2(30) not null            -- 직위명
);

create sequence seqProjectLv;

-- 팀 프로젝트 소속
create table tblProjectMember(
    pmSeq number primary key,                               
    plSeq number not null references tblProjectLv(plSeq),   
    prSeq number not null references tblProject(prSeq),         
    stuSeq number not null references tblStudent(stuSeq)       
);

create sequence seqProjectMember;


------------------------------김유진

-- 개설 강좌
create table tblClass (
    cSeq number primary key,
    cPeriod varchar2(50) not null,
    cTime varchar2(50) not null,
    stuNum number not null,
    rPeriod varchar2(50) not null,
    cInfo varchar2(3000) not null,
    cRegdate date default sysdate,
    cCategory varchar2(300) not null,
    cName varchar2(500) not null,
    aSeq number not null references tblAcademy(aSeq)
    
);
create sequence seqClass;
Alter table tblclass modify cname varchar2(500);


-- 개설과정언어연결
create table tblMapCSK (
    cskSeq number primary key,
    cSeq number not null references tblClass(cSeq),
    skSeq number not null references tblSkils(skSeq)
);

create sequence seqMapCSK;


-- 과정 언어
create table tblSkils (
    skSeq number primary key,
    skName varchar2(30) not null
);

create sequence seqSkils;



-- 공지사항
create table tblNotice (
    nSeq number primary key,
    nSubject varchar2(300) not null,
    nContent varchar2(3000) not null,
    nRegdate date default sysdate,
    nViewCnt varchar2(10) not null,
    nAttach varchar2(30) not null
);

create sequence seqNotice;


--------------------------------구대현
--강사
create table tblTeacher (
    tSeq number primary key,
    tName varchar2(30) not null,
    aSeq number references tblAcademy(aSeq)
);

create sequence seqTeacher;

--강사후기
create table tblTeacherReview(
    trSeq number primary key,
    trContent varchar2(3000) not null,
    trRegdate date default sysdate,
    tSeq number references tblTeacher(tSeq),
    stuSeq number references tblStudent(stuSeq),
    trStar varchar2(10) not null
);

create sequence seqTeacherReview;

--강좌학생연결
create table tblMapCS(
    mcsSeq number primary key,
    stuSeq number references tblStudent(stuSeq),
    cSeq number references tblClass(cSeq)
);

create sequence seqMapCS;

--개발자커뮤니티
create table tblCommunity (
    cmSeq number primary key,
    cmSubject varchar2(300) not null,
    cmContent varchar2(3000) not null,
    cmRegdate date default sysdate,
    cmViewCnt number not null,
    cmAttach varchar2(100) null,
    ctSeq number references tblComuTag(ctSeq)
);

create sequence seqCommunity;

--개발자커뮤니티태그
create table tblComuTag(
    ctSeq number primary key,
    taName varchar2(100) not null
);

create sequence seqComuTag;


-------------------------------추가--------------------------
create table tblProjectComment(
    pcSeq number primary key,
    pcContent varchar2(3000) not null,
    stuSeq number not null references tblStudent(stuSeq),
    prSeq number not null references tblProject(prSeq)
);

create table tblReceiver(
    reSeq number primary key,
    stuSeq number not null references tblStudent(stuSeq)
);
create sequence seqReceiver;


create table tblSender(
    seSeq number primary key,
    stuSeq number not null references tblStudent(stuSeq)
);
create sequence seqSender;


  create table tblPost(
    poSeq number primary key,
    poContent varchar2(2000) not null,
    poRegdate date  default sysdate not null,
    seSeq number not null references tblSender(seSeq),
    reSeq number not null references tblReceiver(reseq)
);
create sequence seqPost;


create table tblComuComment (
    ccSeq number primary key,
    ccContent varchar2(2000) not null,
    ccRegdate date  default sysdate not null,
    cmSeq number not null references tblCommunity(cmSeq),
    stuSeq number not null references tblStudent(stuseq)
)
create sequence seqcomucomment;


-- 셀렉트

select * from tblreceiver; v
select * from tblsender; v
select * from tblPost; v
select * from tblProject; v
select * from tblApplyProject; v
select * from tblProjectLv; 
select * from tblProjectMember; v
select * from tblAcademy; v
select * from tblCompleteReview; v
select * from tblAcademyType;
select * from tblCodeTest; v
select * from tblStudent; 
select * from tblLocation;  
select * from tblQna; v
select * from tblQnaAnswer;  v
select * from tblClassReview; v
select * from tblAdmin; 
select * from tblJjim; v
select * from tblArrestBoard;  v
select * from tblResume; v
select * from tblClass; v
select * from tblMapCSk;v 
select * from tblSkils;
select * from tblNotice; v
select * from tblTeacher; v 
select * from tblTeacherReview;  v
select * from tblMapCS; v
select * from tblCommunity; v
select * from tblComuTag;

