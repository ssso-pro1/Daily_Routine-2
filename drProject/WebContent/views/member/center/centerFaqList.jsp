<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList, com.dr.member.center.model.vo.CenterFaq, com.dr.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<CenterFaq> list =(ArrayList<CenterFaq>)request.getAttribute("list"); 
	
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
        margin-top:15px;
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
    #content_2{width: 80%; margin-left: 25px;}
    #line{width: 1%;}

    #line {
        border: 1px solid gray;
        width: 0.1px;
        height: 200px;
    }

   




    #content_2_1{height: 8%;}
    #content_2_2{height: 10%;}
    #content_2_3{height: 10%;}
    #content_2_4{height: 5%;}
    #content_2_5{height: 50%;}
    
    
    


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

    #upperIcon.faq{
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
        width: 430px;
    }
    
    .faqList{
        background :rgb(252, 252, 238);
        width: 100%;
        height: 40px;
        line-height: 30px;
        border: 1px solid;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
    }

    .faqContent{
        width: 100%;
        height: 100px;
        border:1px solid lightgray;
        margin-top: 5px;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 5px;
        display: none;
    }

    a#leftMenu{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a#leftMenu:hover{color:rgb(250, 214, 9);}
    
   #content_2_4>table a:hover{color: green;}
    
    a{text-decoration: none; color: black;}
    
   .ff{font-family: 'Do Hyeon', sans-serif;} 

  
    
    /* footer */
    .footerOuter{
        width:1100px;
        margin:auto;
        align-items: center;
        bottom:100;
        margin-left:500px;
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

<%@include file="../../common/menubar.jsp" %>

<body>
<div class="wrap">
    <div id="content">
    
    <!--왼쪽 공통메뉴-->
        <div id="content_1"  class="ff" >
            <a href="<%=contextPath%>/main.ct" id="leftMenu"><h1 class="ff">고객센터</h1></a>
            <div class="leftMenu">
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top" id="leftMenu"style="color:rgb(250, 214, 9);">FAQ</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct" id="leftMenu">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct?currentPage=1" id="leftMenu">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct?currentPage=1" id="leftMenu">공지사항</a></div>
            </div>
        </div>

        <div id="line"></div>
        
        <!--버튼-->
        <div id="content_2" class="ff">
           <div id="content_2_1">
                <h2>고객센터 > FAQ </h2>
                <hr>
            </div>

            <div id="content_2_2" style="margin-left: 20px; width: 900px;">
                <div class="iconArea">
                    <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">
                        <div id="upperIcon" class="faq" align="center">FAQ</div>
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
                

             <!--검색-->
            <div id="content_2_3">    
                <div class="searchArea" align="center">
                    <form action="<%=contextPath %>/searchFaq.ct?currentPage=1" method="post">
                        <input type="text" name="searchFaq" id="serchFaq" placeholder="궁금한내용을 입력해주세요" style="margin-top: 13px; width: 300px;">
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>


            <!--faq -->
            <div id="content_2_4" align="center">
                
                <table style="font-size: 18px;" class="ff">
                    <tr>
                        <th></th>
                        <th><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">자주찾는 질문 TOP10 </a>|</th>
                        <th><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=userInfo">회원정보 </a>|</th>
                        <th><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=content">게시글/댓글 </a> |</th>
                        <th><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=report">신고 </a>|</th>
                        <th><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=etc">기타</a></th>
                    </tr>
                </table>
                <div class="underLine"></div>
            </div><br>
            
            


            <!--faq 리스트 -->
            <div id="content_2_5" class="ff">
                <div class="faqListArea" style="width: 95%; margin: auto;">
                    
                    <% if(list.isEmpty()) { %>    
                    <p align="center" style="color: red; font-size: 20px;">존재하는 게시글이 없습니다 </p>
                    
                    <% } else { %>
                     <% for(CenterFaq f:list){ %>	
                    
                    <div class="faqList">
                        <table>
                            <tr>
                                <th style="width: 130px; font-size: 18px;">
                                    <label >[
                                        <% if(f.getFaqCategory().equals("top")) { %>
                                                        TOP10
                                        <% } else if (f.getFaqCategory().equals("userInfo")) { %>
                                                       	 회원정보
                                        <% } else if (f.getFaqCategory().equals("content")) { %>
                                                       	 게시글/댓글
                                        <% } else if (f.getFaqCategory().equals("report")) { %>
                                                        	신고
                               	        <% } else if (f.getFaqCategory().equals("etc")) { %>
                                                        	기타
                                        <% } %>
                                        
                                        ]</label>

                                </th>
                                <td style="width: 500px; font-size: 15px;"><label id="faqTitle"  align="center"><%= f.getFaqTitle() %></label></td>
                            </tr>
                        </table>
                    </div>
                     <div class="faqContent">
                        <p><%= f.getFaqContent() %></p>
                    </div>
    				 <% } %>
                    <% } %>
    
                    <!--  
                    <div class="faqList">
                        <label id="faqTitle">문의1</label>
                    </div>
                    <div class="faqContent">
                        <p>내용</p>
                    </div>
                    -->
    
                    <script>
                        $(function(){
                            $(".faqList").click(function(){

                                // slideDown 또는 slideUp 시킬 요소
                                var $faqContent = $(this).next(); // jQuery방식으로 선택한 요소를 담아둘 때 변수명 앞에 $
                
                                if($faqContent.css("display") == "none"){
                                     $(this).siblings(".faqContent").slideUp();
                                     $faqContent.slideDown();// 보여지게

                                     
                
                                }else{
                                    $faqContent.slideUp(); // 사라지게
                                    
                                }
                                   
                            })
                        })
                    </script>
    
                </div>
            </div>     
    
                <!--맨 아래 페이징 (고정하지말고 유연하게로 바꾸기)-->
                
                <div id="content_2_6">    
                    <div align="center" class="pagingArea">

						<%if (list.isEmpty()) { %>
					<p></p>
					<% } else { %>
						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/faqList.ct?currentPage=<%=currentPage-1%>&ctg=<%= list.get(0).getFaqCategory() %>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled style="background:rgb(250, 214, 9); color:white; border:rgb(250, 214, 9)";><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/faqList.ct?currentPage=<%= p %>&ctg=<%= list.get(0).getFaqCategory() %>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/faqList.ct?currentPage=<%=currentPage+1%>&ctg=<%= list.get(0).getFaqCategory() %>';">다음</button>
						<% } %>
					 <% } %>	
			         <br><br>
                    <button><a href="<%= contextPath%>/enrollQuery.ct">찾는내용이 없다면! 1:1문의하기</a></button>
			        </div>
                        
                   
                    </div>
                    
                </div>   

                </div>
            </div>    
             

        </div>
    </div>
</div>
<br><br><br><br>
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