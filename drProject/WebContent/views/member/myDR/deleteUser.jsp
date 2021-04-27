<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <link rel="stylesheet" href="../../../resources/css/drView.css"> -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/drView.css">
<style>
    .outer{
        width:1000px;
        height:800px;
        margin: auto;
		margin-left: -50px;
    }
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
	#btn1{
        border: 1px solid #4375DB;
        background-color: #4375DB;
        color: white;
		font-size: 16px;
		margin-left: -2px;
	}
	#submitBtn{
		background-color: orangered;
		border: 1px solid orangered;
		border-radius:4px;
	}
	#btn1{
		margin-left: -1px;
	}

</style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>

	<div class="wrap">
        <div id="content">
            <div id="content_1">
                <h1>마이페이지</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/myPage.md" style="color:rgb(250, 214, 9);">회원수정</a></div>
                    <br>
                    <div><a href="">내 글 보관함</a></div>
                    <br>
                    <div><a href="" >북마크 보관함</a></div>
                    <br>
                    <div><a href="">다이어리</a></div>
                </div>
            </div>

            <div id="line"></div>

            <div id="content_2">
                <br><br><br>
                <div id="content_2_2">
					<div class="outer">
						<form action="<%= contextPath %>/deleteUser.md" get="post">
							<div class="form">
								&nbsp<button id="btn1" disabled>회원 탈퇴</button>
								<fieldset>
									<p>
										<br>
										<h2><b>그동안 데일리루틴을 이용해 주셔서 감사합니다</b></h2> <br>
													회원 탈퇴 하실 경우 회원님의 모든 정보가 삭제됩니다.<br>
													현재 회원님꼐서 사용 중인 서비스를 확인하신 후 신중히 탈퇴해주시기 바랍니다.<br><br><br>
													<hr><br>
													회원 탈퇴를 위해 비밀번호를 입력해주세요<br><br>
										<hr>
									</p>
									
										<table id="passwordInput">
											<tr>
												<th>아이디</th>
												<td><%= loginUser.getUserId() %></td>
												<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
											</tr>
											<tr>
												<th>비밀번호</th>
												<td><input type="password" name="userPwd" size="25" maxlength="15" placeholder="현재 비밀번호를 입력해주세요." required></td>
											</tr>
										</table>
										<br>
										<hr>
										<br>
									
										<div class="buttons" align="center">
											<button type="submit" id="submitBtn">탈퇴 신청</button> &nbsp;
											<button id="resetBtn" onclick="location='<%= contextPath %>/update.md'">취소</button>
										</div>
									<br>
								</fieldset>
							</div>
						</form>
					</div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>