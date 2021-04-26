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

    .detailArea>table{
        width:100%;
        border:1px solid black;
        border-top:1px solid black;
        border-collapse:collapse;
    } 
    

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
        <div id="content_2">
            <div id="content_2_1">
               <h3 class="ff" style="font-weight: 100; font-size: 20px;">고객센터 > 공지사항 </h3>
                <hr>
            </div>

            <div id="content_2_2" style="margin-left: 20px; width: 900px;">
                <div class="iconArea">
                    <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">
                        <div id="upperIcon" class="faq ff" align="center">FAQ</div>
                    </a>
                    <a href="<%=contextPath%>/enrollQuery.ct">
                        <div id="upperIcon" class="query ff" align="center">1:1문의</div>
                    </a>
                    <a href="<%=contextPath%>/queryList.ct?currentPage=1">
                        <div id="upperIcon" class="queryList ff" align="center">나의 문의내역</div>
                    </a>
                    <a href="<%=contextPath%>/notice.ct?currentPage=1">
                        <div id="upperIcon" class="notice ff" align="center">공지사항</div>
                    </a>
                </div>
            </div>
                

            

            <!-- 게시글 세부 영역 -->
            <div id="content_2_3">
                <div class="detailArea" >
                    <table border="1" height="600px;" width="800px">
                        <tr align="center" height="40px;">
                            <th width="55%"><%= n.getNoticeTitle() %></th>
                            <th width="20%">등록일 : <%=n.getCreateDate() %></th>
                            <th width="15%">조회수 : <%=n.getNoticeCount() %></th>
                        </tr>
                        <tr align="left">
                            <td colspan="5" height="100%">
                                <div style="margin-bottom:400px;"><%=n.getNoticeContent() %></div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <!-- 첨부파일이 없을경우-->
                                <%if(fi == null) { %>
                                    &nbsp; <i class="far fa-file-image"></i>&nbsp; 첨부파일이 없습니다. 
                                <% }else { %>
                                    &nbsp; <i class="far fa-file-image"></i>&nbsp; 첨부파일 > <a download="<%= fi.getFileName() %>" href= "<%= contextPath %>/<%= fi.getFilePath() + fi.getFileUpdate() %>"><%= fi.getFileName() %></a>
                                <% } %>	
                            </td>        
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
                    </table><br>
                </div>
            </div><br>

        </div>
    </div>
</div>

</body>
</html>