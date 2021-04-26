<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.dr.member.center.model.vo.CenterNotice, com.dr.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<CenterNotice> list =(ArrayList<CenterNotice>)request.getAttribute("list");
	
	
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    div{
        
        box-sizing:border-box
    }
    .wrap{
        width: 1000px;
        height: 800px;
        margin: auto;
    }
    .wrap>div{
        width: 100%;
    }
    
    #content{height: 100%; width: 100%;}
    
    #content>div{
        height: 100%;
        float: left;
    }

    #content_1{width: 15%;}
    #content_2{width: 80%; margin-left: 15px;}
    #line{width: 1%;}

    #line {
        border: 1px solid gray;
        width: 0.1px;
        height: 150px;
    }

    

    #content_2_1{height: 8%;}
    #content_2_2{height: 12%;}
    #content_2_3{height: 80%; margin-left:50px;}
    


   #upperIcon{
        
        width:180px;
        height: 40px;
        display:inline-block;
        margin:10px;
        cursor: pointer;
        font-size: 20px;
        font-weight: 500;
        border: rgb(250, 249, 247);
        border-width: 5px;
        border-style: inset;
        border-top-right-radius: 20px;
        border-bottom-right-radius: 20px;
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
        background-color: rgb(48, 42, 100);
        color: white;
    }

    #upperIcon.notice{
        background-color: rgb(250, 234, 16);
        color: black;
        
    }

    .searchArea{
        margin: auto;
        background: rgb(221, 221, 221);
        height: 50px;
        width: 600px;
    }
    
   
    .underLine {
        border: 1px solid gray;
        width: 0.1px;
        width: 150px;
    }

    

    
    }
    #title{
        margin-left:25px;
    }
    .listArea{
        border:1px solid gray;
        text-align:center;
        width: 95%;
        margin: auto;
    }
    .listArea>tbody>tr:hover{
        background:rgb(241, 243, 235);
        cursor:pointer;
    }
    .listArea>thead>tr{
        background: rgb(221, 221, 221);
    }
    .listArea>tr,th,td{
        height:30px;
    }
    .searchArea>button{
        background:hsl(46, 77%, 50%);
        color:white;
        border:hsl(46, 77%, 50%);
    }
    
    a#leftMenu{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a#leftMenu:hover{color:rgb(250, 214, 9);}
    
    .ff{font-family: 'Do Hyeon', sans-serif;}
    
    a{text-decoration: none; color: black;}

</style>
</head>

<%@include file="../../common/menubar.jsp" %>

<body>
<div class="wrap">
    <div id="content">
        
        <!--왼쪽 공통메뉴-->
        <div id="content_1">
            <a href="<%=contextPath%>/main.ct" id="leftMenu"><h1 class="ff">고객센터</h1></a>
            <div class="leftMenu">
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top" id="leftMenu" class="ff">FAQ</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct" id="leftMenu" class="ff">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct?currentPage=1" id="leftMenu" class="ff">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct?currentPage=1" id="leftMenu" class="ff">공지사항</a></div>
            
            </div>
        </div>

        <div id="line"></div>
        
        
        <!--버튼-->
        <div id="content_2" class="ff">
           <div id="content_2_1">
                <h3 style="font-weight: 100; font-size: 20px;">고객센터 > 공지사항 </h3>
                <hr>
            </div>

            <div id="content_2_2" style="margin-left: 20px; width: 900px;">
                <div class="iconArea">
                    <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">
                        <div id="upperIcon" class="faqf" align="center">FAQ</div>
                    </a>
                    <a href="<%=contextPath%>/enrollQuery.ct">
                        <div id="upperIcon" class="query" align="center">1:1문의</div>
                    </a>
                    <a href="<%=contextPath%>/queryList.ct?currentPage=1">
                        <div id="upperIcon" class="queryList" align="center">나의 문의내역</div>
                    </a>
                    <a href="<%=contextPath%>/notice.ct?currentPage=1">
                        <div id="upperIcon" class="notice" align="center">공지사항</div>
                    </a>
                </div>
            </div>
                

            <!--공지사항-->
            
            <!--공지사항게시판-->
            <div id="content_2_3">

                <div class="noticeArea">
                    <table align="center" class="listArea">
                         <thead>
                             <tr style="font-size: 17px;">
                                 <th width="100" style="color:black">글번호</th>
                                 <th width="400" style="color:black">제목</th>
                                 <th width="150">게시일</th>
                                 <th width="100">조회수</th>
                             </tr>
                         </thead>
                         <tbody>
                         
                         	<% if(list.isEmpty()) { %>
                         	<tr>
            					<td colspan="4">존재하는 공지사항이 없습니다.</td>
            				</tr>
            				<% } else { %>
            					<% for(CenterNotice n:list){ %>	
                         	
                            <tr>
                                <td><%= n.getNoticeNo() %></td>
                                <td><%= n.getNoticeTitle() %></td>
                                <td><%= n.getCreateDate() %></td>
                                <td><%= n.getNoticeCount() %></td>
                            </tr>
                            	<% } %>
                            <% } %>
                         </tbody>
                    </table>
             
             		<script>
             		<% if(list.isEmpty()) { %>
         			//클릭x
             		<% } else { %>
				    	$(function(){
							$(".listArea>tbody>tr").click(function(){
								location.href = '<%=contextPath%>/noticeDetail.ct?nno=' + $(this).children().eq(0).text();			
								
							})
				    	})
				    <% } %>	
				    </script>
             
             
             
             
             
                    <br><br>
             
             
                    <!-- 페이징처리 10개씩 -->
                    <div align="center" class="pagingArea">

						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/notice.ct?currentPage=<%=currentPage-1%>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled style="background:rgb(250, 214, 9); color:white; border:rgb(250, 214, 9)";><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/notice.ct?currentPage=<%= p %>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/notice.ct?currentPage=<%=currentPage+1%>';">다음</button>
						<% } %>
						
			        </div>
             
             
                    <br><br>
                    <div align="center" class="searchArea">
                        <form action="<%= contextPath %>/searchNotice.ct?currentPage=1" method="post">
                            <select name="searchNoticeCtg" style="margin-top: 13px;">
                                <option name="searchNoticeCtg" value="제목">제목</option>
                                <option name="searchNoticeCtg" value="내용">내용</option>
                            </select>  
                            <input type="text" name="searchNoticeText">
                            <button type="submit" >검색</button> 
             
                        </form>
             
                    </div>


			</div>    

            

        </div>
    </div>
</div>

</body>
</html>