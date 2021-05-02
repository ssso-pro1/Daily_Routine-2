<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dr.member.info.model.vo.Info, com.dr.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Info> list = (ArrayList<Info>)request.getAttribute("list");
	
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
			font-family: 'Do Hyeon', sans-serif;
	}
	.outer{
		width:1000px;
		height:840px;
		margin:auto;
	}
    .outer2{
        width: 630px;
        height: 840px;
        margin: auto;
		margin-left: 50px;
    }
    .listArea{
    	border:1px solid black;
        width: 100%;
        height: 100%;
    }
    .thumbnail{
        display: inline-block;
        margin-top: 30px;
        margin-left: 42px;
        
    }
    .thumbnail p{
        width: 250px;
        text-align: left;
        }
    .check{
        width: 30px;
        float: left;
    }
    .pagingArea{
        width: 300px;
        display: inline-block;
        margin-left: 175px;
    }
    .Btns{
        width: 100px;
        text-align: right;
        float: right;
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/drView.css">
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
                    <div><a href="<%=contextPath%>/myPostList.md?currentPage=1">내 글 보관함</a></div>
                    <br>
                    <div><a href="<%= contextPath %>/htBookmark.md?currentPage=1" style="color:rgb(250, 214, 9);">북마크 보관함</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">
                <br><br><br>
                <div id="content_2_2">
					<div class="outer">
						<div class="outer2">
							<button id="btn3" onclick="location.href='<%= contextPath %>/htBookmark.md?currentPage=1'">홈트레이닝 북마크 보관함</button>
							<button id="btn1" onclick="location.href='<%= contextPath %>/itBookmark.md?currentPage=1'">Info&Tip 북마크 보관함</button>
							<div class="listArea">							
								<% if(list.isEmpty()){ %>
									<h1>조회된 리스트가 없습니다</h1>
									<br><br><br><br><br><br><br><br><br><br><br><br>
								<% } else{ %>
									<% for(Info i : list){ %>
										<div class="thumbnail" align="center">
											<input type="hidden" value="<%= i.getIntPostNo() %>">
											<input type="hidden" value="<%= i.getCategoryName()  %>">
											<img src="<%= i.getTitleImg() %>" width="230" height="150">
											<p align="left"><%= i.getPostTitle() %></p>
											<p algin="left"><%= i.getCategoryName() %> | ♡ 좋아요 <%= i.getLikeCount() %></p>
										</div>
									<% } %>
								<% } %>
								
								<!-- 디테일 뷰 가는 스크립트 -->
								<script>
									$(function() {
							        	 $(".thumbnail").click(function() {
							        		 // category name따라서 디테일 뷰 가는거 다르게 
							        		 var category = $(this).children().eq(2).val();
							        		 
							        		 console.log(category);
							        		 
							        		 if(category = 2){
							        			 location.href= '<%=contextPath%>/menuDetail.in?ino=' + $(this).children().eq(0).val(); 
							        		 }else{
							        			 location.href= '<%=contextPath%>/searchMenu.in?ino=' + $(this).children().eq(0).val(); 
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
									<button type="button" onclick="location.href='<%= contextPath %>/itBookmark.md?currentPage=<%= currentPage-1 %>';"><</button>
									<% } %>
																
									<% for(int p=startPage; p<=endPage; p++){ %>
										<% if(currentPage == p) { %>
											<button disabled><%= p %></button>
										<% }else{ %>
											<button onclick="location.href='<%= contextPath %>/itBookmark.md?currentPage=<%= p %>';"><%= p %></button>
										<% } %>
									<% } %>
																
									<% if(currentPage != maxPage){ %>
										<button onclick="location.href='<%= contextPath %>/itBookmark.md?currentPage=<%= currentPage + 1 %>';">></button>
									<% } %>
								</div>
						   
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
	    </div> </div>
</body>
</html>
