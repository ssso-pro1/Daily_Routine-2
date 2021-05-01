<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.comm.model.vo.Reply, com.dr.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
	int replyListCount = ((Integer)session.getAttribute("replyListCount")).intValue();
	int postListCount = ((Integer)session.getAttribute("postListCount")).intValue();
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap{
		border:1px solid blue;
		font-family: 'Do Hyeon', sans-serif;
	}
	.outer{
		width:1000px;
		height:800px;
		margin:auto;
	}
    .outer2{
        width: 620px;
        height: 100px;
        margin: auto;
		margin-left: 50px;
    }
	.outer3{
        width: 620px;
        height: 480px;
        margin: auto;
		margin-left: 50px;
    }
    .listArea{
        border: 1px solid black;
        width: 100%;
        height: 100%;
    }
    .pagingArea{
    	border:1px solid blue;
		width: 650px;
        display: inline-block;
		margin:auto;
		margin-left: -15px;

    }

	#btn1{
		margin-left: 50px;
	}
	#btn3{
		margin-left: 50px;
	}
	.footer1_1{
		border:1px solid blue;
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
    .footerOuter{
    	border:1px solid blue;
    }
</style>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/drView.css"> -->
<link rel="stylesheet" href="../../../resources/css/drView.css">
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
	<div class="wrap">
        <div id="content">
            <div id="content_1">
                <h1>마이페이지</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/myPage.md">회원수정</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/myPostList.md?currentPage=1" style="color:rgb(250, 214, 9);">내 글 보관함</a></div>
                    <br>
                    <div><a href="<%= contextPath %>/htBookmark.md?currentPage=1" >북마크 보관함</a></div>
                    <br>
                    <div><a href="<%= contextPath %>/diary.md">다이어리</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">
                <br><br><br>
                <div id="content_2_2">
					<div class="outer">
						<button id="btn1" disabled>내 글 보관함</button>
						<fieldset class="outer2">
							<div class="postCount">
								<p><h2>내가 쓴 글</h2></p>
								<div>
									<h3><%= postListCount %></h3>
								</div>
							</div>
							<div id="line2"></div>
							<div class="replyCount">
								<p><h2>내가 쓴 댓글</h2></p>
								<div>
									<h3><%= replyListCount %></h3>
								</div>
							</div>

						</fieldset>
						<br><br><br>
						<button id="btn3"  onclick="location.href='<%=contextPath%>/myPostList.md?currentPage=1'">내가 쓴 글</button>
						<button id="btn2" onclick="location.href='<%=contextPath%>/replyList.md?currentPage=1'">내가 쓴 댓글</button>
						<fieldset class="outer3">
							<div class="postListArea">
								<% if(list.isEmpty()){ %>
									<h1>조회된 리스트가 없습니다</h1>
									<br><br><br><br><br><br><br><br><br><br><br><br>
								<% } else{ %>
									<% for(Reply r : list){ %>
										<div class="postList" align="center">
											<input type="hidden" value="<%= r.getReplyNo() %>">
											<input type="hidden" value="<%= r.getCommPostNo() %>">
											<input type="hidden" value="<%= r.getReplyCategory() %>">
											<p align="left">
												<b><%= r.getReplyContent() %></b><br>
												<%= r.getUpdateDate() %><br>
												<%= r.getPostTitle() %>		
												<hr>
											</p>
										</div>
									<% } %>
								<% } %>
								<!-- 디테일 뷰 가는 스크립트 -->
								<script>
									$(function() {
									     $(".postList").click(function() {
									     	var category = $(this).children().eq(2).val()
									     	console.log(category);
									    	 
									     	if(category == 1){
									    		 location.href='<%=contextPath%>/tipDetail.co?cno=' + $(this).children().eq(0).val();
									    	 }else if(category == 2){
									    		 location.href='<%=contextPath%>/freeDetail.co?cno=' + $(this).children().eq(0).val();
									    	 }else{
									    		 location.href='<%=contextPath%>/qDetail.co?cno=' + $(this).children().eq(0).val();
									    	 }
									    	 
									      })
									 })
								</script>
							</div>
								<br><br>
								<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
								<!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
								<div align="center" class="pagingArea">
									<% if(currentPage != 1){ %>
										<button onclick="location.href='<%= contextPath %>/replyList.md?currentPage=<%= currentPage-1 %>';"><</button>
									<% } %>
															
									<% for(int p=startPage; p<=endPage; p++){ %>
										<% if(currentPage == p) { %>
											<button disabled><%= p %></button>
										<% }else{ %>
											<button onclick="location.href='<%= contextPath %>/replyList.md?currentPage=<%= p %>';"><%= p %></button>
										<% } %>
									<% } %>
																
									<% if(currentPage != maxPage){ %>
										<button onclick="location.href='<%= contextPath %>/replyList.md?currentPage=<%= currentPage + 1 %>';">></button>
									<% } %>
								</div>
							
								
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
