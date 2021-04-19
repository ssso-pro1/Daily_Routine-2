<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList, com.dr.member.center.model.vo.CenterFaq, com.dr.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<CenterFaq> searchList =(ArrayList<CenterFaq>)request.getAttribute("searchList"); 
	int listCount = (int)request.getAttribute("listCount");
	String searchFaq = (String)request.getAttribute("searchFaq");
	
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
        height: 200px;
    }

   




    #content_2_1{height: 3%;}
    #content_2_2{height: 10%;}
    #content_2_3{height: 10%;}
    #content_2_4{height: 5%;}
    #content_2_5{height: 67%;}
    #content_2_6{height: 5%;}
    
    


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
        width: 430px;
    }
    
    .faqList{
        background :rgb(241, 236, 229);
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

    a{text-decoration: none; color: black;}
    
    #content_2_4>table a:hover{color:orange;}
    

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
            <div id="content_2_1">고객센터 HOME > FAQ 자주찾는 질문</div>

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
                

            <!--검색-->
            <div id="content_2_3">    
                <div class="searchArea" align="center">
                    <form action="<%=contextPath %>/searchFaq.ct?currentPage=1" method="post">
                        <input type="text" name="searchFaq" id="serchFaq" placeholder="궁금한내용을 입력해주세요">
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>


            <!--faq -->
            <div id="content_2_4">
                
                <table>
                    <tr>
                        <th>
                            <label style="font-size: 20px; color: rgb(96, 206, 23);"><%= searchFaq %> </label>검색결과 총 
                            <label style="font-size: 20px; color: rgb(226, 166, 14);"><%=listCount %></label>개
                        </th>
                        
                    </tr>
                </table>
                <div class="underLine"></div>
            </div>
            
            


            <!--faq 리스트 -->
            <div id="content_2_5">
                <div class="faqListArea" style="width: 95%; margin: auto;">
                    
                    <% if(searchList.isEmpty()) { %>    
                    <p>존재하는 게시글이 없습니다 </p>
                    
                    <% } else { %>
                    <% for(CenterFaq f:searchList){ %>	
                    
                    <div class="faqList">
                        <label>[<%= f.getFaqCategory() %>]</label>
                        <label id="faqTitle"><%= f.getFaqTitle() %></label>
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

						<%if (searchList.isEmpty()) { %>
					<p></p>
					<% } else { %>
						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/searchFaq.ct?currentPage=<%=currentPage-1%>&searchFaq=<%=searchFaq%>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/searchFaq.ct?currentPage=<%= p %>&searchFaq=<%=searchFaq%>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/searchFaq.ct?currentPage=<%=currentPage+1%>&searchFaq=<%=searchFaq%>';">다음</button>
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

</body>
</html>