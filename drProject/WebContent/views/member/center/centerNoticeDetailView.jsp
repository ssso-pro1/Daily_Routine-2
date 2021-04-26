<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.center.model.vo.CenterNotice, com.dr.admin.center.model.vo.centerNoticeFile" %>
<%

	CenterNotice n = (CenterNotice)request.getAttribute("n");		
	
	centerNoticeFile fi = (centerNoticeFile)request.getAttribute("fi");

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

    

    #content_2_1{height: 7%;}
    #content_2_2{height: 10%;}
    #content_2_3{height: 10%;}
    #content_2_4{height: 77%;}
    


    #upperIcon{
        
        width:170px;
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
        background: lightgray;
        height: 50px;
        width: 600px;
    }
    
   
    .underLine {
        border: 1px solid gray;
        width: 0.1px;
        width: 150px;
        }

    .queryArea{
        height: 90%;
        width: 100%;
    }

    .queryArea>form>table{
        margin: auto;
        width: 500px;
        height: 400px;
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
           <a href="<%=contextPath%>/main.ct" id="leftMenu"><h1>고객센터</h1></a>
            <div class="leftMenu">
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top" id="leftMenu">FAQ</a></div>
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
        <div id="content_2">
            <div id="content_2_1">
                <h3>고객센터 > 1:1 문의 </h3>
                <hr>
            </div>

            <div id="content_2_2">
                <div class="iconArea">
                    <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">
                        <div id="upperIcon" class="ff" class="faq" align="center">FAQ</div>
                    </a>
                    <a href="<%=contextPath%>/enrollQuery.ct">
                        <div id="upperIcon" class="ff" class="query" align="center">1:1문의</div>
                    </a>
                    <a href="<%=contextPath%>/queryList.ct?currentPage=1">
                        <div id="upperIcon" class="ff" class="queryList" align="center">나의 문의내역</div>
                    </a>
                    <a href="<%=contextPath%>/notice.ct?currentPage=1">
                        <div id="upperIcon" class="ff" class="notice" align="center">공지사항</div>
                    </a>
                </div>
            </div>
                

            <!--공지사항-->
            <div id="content_2_3">    
                <p><h3>공지사항</h3></p>
                <div class="underLine"></div>
            </div>


            <!--공지사항 내용 뷰-->
            <div id="content_2_4">
                <div class="noticeDetailArea" align="center">
                    <table border="1">
                        <tr>
                            <th>글제목</th>
                            <td colspan="3"><%= n.getNoticeTitle() %></td>
                        </tr>
                        <tr>
                            <th>등록일</th>
                            <td><%=n.getCreateDate() %></td>
                            <th>조회수</th>
                            <td><%=n.getNoticeCount() %></td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3">
                            
                            <!-- 첨부파일이 없을경우-->
					        <%if(fi == null) { %>
					                    
					            첨부파일이 없습니다
					                    
							<% } else { %>
										
					       <!--첨부파일이 있을경우-->
					       <a download="<%= fi.getFileName() %>" href= "<%= contextPath %>/<%= fi.getFilePath() + fi.getFileUpdate() %>"><%= fi.getFileName() %></a>
					                	
					       <% } %>  
					       </td>
                        </tr>
                        <tr>
                            <th>글내용</th>
                            <td colspan="3"><div><%=n.getNoticeContent() %></div></td>
                        </tr>
                        
                        
                        <tr>
                            <td colspan="4">
                                <% if(n.getNextTitle()==null) { %>
                                <button disabled>
                                	다음글
                                </button>
                                <label>다음글이 없습니다</label>
                                
                                <% } else { %>
                                <button>
                                	<a href="<%= contextPath %>/noticeDetail.ct?nno=<%= n.getNextNo() %>">다음글</a>
                                </button>
                                <label><%= n.getNextTitle() %></label>
                                
                                <% } %>
                                
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td colspan="4">
                                <% if(n.getPreTitle()==null) { %>
                                <button disabled>
                                	이전글
                                </button>
                                <label>이전글이 없습니다</label>
                                
                                <% } else { %>
                                <button>
                                	<a href="<%= contextPath %>/noticeDetail.ct?nno=<%= n.getPreNo() %>">이전글</a>
                                </button>
                                <label><%= n.getPreTitle() %></label>
                                
                                <% } %>
                                
                            </td>
                        </tr>
                        
                        
                    </table>

                    <br>
                    <button><a href="<%=contextPath%>/notice.ct?currentPage=1">목록으로</a></button>


                </div>
                

                   
            </div>

            

        </div>
    </div>
</div>

</body>
</html>