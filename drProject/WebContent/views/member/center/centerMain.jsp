<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.dr.member.center.model.vo.CenterNotice"%>
<%

	ArrayList<CenterNotice>list = (ArrayList<CenterNotice>)request.getAttribute("list");

	

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

    

    #content_2_1{height: 5%;}
    #content_2_2{height: 14%;}
    #content_2_3{height: 11%;}
    #content_2_4{height: 35%;}
    #content_2_5{height: 35%;}


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
    
    .helpArea{
        margin:auto;
    }
    .helpImg{
        border:1px solid black;
        width:120px;
        display:inline-block;
        margin:10px;
        cursor: pointer;
    }
    .noticeList{
        background: lightgray;
        width: 100%;
        height: 40px;
        line-height: 30px;
        border: 1px solid;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
        }

    .noticeContent{
        width: 100%;
        height: 100px;
        border:1px solid lightgray;
        margin-top: 5px;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 5px;
        display: none;
        }

   
    

</style>
</head>

<%@include file="../../common/menubar.jsp" %>


<div class="wrap">

    <!--왼쪽 공통메뉴-->
    <div id="content">
        <div id="content_1">
            
            <h1><a href="<%=contextPath%>/main.ct">고객센터</a></h1>
            <div class="leftMenu">
                <div><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">FAQ 자주찾는 질문</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct?currentPage=1">공지사항</a></div>
                
            </div>

        </div>
            
        <div id="line"></div>
    
        
        
        <!--버튼-->
        <div id="content_2">
            <div id="content_2_1">고객센터 HOME</div>

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
                    <form action="" method="">
                        <input type="text" name="search" id="serch" placeholder="궁금한내용을 입력해주세요">
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>


            <!--무엇을 도와드릴까요-->
            <div id="content_2_4">
                <p><h2>무엇을 도와드릴까요? <button><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">전체보기</a></button></h2></p>
                
                <div class="helpArea">
                    <div class="helpImg" align="center">
                        <img src="../../resources/images/fq.JPG" width="120" height="120">
                        <p>
                            faq
                        </p>
                    </div>
                    <div class="helpImg" align="center">
                        <img src="../../resources/images/member.JPG" width="120" height="120">
                        <p>
                           	 회원정보
                        </p>
                    </div>
                    <div class="helpImg" align="center">
                        <img src="../../resources/images/contents.JPG" width="120" height="120">
                        <p>
                            	게시글
                        </p>
                    </div>
                    <div class="helpImg" align="center">
                        <img src="../../resources/images/report.JPG" width="120" height="120">
                        <p>
                          	  신고
                        </p>
                    </div>
                    <div class="helpImg" align="center">
                        <img src="../../resources/images/etc.JPG" width="120" height="120">
                        <p>
                           	 기타
                        </p>
                    </div>
                </div>    
                

            </div>

            <!--공지사항 3개만 보여주기-->
            <div id="content_2_5"> 
                <p><h2>공지사항 <button><a href="<%=contextPath%>/notice.ct?currentPage=1">전체보기</a></button></h2></p>

                <div class="noticeArea">
                
                	<%if(list.isEmpty()) { %>
                	
                	<p>공지사항이 없습니다</p>
                	
                	<% } else { %>
                		<% for(int i=0; i<3; i++) { %>
		                    <div class="noticeList">
		                        <label id="noticeTitle"><%= list.get(i).getNoticeTitle() %></label>
		                        <label style="float: right;" id="noticeDate"><%=list.get(i).getCreateDate() %></label>
		                    </div>
		                        <p class="noticeContent"><%= list.get(i).getNoticeContent() %></p>
		                 <% } %>       
					<% } %>

					<!--  
                    <div class="noticeList">
                        <label id="noticeTitle">공지공지2</label>
                        <label style="float: right;" id="noticeDate">2021-04-01</label>
                    </div>
                        <p class="noticeContent">내용내용2</p>
                    -->

                </div>  
                
                <script>
                    $(function(){
                        $(".noticeList").click(function(){
            
                            // slideDown 또는 slideUp 시킬 p요소
                            var $noticeContent = $(this).next(); // jQuery방식으로 선택한 요소를 담아둘 때 변수명 앞에 $
            
                            if($noticeContent.css("display") == "none"){
                                 $(this).siblings(".noticeContent").slideUp();
                                 $noticeContent.slideDown();// 보여지게
            
                            }else{
                                $noticeContent.slideUp(); // 사라지게
                            }
                               
                        })
                    })
                </script>
                

            </div>

        </div>
    </div>

</div>

</body>
</html>