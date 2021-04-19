<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dr.member.center.model.vo.CenterQuery, com.dr.common.model.vo.PageInfo"%>
<%

	ArrayList<CenterQuery>list = (ArrayList<CenterQuery>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
    #content_2_4{height: 72%;}
    #content_2_5{height: 5%;}
    


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

    
    
    .queryList{
        background :rgb(241, 236, 229);
        width: 100%;
        height: 40px;
        line-height: 30px;
        border: 1px solid;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
        }

    .queryContent{
        width: 100%;
        height: 300px;
        border:1px solid lightgray;
        margin-top: 5px;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 5px;
        display: none;
        }
    
    .replyContent{

        width: 100%;
        height: auto;
        border:1px solid lightgray;
        margin-top: 5px;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 5px;
       
        }
    .q{
        background: wheat;
    }
    .a{ background-color: rgb(245, 239, 239);}    
    
    

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
            <div id="content_2_1">고객센터 HOME > 나의 문의내역</div>

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
                

            <!--나의 문의내역-->
            <div id="content_2_3">    
                <p><h3>나의 문의 내역</h3></p>
                <div class="underLine"></div>
            </div>

            <!--나의 문의내역 리스트-->
            <div id="content_2_4">    
                <div class="queryListArea" style="width: 95%; margin: auto;">
                    
                    <!-- 문의내역이 없을경우-->
                    
                    <% if(list.isEmpty()) { %>
                    <div align="center">
                        <p style="color: crimson; font-weight: bolder; font-size: 20px;">1:1 문의 내역이 없습니다</p>
                        <button>1:1 문의 하기</button>

                    </div>
                    <% } else { %>

                    <!-- 문의 내역이 있을경우-->
                    	<% for(CenterQuery q:list) { %>
	                    
		                    <div class="queryList">
		                        
		                        <table >
		                            <tr>
		                                <th style="width: 90px;">[<%= q.getQueryCategory() %>]</th>
		                                <th style="width: 500px;" align="left"><%=q.getQueryTitle() %></th>
                                        
                                        <% if(q.getReplyStatus().equals("Y")) { %>
                                        <th style="width: 90px;">답변완료</th>
		                                <% } else { %>
		                                <th style="width: 90px;">처리중</th>
		                                <% } %>
		                                
		                                <th style="width: 90px;"><%=q.getQueryCreateDate() %></th>
		                            </tr>
		                            
		                        </table>
							 </div>
		                    <div class="queryContent">
		                        <div>
                                    <table  style="margin: auto;">
                                        <tbody class="q">
                                            <tr>
                                                <td style="height: 100px; width: 700px"><%=q.getQueryContent() %></td>
                                            </tr>
                                            <tr>
                                                <td><button style="float: right;">삭제하기</button></td>
                                            </tr>
                                        </tbody>
                                        <% if(q.getReplyStatus().equals("Y")) { %>
                                        <tfoot class="a">
                                            <tr>
                                                <td style="height: 130px; width: 350px;"><%=q.getReplyContent() %></td>
                                            </tr>
                                        </tfoot>
                                        <% } %>
                                    </table>
                                </div>
		                     </div>    
                              <% } %>  
                            <% } %>     
		                    
				</div>

                <script>
                    $(function(){
                        $(".queryList").click(function(){
            
                            // slideDown 또는 slideUp 시킬 p요소
                            var $queryContent = $(this).next(); // jQuery방식으로 선택한 요소를 담아둘 때 변수명 앞에 $
                            

                            if($queryContent.css("display") == "none"){
                                 $(this).siblings(".queryContent").slideUp();
                                 
                                 $queryContent.slideDown();// 보여지게
                                 
            
                            }else{
                                $queryContent.slideUp(); // 사라지게
                                
                            }
                               
                        })
                    })
                </script>

            </div> 
            
            		<!-- 페이징처리 10개씩 -->
                    <div align="center" class="pagingArea">

						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/queryList.ct?currentPage=<%=currentPage-1%>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/queryList.ct?currentPage=<%= p %>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/queryList.ct?currentPage=<%=currentPage+1%>';">다음</button>
						<% } %>
						
			        </div>

           

</body>
</html>