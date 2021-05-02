<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.ht.model.vo.Ht"%>
<%
	Ht h = (Ht)request.getAttribute("h");
	// boolean check = (boolean)session.getAttribute("check");
	// boolean check2 = (boolean)session.getAttribute("check2");
	

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/htView.css">
<link rel="stylesheet" href="../../../resources/css/htView.css">
<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
<style>
	.wrap{
		font-family: 'Do Hyeon', sans-serif;
	}
	.mark{
        width: 500px;
        text-align: right;
        cursor: pointer;
    }
    .detailArea{
        width:100%;
        height:100%;
    }
    #bkLk{
    	margin:auto;
    	margin-left:260px;
    	
    }
    
    .detailArea table{
        width:100%;
        border:1px solid black;
        border-top:1px solid black;
        border-collapse:collapse;
    }   
    
    .detailArea>table>tr,td{
        border-bottom: 1px solid black;
        border:1px solid black;
    }
    
    p{
        text-align:center;
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
                <h1>Home<br>Training</h1><br>
               <div class="leftMenu">
                    <div><a href="<%=contextPath%>/allList.ht?currentPage=1"">전체</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/bodyList.ht?currentPage=1">전신 운동</a></div>
                    <br>
					<div><a href="<%=contextPath%>/absList.ht?currentPage=1">복부 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/upperList.ht?currentPage=1">상체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/lowerList.ht?currentPage=1">하체 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/strechingList.ht?currentPage=1">스트레칭</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀-->
                <div id="content2_1">
                    <h2>HomeTraining > <%= h.getHtCategory() %></h2>
                    <hr>
                </div>
                <br>
				<div id="content_2_2">
					<div class="detailArea">
						<table border="0">
                            <tr style="font-size:25px;">
                                <th width="800"><%= h.getHtPostTitle() %></th>
                            </tr>
                            <tr>
                                <td height="200" style="resize:none"> 
                                    <p style="height:50px;"><%= h.getHtPostContent() %></p>
                                </td>
                            </tr>
                        </table> 
                        <br>
                        <div id="bkLk">
                        <!-- 로그인 안되있는 유저는 안보이도록 할 것 / 스크립트까지 감싸야함 => 500에러 -->
						<% if(loginUser != null){ 
							boolean check = (boolean)request.getAttribute("check");
						    boolean check2 = (boolean)request.getAttribute("check2");
						%>
							<div class="mark">
								<% if(check == true){ %>
								북마크 <i id="bookmark" class="fas fa-bookmark" onclick="bookmark();"></i> &nbsp;&nbsp;
								<% } else{ %>
								북마크 <i id="bookmark" class="far fa-bookmark" onclick="bookmark();"></i> &nbsp;&nbsp;
								<% } %>
								<% if(check2 == true){ %>
								좋아요 <i id="like" class="fas fa-heart" onclick="like();"></i>
								<% }else{ %>
								좋아요 <i id="like" class="far fa-heart" onclick="like();"></i>
								<% } %>
							</div>
						
						
	
						<script>
							function bookmark(){
	
								$.ajax({
									type:"post",
									url: "bookmark.ht",
									data:{
										userNo:<%= loginUser.getUserNo() %>,
										postNo:<%= h.getHtPostNo() %>
									},success:function(check){
										// console.log(check); -> true, false 출력 확인
										console.log(check);
										if(check == "true"){ // check 되어있는거 취소
											$("#bookmark").removeClass("fas");
											$("#bookmark").addClass("far"); 
											//  $("#like").attr("far fa-heart");
											 //document.getElementById('bookmark').className = 'far fa-bookmark';
											 console.log(document.getElementById('bookmark').className);
										}else{ // check 안되어있는거 입력
											$("#bookmark").removeClass("far");
											$("#bookmark").addClass("fas"); 
											 //$("#like").attr("fas fa-heart");
											 // document.getElementById('bookmark').className = 'fas fa-bookmark';
											 console.log(document.getElementById('bookmark').className);
										}
										
									},error:function(){
										console.log("실패");
									}
										
									
								})
							}
							function like(){
	
								$.ajax({
									type:"post",
									url: "like.ht",
									data:{
										userNo:<%= loginUser.getUserNo() %>, // 에러
										postNo:<%= h.getHtPostNo() %>
									},success:function(check){
										// console.log(check); -> true, false 출력 확인
										console.log(check);
										if(check == "true"){ // check 되어있는거 취소
											$("#like").removeClass("fas fa-heart").addClass("far fa-heart"); 
											//  $("#like").attr("far fa-heart");
											// document.getElementById('like').className = 'far fa-heart';
											// console.log(document.getElementById('like').className);
										}else{ // check 안되어있는거 입력
											$("#like").removeClass("far fa-heart").addClass("fas fa-heart"); 
											 //$("#like").attr("fas fa-heart");
											 // document.getElementById('like').className = 'fas fa-heart';
											 // console.log(document.getElementById('like').className);
										}
										
									},error:function(){
										console.log("실패");
									}
										
									
								})
								
							}
							
						</script>
						<% } %>
	                        </div>
                    </div>
					<br>
					
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