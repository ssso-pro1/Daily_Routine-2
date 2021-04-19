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

    

    #content_2_1{height: 3%;}
    #content_2_2{height: 10%;}
    #content_2_3{height: 10%;}
    #content_2_4{height: 77%;}
    


    #upperIcon{
        border:1px solid black;
        width:150px;
        display:inline-block;
        margin:10px;
        cursor: pointer;
    }

    .searchArea{
        margin: auto;
        background: lightgray;
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
        background:lightgray;
        cursor:pointer;
    }
    .listArea>thead>tr{
        background:lightgray;
    }
    .listArea>tr,th,td{
        height:30px;
    }
    .searchArea>button{
        background:hsl(46, 77%, 50%);
        color:white;
        border:hsl(46, 77%, 50%);
    }
    

</style>
</head>

<%@include file="../../common/menubar.jsp" %>

<body>
<div class="wrap">
    <div id="content">
        
        <!--왼쪽 공통메뉴-->
        <div id="content_1">
            <h1><a href="<%=contextPath%>/main.ct">고객센터</a></h1>
            <div class="leftMenu">
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">FAQ 자주찾는 질문</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct?currentPage=1">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct?currentPage=1">공지사항</a></div>
            
            </div>
        </div>

        <div id="line"></div>
        
        
        <!--버튼-->
        <div id="content_2">
            <div id="content_2_1">고객센터 HOME > 공지사항</div>

            <div id="content_2_2">
                <div class="iconArea">
                    <div id="upperIcon">
                        <img src="../../resources/images/faq.JPG" width="180">
                    </div>
                    <div id="upperIcon">
                        <img src="../../resources/images/11.JPG" width="180">
                    </div>
                    <div id="upperIcon">
                        <img src="../../resources/images/my.JPG" width="180">
                    </div>
                    <div id="upperIcon">
                        <img src="../../resources/images/notice.JPG" width="180">
                    </div>
                </div>
            </div>
                

            <!--공지사항-->
            <div id="content_2_3">    
                <p><h3>공지사항</h3></p>
                <div class="underLine"></div>
            </div>


            <!--공지사항게시판-->
            <div id="content_2_4">

                <div class="noticeArea">
                    <table align="center" class="listArea">
                         <thead>
                             <tr>
                                 <th width="100" style="color:black">글번호</th>
                                 <th width="400" style="color:black">제목</th>
                                 <th width="150">게시일</th>
                                 <th width="100">조회수</th>
                             </tr>
                         </thead>
                         <tbody>
                         
                         	<% if(list.isEmpty() && (list.isEmpty())) { %>
                         	<tr>
            					<td colspan="4">존재하는 공지사항이 없습니다.</td>
            				</tr>
            				
            				<% } else if (!list.isEmpty() && list.isEmpty())  { %>
            					<% for(CenterNotice n:list){ %>	
                         	
                            <tr>
                                <td><%= n.getNoticeNo() %></td>
                                <td><%= n.getNoticeTitle() %></td>
                                <td><%= n.getCreateDate() %></td>
                                <td><%= n.getNoticeCount() %></td>
                            </tr>
                            	<% } %>
                            <% } else {%>
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
				    	$(function(){
							$(".listArea>tbody>tr").click(function(){
								location.href = '<%=contextPath%>/noticeDetail.ct?nno=' + $(this).children().eq(0).text();			
								
							})
				    	})
				    </script>
             
             
             
             
             
                    <br><br>
             
             
                    <!-- 페이징처리 10개씩 -->
                    <div align="center" class="pagingArea">

						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/searchNotice.ct?currentPage=<%=currentPage-1%>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/searchNotice.ct?currentPage=<%= p %>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/searchNotice.ct?currentPage=<%=currentPage+1%>';">다음</button>
						<% } %>
						
			        </div>
             
             
                    <br><br>
                    <div align="center" class="searchArea">
                        <form action="<%= contextPath %>/searchNotice.ct?currentPage=1" method="post">
                            <select name="searchNoticeCtg">
                                <option name="searchNoticeCtg" value="제목">제목</option>
                                <option name="searchNoticeCtg" value="내용">내용</option>
                            </select>  
                            <input type="text" name="searchNoticeText">
                            <button type="submit">검색</button> 
             
                        </form>
             
                 </div>


			</div>    

            

        </div>
    </div>
</div>

</body>
</html>