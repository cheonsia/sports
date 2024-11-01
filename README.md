# 축구 야구 통합사이트 IN:OUT ⚽⚾
<br>

## 🏆 프로젝트 소개 
축구 야구 통합 사이트 IN:OUT은 축구, 야구를 즐기는 사람들의 정보 공간을 구현한 프로젝트입니다.<br>
회원에게는 선수 및 경기 정보를 제공하고,<br>
감독에게는 전략과 훈련일지를 작성 및 관리하는 공간을 제공합니다.<br><br>
![003](https://github.com/user-attachments/assets/d7233bd5-566a-4b31-aef5-1cf1d9fcc52b)
![004](https://github.com/user-attachments/assets/2c01417c-af5c-4e5b-ac4b-5adea244c211)
<br><br><br>

## 🏆 프로젝트 개발 기간
2024.09.23 ~ 2024.11.01
<br><br>
![006](https://github.com/user-attachments/assets/9243e42d-768e-4566-94b8-898afccc923f)
<br><br><br>

## 🏆 팀 멤버
권석주, 김민성, 김규리, 이혜린, 천시아
<br><br>
![007](https://github.com/user-attachments/assets/5dd7aa03-a0fc-426c-8239-ab1b12fcedd2)
<br><br><br>

## 🏆 기술 스택
✔️ HTML, CSS, JavaScript<br>
✔️ Ajax, JQuery<br>
✔️ Oracle, MyBatis, Servlets&Jsp<br>
✔️ Java, Spring Framework<br>
✔️ Git<br>
✔️ Python<br><br>  
![005](https://github.com/user-attachments/assets/a839f7e0-4dd2-448d-bd70-08dfde3cce7c)
<br><br><br>

## 🏆 유스케이스 다이어그램 및 ER 다이어그램
![008](https://github.com/user-attachments/assets/74b632e5-69ff-4e64-bee7-7cb7f3ec378b)
![012](https://github.com/user-attachments/assets/f4c76750-2811-46d5-8158-7c6b0d523353)
<br><br><br>

## 🏆 주요 기능
### ✔️ 회원 가입 및 로그인<br>
&nbsp; - 공통 : 감독, 일반 회원 구분하여 회원가입<br>
&nbsp; - 각 부문 별 유효성 검사<br>
&nbsp; - ID 중복, PW 일치 검사<br>
&nbsp; - 주소 (다음 주소 API)<br>
&nbsp; - 아이디 찾기, 비밀번호 찾기<br>
&nbsp; - 회원 정보 출력, 수정, 삭제<br>
&nbsp; - 감독 : 회원가입 시 관리자 승인 필요<br>
![017](https://github.com/user-attachments/assets/901e562c-7b39-4615-965a-b788940b0885)
![018](https://github.com/user-attachments/assets/ef9e04f7-aa12-45f9-9f93-b1f3d1559b2b)
![019](https://github.com/user-attachments/assets/b9700197-113a-453c-98a0-4a5e372838fe)
<br><br><br>

### ✔️ 마이페이지<br>
&nbsp; - 마이페이지 회원 정보 조회, 수정, 탈퇴<br>
&nbsp; - 마이페이지 정보 수정 시 모달창 이용한 비밀번호 확인(Ajax)<br>
![021](https://github.com/user-attachments/assets/f2a45c40-eef1-46dc-a117-073e5ca398c5)
<br><br><br>

### ✔️ 선수 관리<br>
&nbsp; - 공통 : 선수 정보 조회, 상세 페이지<br>
&nbsp; - 감독, 관리자 : 선수 정보 등록, 수정, 삭제 기능 추가<br>
&nbsp; - 상세 페이지: 선수 상세 정보 조회, 댓글 및 응원 기능 부여<br>
&nbsp; - 댓글: 작성, 조회, 수정, 삭제 (페이징 처리)<br>
&nbsp; - 랭킹 : 선수 부문별 랭킹 (네이버 스포츠, K리그 크롤링)<br>
&nbsp; - 랜덤 뽑기 : 랜덤 함수 이용하여 선수 랜덤으로 뽑기 구현<br><br>
![032](https://github.com/user-attachments/assets/54ba386e-4ef0-4a68-97c6-a2f56caae786)
![034](https://github.com/user-attachments/assets/921b9adc-2a38-4359-a0fb-41cf17031e49)
![037](https://github.com/user-attachments/assets/c7eaa4ca-fc2c-4d28-ac35-3b88c7679791)
<br><br><br>

### ✔️ 경기 관리<br> 
&nbsp; - 공통 : 경기 일정 조회, 경기장 확인 (카카오맵 API) <br>
&nbsp; - 팀 순위 : 팀별 경기 순위 조회 (네이버 스포츠 크롤링)<br>
&nbsp; - 하이라이트 : 팀 별 영상 , 공식 계정(K리그, KBO) 영상 조회 (유튜브 API)<br>
&nbsp; - 관리자 : 경기 일정 등록 , 조회, 수정, 삭제<br><br>
![038](https://github.com/user-attachments/assets/27779eb8-2600-43ea-a78d-f139b34097ca)
![040](https://github.com/user-attachments/assets/8c943812-35d1-46d4-ab80-93c4b2cdb3d7)
<br><br><br>

### ✔️ 굿즈샵<br>
&nbsp; - 공통 : 팀 별 공식 쇼핑몰로 이동<br><br>
![041](https://github.com/user-attachments/assets/587532b0-3d46-44ee-94a9-bc5c08bf2982)
<br><br><br>
 
### ✔️ 전략<br>
&nbsp; - 선수 배치하여 전략 저장 (좌표)<br>
&nbsp; - 감독 : 선수 배치, 전략 저장, 전략 조회, 전략 수정, 전략 삭제 <br>
![042](https://github.com/user-attachments/assets/984177ef-ac00-4fad-9406-03086b249c8f)
<br><br><br>

### ✔️ 훈련 일지<br>
&nbsp; - 일지 유형, 인원, 장소, 일정, 메모 입력하여 저장하여 캘린더 관리 <br>
&nbsp; - 감독 : 일지 저장, 조회, 수정, 삭제 <br>
![043](https://github.com/user-attachments/assets/b0a7be8f-1e18-4c2c-b240-bbf6e7d40b15)
<br><br><br>

### ✔️ 문의 게시판<br>
&nbsp; - 공통: 공개글/비밀글 작성, 조회(페이징), 수정, 삭제, 검색<br> 
&nbsp; - 비밀글 조회, 수정, 삭제(비밀번호 모달창 이용) <br>
&nbsp; - 관리자: 공개 글, 비밀 글 조회 및 삭제, 답변 가능<br>
![023](https://github.com/user-attachments/assets/9bd29154-973a-4208-aa83-233d3c468d54)
![024](https://github.com/user-attachments/assets/cda187c0-4800-46b4-8c3f-c611f130c6b0)
![028](https://github.com/user-attachments/assets/e338e6b1-fa63-4855-a3b2-bd5437977be8)
![030](https://github.com/user-attachments/assets/9e799478-890d-4039-9cd1-829d9d85d4ea)
<br><br><br>

### ✔️ 회원 정보<br>
&nbsp; - 관리자 : 회원 정보 조회, 삭제 및 계정 승인, 보류 <br>
&nbsp; - 회원 연령대별 선호 종목, 종목별 팀 선호도 데이터 시각화 (파이썬)<br><br>
![046](https://github.com/user-attachments/assets/1b56b011-4ce7-4e46-9c71-c35e9f769636)
![048](https://github.com/user-attachments/assets/266fa460-cb08-4fd8-9fb5-839bc6d08abc)
<br><br><br>

### ✔️ 전체 파일<br>
[IN_OUT.pdf](https://github.com/user-attachments/files/17596612/IN_OUT.pdf)
