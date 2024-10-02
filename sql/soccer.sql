-- 축구선수 테이블
    CREATE TABLE PLAYER_SOCCER (
      PLAYERNUM VARCHAR2(20 BYTE) 
    , TNAME VARCHAR2(20 BYTE) 
    , PNAME VARCHAR2(20 BYTE) 
    , PNUMBER NUMBER(3, 0) 
    , PBIRTH DATE 
    , HEIGHT NUMBER(3, 0) 
    , WEIGHT NUMBER(3, 0) 
    , MAIN VARCHAR2(20 BYTE) 
    , PIMAGE VARCHAR2(100 BYTE) 
    , PCHAR VARCHAR2(100 BYTE) 
    , CLICKUP NUMBER(10, 0) DEFAULT 0 
    , STEP NUMBER(6, 0) DEFAULT 0 
    , INDENT NUMBER(6, 0) DEFAULT 0 
    , PLAY VARCHAR2(20 BYTE) 
    );

-- 축구팀 랭킹 테이블
    CREATE TABLE SOCCER_TEAM (
      YEAR NUMBER(4, 0) 
    , TEAM VARCHAR2(20 BYTE) 
    , WIN NUMBER(3, 0) 
    , DRAW NUMBER(3, 0) 
    , LOSE NUMBER(3, 0) 
    , GAIN NUMBER(5, 0) 
    , LOST NUMBER(5, 0) 
    , ASSIST NUMBER(4, 0) 
    , FOUL NUMBER(3, 0) 
    );
      
-- 축구 선수 랭킹 테이블
     create table soccer_player(
    playernum number(6),
    year number(4),
    round number(3),
    gain number(3),
    assist number(3),
    attackpoint number(3),
    avgscore float,
    mom number(2),
    best11 number(2),
    shoot number(3),
    possibleshoot number(3)
    );
    -- 축구 랭킹 등록 쿼리문
    insert into soccer_team values (2024,'강원', 29,15, 6, 8,53,44, 33,321);
    insert into soccer_team values (2024,'울산', 29,15, 6, 8,48,35, 28,294);
    insert into soccer_team values (2024,'수원', 29,14, 6, 9,44,38, 32,276);
    insert into soccer_team values (2024,'김천', 29,13, 8, 8,41,33, 21,275);
    insert into soccer_team values (2024,'서울', 29,13, 7, 9,44,31, 36,290);
    insert into soccer_team values (2024,'포항', 29,12, 8, 9,46,38, 28,247);
    insert into soccer_team values (2024,'광주', 29,12, 1, 16,35,40, 20,307);
    insert into soccer_team values (2024,'제주', 29,11, 2, 16,27,42, 11,271);
    insert into soccer_team values (2024,'대전', 29,7, 10, 12,32,40, 21,306);
    insert into soccer_team values (2024,'인천', 29,7, 10, 12,31,38, 18,293);
    insert into soccer_team values (2024,'전북', 29,7, 9, 13,34,49, 22,304);
    insert into soccer_team values (2024,'대구', 29,7, 9, 13,30,37, 13,302);

   insert into soccer_player values (1,2024,29,14,1,15,6.9,4,4,67,37);
   insert into soccer_player values (2,2024,28,12,5,17,7.0,4,3,43,29);
   insert into soccer_player values (3,2024,24,11,2,13,7.1,6,7,64,30);
   insert into soccer_player values (4,2024,22,10,2,12,7.0,4,4,43,30);
   insert into soccer_player values (5,2024,29,10,6,16,6.9,6,5,53,29);
   
   insert into soccer_player values (6,2024,16,9,5,14,7.3,4,6,58,33);
   insert into soccer_player values (7,2024,27,9,5,14,6.8,1,1,34,23);
   insert into soccer_player values (8,2024,26,8,4,12,7.0,3,5,45,30);
   insert into soccer_player values (9,2024,27,8,3,11,6.9,3,3,30,19);
   insert into soccer_player values (10,2024,29,8,6,14,7.0,4,6,40,21);

   insert into soccer_player values (11,2024,29,8,5,13,7.0,3,6,36,22);
   insert into soccer_player values (12,2024,24,7,6,13,7.2,5,5,88,38);
   insert into soccer_player values (13,2024,16,6,3,9,7.2,1,1,26,17);
   insert into soccer_player values (14,2024,24,6,2,8,6.9,2,2,18,13);
   insert into soccer_player values (15,2024,27,6,1,7,6.7,2,2,42,18);
   
   insert into soccer_player values (16,2024,29,6,4,10,6.9,4,5,32,22);
   insert into soccer_player values (17,2024,19,5,0,5,6.6,1,1,15,9);
   insert into soccer_player values (18,2024,19,5,1,6,7.0,2,2,17,9);
   insert into soccer_player values (19,2024,20,5,1,5,6.7,1,1,30,13);
   insert into soccer_player values (20,2024,20,5,0,5,6.9,2,3,23,14);
