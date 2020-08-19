# project002
개인 프로젝트 : 호텔 홈페이지 구현

메뉴구조도
디자인 시안 
-----------------------------------------
html/css 

1. 메인
2. 서브페이지 
4. 파일게시판(자료업로드)
5. 갤러리(이벤트게시판)
9. 메일 폼 
- 페이지네이션 부분 좀 더 예쁘게 

------------------------------------------
jsp
- 회원가입폼 정보입력 조건들(NN, 글자수 제한 등) 걸어야 함!! // 정규식 처리 
- 글 삭제, 수정 버튼 작성자만 볼 수 있도록 처리
 
------------------------------------------
구현해야 할 기능
1. 우편번호 API 
2. 게시판 에디터 API
3. 지도 API 
4. 메일 폼 API
5. 비밀번호 수정
6. sub헤더 부분 로케이션 처리 

-----------------------------------------------------------------------------------------------------------------------
작업완료

- 200730 웹폰트 설치, 헤더 영역 제작 
- 200801 
3. 게시판(공지사항) + 답글 
6. 회원가입창
10. 로그인창
footer 영역 제작

- 200802
DB 테이블 생성(Member, board) / 자바빈 생성
회원가입 - DB연동 처리, id중복체크 
 
- 200807 로그인 처리
- - header 메뉴 애니메이션 수정(추후 페이드인 추가)
- 글쓰기 폼, 답글 폼 추가, 회원정보 수정 폼 및 탈퇴 폼 추가 

200808
- 헤더 상단 login/logout 메뉴 다르게 보이도록 처리
- 로그아웃 처리
- 회원정보 수정/탈퇴 페이지 전 비밀번호 확인
- 회원정보 보기 
- 회원정보 수정(비밀번호 체크), 회원 탈퇴

200813 
- 글 등록처리
- 게시판 리스트에 글 불러오기

200814
- 더미테이블 생성해서 페이지네이션 작동 확인(페이징 처리)
< 프로시저를 이용한 SQL 구문 >

SELECT * FROM hoteldb.hotel_board;
DELIMITER $$
DROP PROCEDURE IF EXISTS loopInsert$$
CREATE PROCEDURE loopInsert()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 120 DO
        INSERT INTO hotel_board(bno , id, name , passwd , subject, content, readcount, re_ref, re_lev, re_seq, date, file, ip)
          VALUES(i, concat('admin ',i), '관리자', '1234', concat('공지사항 게시판입니다. ',i), concat('내용테스트 ',i), 0, bno, 0, 0, now(), null, null);
        SET i = i+1;
    END WHILE;
END$$
DELIMITER $$

CALL loopInsert;

- 작성한 글 확인 처리
- 글 삭제 처리
- 글 수정 처리

200817
- 답글 처리 
- 우편번호 api 처리 

200819 
- 파일게시판 기본게시판 기능 구현 
- 파일 업로드까지 진행
- 답글 처리 및 그에 따른 목록 형태 변경(들여쓰기)
- 답글게시판 동작에서 re_ref 오류(수정해야함)

- modify.jsp에서 form에 enctype="multipart/form-data"> 붙이면 수정 안 되는 문제
