<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.comm.model.vo.Comm, com.dr.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Comm> list = (ArrayList<Comm>)request.getAttribute("list");
	int postListCount = ((Integer)request.getAttribute("postListCount")).intValue();
	
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
        height: 465px;
        margin: auto;
		margin-left: 50px;
    }
    .listArea{
        border: 1px solid black;
        width: 100%;
        height: 100%;
    }
    .pagingArea{
		width: 650px;
        display: inline-block;
		margin:auto;
		margin-left: 50px;
    }

	#btn1{
		margin-left: 50px;
	}
	#btn2{
		margin-left: 50px;
	}
</style>
<link rel="stylesheet" href="../../../resources/css/drView.css">
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
	<div class="wrap">
        <div id="content">
            <div id="content_1">
                <h1>마이페이지</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/myPage.md" >회원수정</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/myPostList.md?currentPage=1" style="color:rgb(250, 214, 9);">내 글 보관함</a></div>
                    <br>
                    <div><a href="" >북마크 보관함</a></div>
                    <br>
                    <div><a href="">다이어리</a></div>
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
								<p><h2><%= postListCount  %></h2></p>
								<div>
									<h3>23</h3>
								</div>
							</div>
							<div id="line2"></div>
							<div class="replyCount">
								<p><h2>내가 쓴 댓글</h2></p>
								<div>
									<h3>23</h3>
								</div>
							</div>

						</fieldset>
						<br><br><br>
						<button id="btn2" onclick="location.href='<%=contextPath%>/myPostList.md?currentPage=1'">내가 쓴 글</button>
						<button id="btn3" onclick="location.href='<%=contextPath%>/replyList.md?currentPage=1'">내가 쓴 댓글</button>
						<fieldset class="outer3">
							<div class="postListArea">
								<% if(list.isEmpty()){ %>
									<h1>조회된 리스트가 없습니다</h1>
									<br><br><br><br><br><br><br><br><br><br><br><br>
								<% } else{ %>
									<% for(Comm c : list){ %>
										<div class="postList" align="center">
											<input type="hidden" value="<%= c.getCommPostNo() %>">
											<input type="hidden" value="<%= c.getCommNo() %>">
											<p>
												<%= c.getPostTitle() %><br>
												조회수 : <%= c.getBoardView() %> 좋아요 : <%= c.getLikeCount() %> <br>
												<%= c.getUpdateDate() %>
											</p>
										</div>
									<% } %>
								<% } %>
								<!-- 디테일 뷰 가는 스크립트 -->
								<script>
									$(function() {
									     $(".thumbnail").click(function() {
									     	var category = $(this).children().eq(1).val()
									    	 
									     	if(category == 1){
									    		 location.href='<%=contextPath%>/freeDetail.co?cno=' + $(this).children().eq(0).val();
									    	 }else if(category == 2){
									    		 location.href='<%=contextPath%>/tipDetail.co?cno=' + $(this).children().eq(0).val();
									    	 }else{
									    		 location.href='<%=contextPath%>/qDetail.co?cno=' + $(this).children().eq(0).val();
									    	 }
									    	 
									      })
									 })
								</script>
								
								<br><br>
								<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
								<!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
								<div align="center" class="pagingArea">
									<% if(currentPage != 1){ %>
										<button onclick="location.href='<%= contextPath %>/myPostList.md?currentPage=<%= currentPage-1 %>';"><</button>
									<% } %>
															
									<% for(int p=startPage; p<=endPage; p++){ %>
										<% if(currentPage == p) { %>
											<button disabled><%= p %></button>
										<% }else{ %>
											<button onclick="location.href='<%= contextPath %>/myPostList.md?currentPage=<%= p %>';"><%= p %></button>
										<% } %>
									<% } %>
																
									<% if(currentPage != maxPage){ %>
										<button onclick="location.href='<%= contextPath %>/myPostList.md?currentPage=<%= currentPage + 1 %>';">></button>
									<% } %>
								</div>
							</div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>
