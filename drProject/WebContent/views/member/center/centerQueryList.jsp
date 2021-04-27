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
        height: 150px;
    }
    

    

    #content_2_1{height: 8%;}
    #content_2_2{height: 12%;}
    #content_2_3{height: 73%;}
    #content_2_4{height: 10%;}
    


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
    
   
    #upperIcon.queryList{
        background-color: rgb(250, 234, 16);
        color: black;
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
        background :rgb(235, 233, 232);
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
    
    .a{ background-color: rgb(245, 239, 239);}    
    
    a#leftMenu{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a#leftMenu:hover{color:rgb(250, 214, 9);}
    
    .ff{font-family: 'Do Hyeon', sans-serif;}

    a{text-decoration: none;}

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
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top" id="leftMenu">FAQ</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct" id="leftMenu">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct?currentPage=1" id="leftMenu" style="color:rgb(250, 214, 9);">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct?currentPage=1" id="leftMenu" >공지사항</a></div>
            </div>
        </div>

        <div id="line"></div>
        
        
       <div id="content_2" class="ff">
           <div id="content_2_1">
                <h2>고객센터 > 공지사항 </h2>
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
                

            <!--나의 문의내역-->
            
            <!--나의 문의내역 리스트-->
            <div id="content_2_3" style="margin-left: 50px;" >    
                <div class="queryListArea ff" style="width: 95%; margin: auto;">
                    
                    <!-- 문의내역이 없을경우-->
                    
                    <% if(list.isEmpty()) { %>
                    <div align="center">
                        <p style="color: crimson; font-weight: bolder; font-size: 20px;">1:1 문의 내역이 없습니다</p>
                        <button><a href="<%=contextPath %>/enrollQuery.ct">1:1 문의 하기</a></button>

                    </div>
                    <% } else { %>

                    <!-- 문의 내역이 있을경우-->
                    	<% for(CenterQuery q:list) { %>
	                    
		                    <div class="queryList">
		                        
		                        <table >
		                            <tr>
		                                <th style="width: 90px; font-size: 18px;">[<%= q.getQueryCategory() %>]</th>
		                                <td style="width: 500px; font-size: 15px;" align="left"><%=q.getQueryTitle() %></td>
                                        
                                        <% if(q.getReplyStatus().equals("Y")) { %>
                                        <td style="width: 90px; color: rgb(119, 31, 235); font-weight: 800;">답변완료</td>
		                                <% } else { %>
		                                <td style="width: 90px; color: grey; font-weight: 800;">처리중</td>
		                                <% } %>
		                                
		                                <th style="width: 90px; float: right;"><%=q.getQueryCreateDate() %></th>
		                            </tr>
		                            
		                        </table>
							 </div>
		                    <div class="queryContent">
		                        <div>
                                    <table  style="margin: auto;">
                                        <tbody class="q">
                                            <tr>
                                                <td style="height: 100px; width: 700px"><%=q.getQueryContent()  %></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                <button type="submit" onclick="return confirmation();" style="float: right;">
                                                <a href="<%= contextPath %>/deleteQuery.ct?qno=<%=q.getQueryNo()%>">삭제하기</a>
                                                </button></td>
                                            
                                            </tr>
                                        </tbody>
                                       
                                        <tfoot class="a">
                                         <% if(q.getReplyStatus().equals("Y")) { %>    
                                            <tr>
                                                <td style="height: 130px; width: 350px; color: rgb(102, 73, 161);"><%=q.getReplyContent() %></td>
                                            </tr>
                                        <% } else {%>
                                        	<tr>
                                                <td style="height: 130px; width: 350px; color: rgb(102, 73, 161);">문의 확인중입니다</td>
                                            </tr>
                                        <% } %>    
                                        </tfoot>
                                        
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
                    
                    function confirmation(){ // 문의글 삭제버튼 클릭시 컴펌창
                    	
                    	var result = confirm("문의글을 삭제하시겠습니까?");
                    	if(result){
                    		return true;
                    		
                    	} else {
                    		alert("문의글 삭제가 취소되었습니다");
                    		return false;
                    	}
                    }
                    
                </script>

            </div> 
                <div id="content_2_4"> 
            		<!-- 페이징처리 10개씩 -->
                    <div align="center" class="pagingArea">

						<% if(currentPage != 1) { %>
			            	<button onclick="location.href='<%=contextPath%>/queryList.ct?currentPage=<%=currentPage-1%>';">이전</button>
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++) { %>
							
							<% if(currentPage == p){ %>
			            		<button disabled style="background:rgb(250, 214, 9); color:white; border:rgb(250, 214, 9)";><%= p %></button>
			            	<% }else{ %>
			            		<button onclick="location.href='<%=contextPath%>/queryList.ct?currentPage=<%= p %>';"><%= p %></button>
			            	<% } %>
			            	
						<% } %>
						
						<% if(currentPage != maxPage){ %>
			            	<button onclick="location.href='<%=contextPath%>/queryList.ct?currentPage=<%=currentPage+1%>';">다음</button>
						<% } %>
						
			        </div>
                </div>            
     </div>      
</div>
</body>
</html>