<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%@ page import="java.util.ArrayList, com.dr.member.comm.model.vo.Comm, com.dr.member.info.model.vo.Info, com.dr.member.ht.model.vo.Ht"%>
<%
	ArrayList<Comm> list1 = (ArrayList<Comm>)request.getAttribute("list1"); 
    ArrayList<Info> list2 = (ArrayList<Info>)request.getAttribute("list2"); 
    ArrayList<Ht> list3 = (ArrayList<Ht>)request.getAttribute("list3"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
        .f{
            font-family: 'Do Hyeon', sans-serif;
        }
    /* menubar */
    #header>p{
        background:rgb(250, 214, 9);
        font-size: 15px;
    }

    #outer {
        height:1600px;
    }
    .outerWrap a{
        text-decoration:none;
        color: black;
        font-size:12px;
        line-height:50px;
        font-weight:bold;
    }
    .menu{
        display: table-cell;
        height: 50px;
        width: 300px;
    }
    .menu a{
        text-decoration:none;
        color:black;
        font-size:20px;
        line-height:50px;
        font-weight:bold;
        display:block;
         width:100%;
        height:100%;
    }
    .outerWrap a:hover{
        color:darkorchid
	}
    
    /* #content1{
        margin:auto;
        display:flex;
        justify-content: center;
        width:100%;
        height:20%;
    } */
    
    .line{
        border: 1px solid gray;
        height:250px;
        margin: 0 40px;
    }
    
    .content2{
        display:flex;
        justify-content: center;
    }

    .content3 *{
        text-decoration:none;
        color:black;
        font-weight:bold;
        margin:20px;
        padding: 0px 20px;
    }

    #todayV{
        margin:auto;
        display:flex;
        align-content: center;
        margin:30px 50px;
    }

/* footerbar */
         /* footer */
         .footerOuter{
        width:1000px;
        margin:auto;
        align-items: center;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1000px;
    }

    .footer1_1{
        height:30px;
        background-color:rgb(250, 214, 9);
        padding-top:10px;

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
    .item-bg{
        width:100%;
        height:240px;
        background:skyblue url("../../resources/images/main/Jogging.jpg") no-repeat center/cover;
    }
    #content1>img{
        margin:auto;
        display:table-cell;
    }
    .content2{
        margin:auto;
        padding:100px;
    }
    .lists{
        /* display:cell; */
        /* margin:auto; */
    }
    .content1>img{
        display:flex;
        margin:auto;

    }

    .cap{
        text-decoration: none;

    }
    .cap:hover{
        color:skyblue;
    }

    table, table>tr{
        border:2px solid rgb(250, 214, 9);
        border-collapse:collapse;
        /* border-top:none; */
        /* border-right:none; */
    }
    table>thead{
        background-color:  rgb(255, 246, 163);
    }
    .content3{

    }
</style>
</head>
<body>
<div class="f">
    <%@ include file = "menubar.jsp"%>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <div id="content1" style="margin-top:20px; margin-bottom:50px;">
        <img src="<%=contextPath%>/resources/images/main/Jogging.jpg" alt="" width="1000px" height="150px" > 

        <!-- <div class="item"> -->
            <!-- <div class="item-bg"></div> -->
        <!-- </div> -->
        </a>
    </div>
    
    <div class="lists">

    <div class="content2">
        <div class="listArea">
            <table border="1" style="text-align:center;" >

                <caption ><b><a href="<%=contextPath%>/free.co?currentPage=1" class="cap" style="color:grey;">Community[자유게시판]최신인기글</a></b></caption>

                <thead>
	                <tr>
                        <th>글번호</th>  
	                    <th width="200px" value="title">제목</th>
                        <th width="60px" value="userId">작성자</th>
	                    <th width="60px" value="enrollDate">등록 날짜</th>
	                    <th width="30px" value="view">조회수</th>
	                </tr>
                </thead>
                <tbody>
                
                	<% for(Comm c : list1){ %>
	                <tr>
                        <td><%= c.getCommPostNo()%></td>
		                <td><%= c.getPostTitle() %></td>
		                <td><%= c.getUserNo() %></td>
						<td><%= c.getEnrollDate() %></td>
						<td><%= c.getBoardView() %></td>
	                </tr>
	                <% } %>
               </tbody>
            </table>

    	</div>
    	
    	

    <div class="line"></div>

       <div class="content2_2">
           <table border="1" style="text-align:center;">
               <caption><b><a href="<%=contextPath%>/menu.in?currentPage=1" class="cap" style="color:grey;">Info&Tip [식단] 최신글</a></></b></caption>
               
               <thead>
                  <tr>
                      <!-- <th width="10px" height="20px">글번호</th>  -->
                      <th>글번호</th>
                      <th width="250px">제목</th>
                      <th width="60px">작성자</th>
                      <th width="60px">등록 날짜</th>
                      <th width="30px">조회수</th>
                  </tr>
               </thead>
               <tbody>
                  <% if(list2.isEmpty()){ %>
                     <tr>
                        <td colspan="5"> 존재하는 게시글이 없습니다. </td>
                     </tr>
                     
                 <% } else { %>
                 
                    <% for(Info i : list2) { %>
                  <tr>
                     <td><%= i.getIntPostNo() %></td>
                     <td width="200px"><%= i.getPostTitle() %></td>
                     <td width="60px"><%= i.getUserNo() %></td>
                     <td width="40px"><%= i.getEnrollDate() %></td>
                     <td width="20px"><%= i.getBoardView() %></td>
                  </tr>                      
                       <% } %>
                 <% } %>
              </tbody>
           </table>

           <script>
                $(function() {
                 $(".listArea>tbody>tr").click(function() {
                     location.href= '<%=contextPath%>/menu.in?ino=' + $(this).children().eq(0).val();
                 })
             })

         </script>
       </div>



    <!-- <hr style="margin-top:20px; margin-bottom:30px;"> -->
		<div class="content3" >

        <div class="content3_1">

            <div class="outer">
                    <div class="listArea">                     
                        <% if(list3.isEmpty()){ %>
                            <h1>조회된 리스트가 없습니다</h1>
                            <br><br><br><br><br>
                        <% } else{ %>
                        
                            <% for(Ht h : list3){ %>
                                <div class="thumbnail" align="center">
                                    <input type="hidden" value="<%= h.getHtPostNo() %>">
                                    <img src="<%= h.getTitleImg() %>" width="200" height="150">
                                    <p>
                                        <%= h.getHtPostTitle() %>
                                        <i class="far fa-eye"></i><%= h.getHtViewCount() %> | <i class="far fa-kiss-wink-heart"></i> <%= h.getHtLikeCount() %>

                                    </p>
                                   
                                </div>
                            <% } %>
                        <% } %>

                        <script>
                            $(function() {
                                 $(".thumbnail").click(function() {
                                        location.href= '<%=contextPath%>/detail.ht?hno=' + $(this).children().eq(0).val();
                                     })
                                })
                        </script>

                    </div>

                </div>
          </div>
    </div>
 
 
 
 
    	
	</div>	
    	
    	
	</div>
	
	















    

    <!-- footer -->
     
     <div class="footerOuter">
    
        <div class="footer1" id="both">
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
            <!-- <div class="footer1_2" align="right">
                <i class="fab fa-instagram-square" fa="lg" ></i>
                <i class="fab fa-youtube"></i>
                <i class="fab fa-facebook"></i> 
                <i class="fas fa-arrow-up" fa="lg"></i>
            </div> -->
        

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
</div>
 
</body>
</html>