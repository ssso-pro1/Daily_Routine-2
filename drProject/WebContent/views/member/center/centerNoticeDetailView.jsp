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
    
    a:hover{color:rgb(250, 214, 9);}

    a{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }

    button{
        color:black;
        text-decoration:none;
        font-size:18px;
        font-weight:bolder;
        border:rgb(250, 214, 9);
    }
    

    .detailArea>table{
        width:100%;
        border:1px solid black;
        border-top:1px solid black;
        border-collapse:collapse;
    } 
    
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
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top" id="leftMenu">FAQ</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct" id="leftMenu">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct?currentPage=1" id="leftMenu">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct?currentPage=1" id="leftMenu" style="color:rgb(250, 214, 9);">공지사항</a></div>
            </div>
        </div>
        
        <div id="line"></div>
        
        <!--버튼-->
        <div id="content_2" class="ff">
            <div id="content_2_1">
               <h2>고객센터 > 공지사항 </h2>
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
                        <tr align="center" height="40px;" class="ff">
                            <th width="70%"><%= n.getNoticeTitle() %></th>
                            <th width="15%"><%=n.getCreateDate() %></th>
                            <th width="15%">조회수 : <%=n.getNoticeCount() %></th>
                        </tr>
                        <tr align="left">
                            <td colspan="5" height="100%">
                                <div><%=n.getNoticeContent() %></div>
                            </td>
                        </tr>
                        <tr class="ff">
                            <td colspan="5" >
                                <!-- 첨부파일이 없을경우-->
                                <%if(fi == null) { %>
                                    &nbsp; <i class="far fa-file-image"></i>&nbsp; 첨부파일이 없습니다. 
                                <% }else { %>
                                    &nbsp; <i class="far fa-file-image"></i>&nbsp; 첨부파일 > <a download="<%= fi.getFileName() %>" href= "<%= contextPath %>/<%= fi.getFilePath() + fi.getFileUpdate() %>"><%= fi.getFileName() %></a>
                                <% } %>	
                            </td>        
                        </tr>
                        <tr class="ff">
                            <td colspan="4">
                                <% if(n.getNextTitle()==null) { %>
                                <button disabled class="ff">
                                	다음글
                                </button>
                                <label>다음글이 없습니다</label>
                                
                                <% } else { %>
                                <button class="ff">
                                	<a href="<%= contextPath %>/noticeDetail.ct?nno=<%= n.getNextNo() %>">다음글</a>
                                </button>
                                <label><%= n.getNextTitle() %></label>
                                
                                <% } %>
                                
                            </td>
                        </tr>
                        
                        
                        <tr class="ff">
                            <td colspan="4">
                                <% if(n.getPreTitle()==null) { %>
                                <button disabled class="ff">
                                	이전글
                                </button>
                                <label>이전글이 없습니다</label>
                                
                                <% } else { %>
                                <button class="ff"> 
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