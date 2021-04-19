<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 조회</title>
</head>
<body>
    
    <%@ include file="../adminPageLeftMenuBar.jsp" %>
    
           <!-- 상단 타이틀 -->
        <div id="content2_1">
            <h2>회원관리 > 회원 전체 조회</h2>
        </div>

        <hr style="border:1px solid gray">
        <br><br>

     </div>
     <br><br>
         
        <div align="right" class="searchArea">
            <button>검색</button> 
            <input type="text">
        </div>
        <br>
        <table class="listArea" align="center">
                <thead>
                    <tr>
                        <th width="30"></th>
                        <th width="90">이름</th>
                        <th width="90">아이디</th>
                        <th width="200">휴대폰 번호</th>
                        <th width="70">성별</th>
                        <th width="70">나이</th>
                        <th width="120">가입일</th>
                        <th width="70">탈퇴여부</th>
                    </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>홍길동</td>
                    <td>user01</td>
                    <td>010-1111-2222</td>
                    <td>여</td>
                    <td>20</td>
                    <td>2019-01-01</td>
                    <td>N</td>
                </tr>
            </tbody>
        </table>
        <br>

    <br>
    
    <!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
    <!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
    <div align="center" class="pagingArea">
         <button><</button>
         <button>1</button>
         <button>2</button>
         <button>3</button>
         <button>4</button>
         <button>5</button>
         <button>></button>
    </div>

    <br><br>

</body>
</html>