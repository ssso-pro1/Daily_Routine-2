<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/drView.css">
<!-- <link rel="stylesheet" href="../../../resources/css/drView.css"> -->
<title>Insert title here</title>
<style>
	.wrap{
	font-family: 'Do Hyeon', sans-serif;
	}
	#content, .footerOuter{margin-top:18px}
    .outer{
        margin-left: -100px;
    }
    #btn1{
        margin-left: -3px;
    }
    #submitBtn{
        font-size: 17px;
    }
    #resetBtn{
        font-size: 17px;
    }
    #content_1{
    	margin-top:40px;
    }
	#btn1{
		margin-left:-105px;
	}
    fieldset{
    	width: 800px;
    	margin-left:-100px;
    }
    #outBtn{
    	margin-right:100px;
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
   

    <div class="wrap">
     <%@ include file="../../common/menubar.jsp" %>
     <%
    	String userId = loginUser.getUserId(); // 필수
    	String userName = loginUser.getUserName(); // 필수
    	String birth = (loginUser.getBirth() == null) ? "" : loginUser.getBirth();
    	String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
    	String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone();
		String gender = (loginUser.getGender() == null) ? "" : (loginUser.getGender() == "F") ? "여성" : "남성";
    %>
        <div id="content">
            <div id="content_1">
                <h2>마이페이지</h2><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/myPage.md" style="color:rgb(250, 214, 9);">회원수정</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/myPostList.md?currentPage=1">내 글 보관함</a></div>
                    <br>
                    <div><a href="<%= contextPath %>/htBookmark.md?currentPage=1" >북마크 보관함</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">
                <br><br><br>
                <div id="content_2_2">
                    <div class="outer">
                        <form action="" name="updateEnrollForm">
                            <div class="form">
                                &nbsp<button id="btn1" disabled>회원 정보 수정</button>
                                <fieldset>
                                    <table id="updateForm">
                                        <br>
                                        <tr>
                                            <th>아이디</th>
                                            <td colspan="2"><%= userId %></td>
                                        </tr>
                                        <tr>
                                            <th>이름</th>
                                            <td colspan="2"><%= userName %></td>
                                        </tr>
                                        <tr>
                                        	<th>비밀번호 변경</th>
                                        	<td><button type="button" data-toggle="modal" data-target="#pwdUpdateModal "id="updateBtn">비밀번호 변경</button></td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td>
                                            <!-- 나눠서 하려면 어떻게해야하지 substring is not function거린다 -->
                                               <%= birth %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>성별</th>
                                            <td><%= gender %></td>
                                        </tr>
                                        <tr>
                                            <!-- 모달 넣을것 -->
                                            <th>이메일</th>
                                            <td colspan="2"><%= email %>  &nbsp;&nbsp;&nbsp; <button  type="button" data-toggle="modal" data-target="#emailUpdateModal" id="updateBtn">수정하기</button></td>
                                        </tr>
                                        <tr>
                                            <th>전화번호</th>
                                            <td colspan="2"><%= phone %> &nbsp;&nbsp;&nbsp; <button  type="button" data-toggle="modal" data-target="#phoneUpdateModal"id="updateBtn">수정하기</button></td>
                                        </tr>
                                    </table>
                                    <br>
                                </fieldset>
                
                                <br>
                                <div class="buttons" align="center">
                                <!--    <button type="submit" id="submitBtn" disabled onclick="return validate();">확인</button>    -->
                                <!--    <button type="reset" id="resetBtn">취소</button> -->
                                    <div class="outBtn">
                                        <button type="button" id="outBtn" onclick="location.href='<%= contextPath %>/deleteUserView.md'">탈퇴하기</button>
                                    </div>
                                    
                                    <!-- 탈퇴 링크하기 -->
                                </div>
                                
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
    
    <!-- 이메일 수정 모달 -->
    <div class="modal" id="emailUpdateModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">이메일 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<form action="<%= contextPath %>/emailUpdate.md" method="post">
	      		<div align="center">
	      			<input type="hidden" name="userId" value="<%= userId %>">
		      		<input type="text" name="updateEmail" style="font-size: 13px;" required> &nbsp;
		      		<select id="emailCategory" name="emailCategory">
	                    <option value="x">선택해주세요</option>
		      			<option value="@naver.com">@naver.com</option>
	                    <option value="@daum.com">@daum.net</option>
	                    <option value="@gmail.com">@gmail.com</option>
		      		</select>		
	      		</div>
	      		<br>
	      		<div align="center">
		      		<button type="submit" id="submitBtn">확인</button>
	                <button type="reset" id="resetBtn">취소</button>
	      		</div>
                
	      	</form>        	
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 전화번호 수정 모달 -->
     <div class="modal" id="phoneUpdateModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">전화번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<form action="<%= contextPath %>/phoneUpdate.md" method="post">
	      		<div align="center">
	      			<input type="hidden" name="userId" value="<%= userId %>">	      		
		      		<input type="text" name="updatePhone" size="30" maxlength="13" style="font-size:15px;" placeholder=" - 포함하여 입력하세요" required>
	      		</div>
	      		<br>
	      		<div align="center">
		      		<button type="submit" id="submitBtn">확인</button>
	                <button type="reset" id="resetBtn">취소</button>
	      		</div>
                
	      	</form>        	
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 비밀번호 변경 버튼 클릭시 뜨는 Modal -->
	<div class="modal" id="pwdUpdateModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" align="center">
	        
	        <form action="<%= request.getContextPath() %>/pwdUpdate.md" method="POST">
	        	<input type="hidden" name="userId" value="<%= userId %>">
	        	<table>
	        		<tr>
	        			<th>현재 비밀번호</th>
	        			<td><input type="password" name="userPwd" required></td>
	        		</tr>
	        		<tr>
	        			<th>변경할 비밀번호</th>
	        			<td><input type="password" name="updatePwd" required></td>
	        		</tr>
	        		<tr>
	        			<th>변경할 비밀번호 재입력</th>
	        			<td><input type="password" name="checkPwd" required></td>
	        		</tr>
	        	</table>
	        	<br>
	        	
	        	<button type="submit" id="submitBtn" onclick="return validatePwd();">비밀번호 변경</button>
	        	<script>
	        		function validatePwd(){
	        	        var regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
	        	        var updatePwd = $("input[name=updatePwd]");
	        	        
	        	        
	        	        if(!regExp.test(updatePwd.value)){
	        	            alert("유효한 비번 입력하세요.");
	        	    
	        	            updatePwd.value = ""; //기존값 초기화시키고, 포커스 가게
	        	            updatePwd.focus();
	        	    
	        	            return false;
	        	        }
	        			
	        			if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
	        				alert("변경할 비밀번호가 일치하지 않습니다.")
	        				return false;
	        			}
	        		}
	        	</script>
	        </form>
	        
	      </div>
	
	    </div>
	  </div>
	</div>

    
    
</body>
</html>