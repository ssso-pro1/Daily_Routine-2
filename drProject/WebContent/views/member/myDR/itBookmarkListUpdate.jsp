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
	.outer{
		width:1000px;
		height:800px;
		margin:auto;
	}
    .outer2{
        width: 630px;
        height: 800px;
        margin: auto;
		margin-left: 50px;
    }
    .listArea{
        border: 1px solid black;
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
        width: 130px;
        text-align: right;
        float: right;
    }
	.btn1{
		margin-left: 10px;
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
                    <div><a href="<%= contextPath %>/bookmark.md?currentPage=1" >내 글 보관함</a></div>
                    <br>
                    <div><a href="<%= contextPath %>/htBookmark.md?currentPage=1" style="color:rgb(250, 214, 9);">북마크 보관함</a></div>
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
						<div class="outer2">
							<button id="btn1" onclick="location.href='<%= contextPath %>/htBookmark.md?currentPage=1'">북마크 보관함</button>
							<button id="btn3" onclick="location.href='<%= contextPath %>/updateItBookmark.md?currentPage=1'">Info&Tip 북마크 보관함</button>
							<div class="listArea">							
								<% if(list.isEmpty()){ %>
									<h1>조회된 리스트가 없습니다</h1>
									<br><br><br><br><br><br><br><br><br><br><br><br>
								<% } else{ %>
									<% for(Info i : list){ %>
										<div class="thumbnail" align="center">
											<input type="hidden" value="<%= i.getIntPostNo() %>">
											<input type="hiddn" value="<%= i.getCategoryName()  %>">
											<img src="<%= i.getTitleImg() %>" width="230" height="150">
											<p align="left"><%= i.getPostTitle() %></p>
											<p algin="left"><%= i.getCategoryName() %> | ♡ 좋아요 <%= i.getLikeCount() %></p>
										</div>
									<% } %>
								<% } %>
							</div>
							<br><br>
							<!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
							<!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
								<div align="center" class="pagingArea">
									<% if(currentPage != 1){ %>
									<button type="button" onclick="location.href='<%= contextPath %>/updateItBookmark.md?currentPage=<%= currentPage-1 %>';"><</button>
									<% } %>
																
									<% for(int p=startPage; p<=endPage; p++){ %>
										<% if(currentPage == p) { %>
											<button disabled><%= p %></button>
										<% }else{ %>
											<button onclick="location.href='<%= contextPath %>/updateItBookmark.md?currentPage=<%= p %>';"><%= p %></button>
										<% } %>
									<% } %>
																
									<% if(currentPage != maxPage){ %>
										<button onclick="location.href='<%= contextPath %>/updateItBookmark.md?currentPage=<%= currentPage + 1 %>';">></button>
									<% } %>
								</div>
						   <div class="Btns">
							   <button type="button" id="submitBtn" onclick="loaction.href='<%= contextPath %>/updateItBookmark.md?currentPage=1'">수정</button>
						   </div>
						</div>
					</div>

                </div>
            </div>
        </div>
    </div>
</body>
</html>
