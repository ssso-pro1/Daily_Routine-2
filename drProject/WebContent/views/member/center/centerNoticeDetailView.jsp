<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.center.model.vo.CenterNotice"%>
<%

	CenterNotice n = (CenterNotice)request.getAttribute("n");		  // 현재글 (글번호, 제목, 내용, 작성일)
	CenterNotice nPre = (CenterNotice)request.getAttribute("nPre");   // 이전글 (글번호, 제목)
	CenterNotice nNext = (CenterNotice)request.getAttribute("nNext"); // 다음글 (글번호, 제목)
	
	

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

    .queryArea{
        height: 90%;
        width: 100%;
    }

    .queryArea>form>table{
        margin: auto;
        width: 500px;
        height: 400px;
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
            <div id="content_2_1">고객센터 HOME > 1:1 문의</div>

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
                            <th>글내용</th>
                            <td colspan="3"><textarea name="" id="" cols="50" rows="20" style="resize: none;" readonly><%=n.getNoticeContent() %></textarea></td>
                        </tr>
                        
                        
                        <%if(nNext==null){ %>
                        <tr>
                            <td colspan="4">
                                <button disabled>다음글</button>
                                <label>다음글이 없습니다</label>
                            </td>
                        </tr>
                        
                        <% } else { %>
                        
                        <tr>
                            <td colspan="4">
                                <button>
                                
                                <a href="<%= contextPath %>/noticeDetail.ct?nno=<%= nNext.getNoticeNo() %>">다음글</a>
                                
                                
                                </button>
                                <label><%= nNext.getNoticeTitle() %></label>
                            </td>
                        </tr>
                        <% } %>
                        
                        
                        <%if(nPre==null){ %>
                        <tr>
                            <td colspan="4">
                                <button disabled>이전글</button>
                                <label>이전글이 없습니다</label>
                            </td>
                        </tr>
                        
                        <% } else { %>
                        
                        <tr>
                            <td colspan="4">
                                <button><a href="<%= contextPath %>/noticeDetail.ct?nno=<%= nPre.getNoticeNo() %>">이전글</a></button>
                                <label><%= nPre.getNoticeTitle() %></label>
                            </td>
                        </tr>
                        <% } %>
                        
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