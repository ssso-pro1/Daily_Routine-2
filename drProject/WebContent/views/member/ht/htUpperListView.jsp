<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.ht.model.vo.Ht, com.dr.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Ht> list = (ArrayList<Ht>)request.getAttribute("list");
	
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/htView.css">
<style>
	.wrap{
		font-family: 'Do Hyeon', sans-serif;
	}
	.listArea{
		display: inline-block;
	}
	.pagingArea{
		text-align: right;
        width: 500px;
        display: inline-block;
        margin-right: 300px
    }	
    .thumbnail{
    	cursor:pointer;
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
		<div id="content">
			<div id="content_1">
                <h1>Home<br>Training</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/allList.ht?currentPage=1" >전체</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/bodyList.ht?currentPage=1">전신 운동</a></div>
                    <br>
					<div><a href="<%=contextPath%>/absList.ht?currentPage=1">복부 운동</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/upperList.ht?currentPage=1" style="color:rgb(250, 214, 9);">상체 운동</a></div>
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
                    <h2>HomeTraining > 상체 운동</h2>
                    <hr>
                    <p>홈트레이닝 상체 운동 조회입니다.</p>
                </div>
                <br><br>
				<div id="content_2_2">
					
					<div align="center" class="searchArea">
						<form action="<%= contextPath %>/searchList.ht?currentPage=1" method="post">
							<!-- 제목검색? -->
							<input type="text" name="searchTitle">
							<button type="submit">검색</button> 
						</form>
					</div>
					
					<br><br>
					<!-- 여기에 listArea페이징이랑, 조회한거랑 디테일뷰 스크립트가 들어옴 -->
					<% if(list.isEmpty()){ %>
						<h1>조회된 리스트가 없습니다</h1>
						<br><br><br><br><br><br><br><br><br><br><br><br>
					<% } else{ %>
						<% for(Ht h : list){ %>
							<div class="thumbnail" align="center">
								<input type="hidden" value="<%= h.getHtPostNo() %>">
								<img src="<%= h.getTitleImg() %>" width="230" height="150">
								<p>
									<%= h.getHtPostTitle() %><br>
									조회수 : <%= h.getHtViewCount() %> 좋아요 : <%= h.getHtLikeCount() %> <br>
									<%= h.getHtUpdateDate() %>
								</p>
							</div>
						<% } %>
					<% } %>
					<!-- 디테일 뷰 가는 스크립트 -->
						<script>
							$(function() {
				       	     	 $(".thumbnail").click(function() {
				                  	 location.href= '<%=contextPath%>/detail.ht?hno=' + $(this).children().eq(0).val();
				      	     	   })
				   	    	 })
						</script>
				
					<br><br>
					<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
					<!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
					<div align="center" class="pagingArea">
						<% if(currentPage != 1){ %>
							<button onclick="location.href='<%= contextPath %>/strechingList.ht?currentPage=<%= currentPage-1 %>';"><</button>
						<% } %>
											
						<% for(int p=startPage; p<=endPage; p++){ %>
							<% if(currentPage == p) { %>
								<button disabled><%= p %></button>
							<% }else{ %>
								<button onclick="location.href='<%= contextPath %>/strechingList.ht?currentPage=<%= p %>';"><%= p %></button>
							<% } %>
						<% } %>
											
						<% if(currentPage != maxPage){ %>
							<button onclick="location.href='<%= contextPath %>/strechingList.ht?currentPage=<%= currentPage + 1 %>';">></button>
						<% } %>
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