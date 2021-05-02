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
	.wrap{
			font-family: 'Do Hyeon', sans-serif;
	}
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
		margin-left:-105px;
	}
    fieldset{
    	width: 800px;
    	margin-left:-100px;
    }
    .footerOuter{
        width:1100px;
        margin:auto;
        align-items: center;
        bottom:100;
        margin-left:-60px;
        position:absolute;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1100px;
        font-family: 'Do Hyeon', sans-serif;
    }


    .footer1_1{
        height:30px;
        right:500px;
        width:1150px;
        background-color:rgb(250, 214, 9);

    }
    .footer1_2{
    	margin-right:250px;
    }

    .footer2{
        height:80%;
        padding-left:25px;
        font-size:11px;
    }

    .footer1_1>a{
        text-decoration: none;
        color:black;
        font-weight:bold;
        
        padding:30px;
        text-align:center;
    }
    .footer1_2{
        margin-top:-30px;
        padding: 0px 30px;
    }
    .footer1_2>i{
        padding: 10px 5px;
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
                    <div><a href="<%=contextPath%>/myPostList.md?currentPage=1">내 글 보관함</a></div>
                    <br>
                    <div><a href="<%= contextPath %>/htBookmark.md?currentPage=1" >북마크 보관함</a></div>
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
        <!-- footer -->
	    <div class="footerOuter">
	    
	
	            <div class="footer1">
	                <div class="footer1_1">
	                    <a href="">이용약관</a> | 
	                    <a href="">개인정보보호정책</a>
	                </div>
	
	                <div class="footer1_2" align="right">
	                    <i class="fab fa-instagram-square" fa="lg" ></i>
	                    <i class="fab fa-youtube"></i>
	                    <i class="fab fa-facebook"></i> 
	                    <i class="fas fa-arrow-up" fa="lg"></i>
	                </div>
	            </div>
	          
	            
	            <div class="footer2">
	                <p>02) 0909 - 0909 (평일 10:00 ~ 18:00) <br><br>
	                    Daily Routine : DR <br>
	                    주소 : 서울시 강남구 코딩로 31길, 서울 코딩별관 4층 <br>
	                    고객센터 및 제휴문의 : daily@routine.co.kr           
	                    <br>
	                    CopyRight 2000-2021 Daily Routine All Right Reserved
	                </p>
	            </div>
	    </div>
    </div>

</body>
</html>