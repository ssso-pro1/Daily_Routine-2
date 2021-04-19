<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file = "../adminPageLeftMenuBar.jsp" %>
    
    <div class="outer">
        <form action="<%=request.getContextPath%>/delete.aus" name="deleteUserForm">
            <div class="form">
                &nbsp<button>회원 탙퇴</button>
                <fieldset>
                    <p>
                        <br>
                        <h2><b>회원 아이디 탈퇴</b></h2> <br>
                                    관리자의 권한으로 다음 회원 아이디를 탈퇴시킵니다.<br>
                                    <br><br><br>
                                    <hr><br>
                                    회원 탈퇴를 시키기 위해 관리자 아이디의 비밀번호를 입력해 주세요. <br><br>
                        <hr>
                    </p>
                    <table id="passwordInput">
                        <tr>
                            <th>아이디</th>
                            <td>admin</td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" size="25" maxlength="15" placeholder="비밀번호를 입력해주세요" required></td>
                        </tr>
                    </table>
                    <br>
                    <hr>
                    <br>
                    <div class="buttons" align="center">
                        <button type="submit">탈퇴</button> &nbsp;
                        <button onclick="location='<%= contextPath %>/mainPage.aus'">취소</button>
                    </div>
                    <br>
                </fieldset>
            </div>
        </form>
</div>


</body>
</html>