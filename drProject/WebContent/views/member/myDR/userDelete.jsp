<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1000px;
        height:800px;
        margin: auto;
    }/
    .form{
    	width:800px;
    	height:100%;
    	margin:auto;
    }
    #passwordInput th{
        width:70px;
        text-align: left;
        padding: 8px;
    }
</style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
    <div class="outer">
            <form action="" name="updateEnrollForm">
	            <div class="form">
	                &nbsp<button>회원 탙퇴</button>
	                <fieldset>
	                    <p>
	                        <br>
	                        <h2><b>그동안 데일리 루틴을 이용해주셔서 감사합니다</b></h2> <br>
				                        회원 탈퇴 하실 경우 회원님의 모든 정보가 삭제됩니다. <br>
				                        현재 회원님께서 사 중인 서비스를 확인하신 후 신중히 탈퇴해주시기 바랍니다. <br><br><br>
				                        <hr><br>
				                        회원 탈퇴를 위해 비밀번호를 입력해 주세요. <br><br>
	                        <hr>
	                    </p>
	                    <table id="passwordInput">
	                        <tr>
	                            <th>아이디</th>
	                            <td>corin2</td>
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
	                        <button type="submit">탈퇴 신청</button> &nbsp;
	                        <button onclick="location='<%= contextPath %>/update.md'">취소</button>
	                    </div>
	                    <br>
	                </fieldset>
	            </div>
            </form>
    </div>


</body>
</html>