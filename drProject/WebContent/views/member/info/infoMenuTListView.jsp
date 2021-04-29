<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.dr.member.info.model.vo.Info, com.dr.common.model.vo.PageInfo" %>
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
     div{
        box-sizing:border-box;
    }
    
    .wrap{
        width:1000px;
        height:900px;
        margin:auto;
        margin-top:15px;
    }
    .wrap>div{
        width:100%;
    }

    a{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a:hover{color:rgb(250, 214, 9);}

    #content{height:100%; width:100%;}

    #content>div{
        height:100%;
        float:left;
    }

    #content_1{width:15%;}
    #content_2{width:80%; margin-left:25px;}
    
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }
    
    .listArea{
        width:700px;
        margin:auto;
    }

    .tipcategory{
        width:200px;
        height:1px;
    }
    
    
    .thumbnail{
        border:1px solid black;
        width:200px;
        display:inline-block;
        margin:10px;
    }
   
    .searchArea{
        float: right;
        margin-right: 95px;
    }
    
    .pagingArea{
        width: 300px;
        display: inline-block;
        margin-left: 250px;
    }
    
    .btn{
        width: 100px;
        text-align: right;
        float: right;
        margin-right:100px;
    }
    
    div>button{
        cursor:pointer;
    }
    
    .leftMenu>#menu2>a{
    	color:rgb(250, 214, 9);
    }
    
    .ff{font-family: 'Do Hyeon', sans-serif;}
    
    
    <!-- 푸터바 --> 
    .f{
        font-family: 'Do Hyeon', sans-serif;
    }
    
    /* footer */
    .footerOuter{
        width:1100px;
        margin:auto;
        margin-left:130px;
        align-items: center;
        bottom:100;
        position:absolute;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1100px;
        
    }

    .footer1_1{
        height:30px;
        right:500px;
        width:1150px;
        background-color:rgb(250, 214, 9);
        padding-top:10px;
    }
    .footer1_2>i{
    	left:250px;
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
    
    <%@ include file="../../common/menubar.jsp"%>


    <div class="wrap ff">
        
        <div id="content">

            <!-- 왼쪽 공통메뉴 -->
            <div id="content_1">
                <a href="<%=contextPath%>/workout.in" id="leftMenu"><h1 class="ff">Info & Tip</h1></a><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/workout.in?currentPage=1">운동 정보</a></div>
                    <br>
                    <div id="menu2"><a href="<%=contextPath%>/menu.in?currentPage=1">식단 정보</a></div>
                </div>
            </div>

            <div id="line"></div>


            <!-- 게시글 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>Info & Tip > 식단 정보 </h2>
                    <hr>
                    <p>Daily Routine에서 제공하는 다양한 식단 정보를 참고해보세요!</p>
                </div><br>


                <!-- 게시글 목록 카테고리 & 검색 버튼 -->
                <div id="content_2_2">
                	  <div class="searchArea">
		                	<form action="<%=contextPath%>/searchMenu.in?currentPage=1" method="post">
			                    <select name="searchMenuCtg">
			                    	<option name="searchMenuCtg" value="제목">제목</option>
			                    	<option name="searchMenuCtg" value="내용">내용</option>
			                    </select>  
			                    <input type="text" name="searchMenuText">
			                   	<button type="submit" class="fas fa-search"></button>
		              		</form>
		                </div><br><br>         		
                </div>


                <!-- 게시글 목록 -->
                <div id="content_2_3">
                    <div class="listArea">
                    	
                    	<% for(Info i : list) { %>
                        <div class="thumbnail" align="center">
                        	
                        	<input type="hidden" value="<%=i.getIntPostNo()%>">
                        	
                            <img src="<%=contextPath%>/<%=i.getTitleImg()%>" width="200" height="150">
                            <p>
                                <%=i.getPostTitle()%> <br>
                                조회수 : <%=i.getBoardView()%> <br>
                                <%=i.getEnrollDate()%>
                            </p>
                        </div>
                        <% } %>
                        
                    </div><br>
                </div>


				<script>
			        $(function() {
	                	$(".thumbnail").click(function() {
	                    	location.href= '<%=contextPath%>/menuDetail.in?ino=' + $(this).children().eq(0).val();
	                    })
	                })
		        </script>
				<br><br>


				<!-- 페이징 처리 -->
		        <!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
		        <div align="center" class="pagingArea">
		                	
		        	<% if(currentPage != 1) { %>
		            	<button onclick="location.href='<%=contextPath%>/menu.in?currentPage=<%=currentPage-1%>';"><</button>
		            <% } %>
		        	
		            <% for(int p=startPage; p<=endPage; p++) { %>
		                    	
		            	<% if(currentPage == p) { %>
		                    <button disabled style="background:rgb(250, 214, 9); color:white; border:rgb(250, 214, 9)";><%= p %></button> 
		                <% }else { %>
		                    <button onclick="location.href='<%=contextPath%>/menu.in?currentPage=<%= p %>';"><%= p %></button>
		                <% } %>
		                    	
		            <% } %>
		                    
		            <% if(currentPage != maxPage) { %>
		                <button onclick="location.href='<%=contextPath%>/menu.in?currentPage=<%=currentPage+1%>';">></button>
		            <% } %>
		                        
		         </div>
				
               	 <br><br>
               

            </div>   
            
            
        </div>      
    </div>
    
     <!-- footer -->
    <div class="footerOuter ff">
    

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
    
</body>
</html>