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

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">


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

    

    #content_2_1{height: 7%;}
    #content_2_2{height: 14%;}
    #content_2_3{height: 11%;}
    #content_2_4{height: 35%;}
    #content_2_5{height: 35%;}


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
    
    #upperIcon:hover{
        cursor: pointer; opacity: 0.9; 
    }


     .searchArea{
        margin: auto;
        background: rgb(221, 221, 221);
        height: 50px;
        width: 600px;
    }
    
    .helpArea{
        margin:auto;
    }
    .helpImg{
        border:1px solid black;
        width:130px;
        display:inline-block;
        margin:12px;
        cursor: pointer;
    }

    .helpImg:hover{color: indigo; cursor: pointer; opacity: 0.9;}


    .noticeList{
        background: rgb(221, 221, 221);
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
        border:1px solid rgb(221, 221, 221);
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
    
    a{text-decoration: none; color: black;}

    .ff{font-family: 'Do Hyeon', sans-serif;}
    
    #noticeTitle:hover{color: indigo; cursor: pointer;}

</style>
</head>

<%@include file="../../common/menubar.jsp" %>


<div class="wrap">

    <!--왼쪽 공통메뉴-->
    <div id="content">
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
    
        
        
       <div id="content_2" class="ff">
           <div id="content_2_1">
                <h2>고객센터 HOME </h2>
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
                

            <!--검색-->
            <div id="content_2_3">    
                <div class="searchArea" align="center">
                    <form action="<%=contextPath %>/searchFaq.ct?currentPage=1" method="post">
                        <input type="text" name="searchFaq" id="serchFaq" placeholder="궁금한내용을 입력해주세요" style="margin-top: 13px; width: 300px;">
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>


            <!--무엇을 도와드릴까요-->
            <div id="content_2_4">
                <p><h2 class="ff" style="font-weight: 700; font-size: 25px;">무엇을 도와드릴까요? <button><a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top">전체보기</a></button></h2></p>
                
                <div class="helpArea">
                    <div class="helpImg" align="center">
                        <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=top"><img src="https://t3.ftcdn.net/jpg/04/28/16/86/240_F_428168682_Hbozsl5o8rjLlgOZfSw23ddknim4ZdGg.jpg" width="120" height="118"></a>
                        <p class="ff" style="font-weight: 700; font-size: 18px;">
                           	 질문 TOP10
                        </p>
                        
                    </div>
                    <div class="helpImg" align="center">
                        <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=userInfo"><img src="https://t3.ftcdn.net/jpg/02/73/37/20/240_F_273372018_avUsN7C4K9RDVPDQuCkeyAbyOvS58apZ.jpg" width="120" height="120"></a>
                        <p class="ff" style="font-weight: 700; font-size: 18px;">
                           	 회원정보
                        </p>
                    </div>
                    <div class="helpImg" align="center">
                        <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=content"><img src="https://t3.ftcdn.net/jpg/03/00/17/00/240_F_300170007_EeUnk2vDMLQJDQh0sStL46tH0rTUy1j3.jpg" width="120" height="120"></a>
                        <p class="ff" style="font-weight: 700; font-size: 18px;">
                            	게시글/댓글
                        </p>
                    </div>
                    <div class="helpImg" align="center">
                        <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=report"><img src="https://t3.ftcdn.net/jpg/00/91/70/80/240_F_91708092_BJJtouZ0WymGgV1x3matkZsHibuyUOTV.jpg" width="120" height="120"></a>
                        <p class="ff" style="font-weight: 700; font-size: 18px;">
                          	  신고
                        </p>
                    </div>
                    <div class="helpImg" align="center">
                        <a href="<%=contextPath%>/faqList.ct?currentPage=1&ctg=etc"><img src="https://t4.ftcdn.net/jpg/03/08/43/19/240_F_308431972_g5fuiXwgOZpDCMFQougq13hgSaQVHVro.jpg" width="120" height="120"></a>
                        <p class="ff" style="font-weight: 700; font-size: 18px;">
                           	 기타
                        </p>
                    </div>
                </div>    
                

            </div>

            <!--공지사항 3개만 보여주기-->
            <div id="content_2_5" class="ff"> 
                <p><h2 style="font-weight: 700; font-size: 25px;">공지사항 <button><a href="<%=contextPath%>/notice.ct?currentPage=1">전체보기</a></button></h2></p>

                <div class="noticeArea">
                
                	<%if(list.isEmpty()) { %>
                	
                	<p style="font-weight: 100; font-size: 18px;">공지사항이 없습니다</p>
                	
                	<% } else { %>
                		<% for(int i=0; i<2; i++) { %> <!-- 글이 3개 이상 있어야지만 나온다...흠.. / 눌렀을때 슬라이드로 아니고 그냥 공지사항 디테일뷰로 이동하도록 수정!-->
		                    <div class="noticeList">
		                    <a href="<%= contextPath%>/noticeDetail.ct?nno=<%=list.get(i).getNoticeNo() %>">

                                <label style="font-weight: 100; font-size: 18px; margin-left: 10px;" id="noticeTitle"><%= list.get(i).getNoticeTitle() %></label>
                                <label style="font-weight: 100; font-size: 15px; float: right; margin-right: 10px;" id="noticeDate"><%=list.get(i).getCreateDate() %></label>
                                    
		                        
		                        
		                        <!--  <p class="noticeContent"><%= list.get(i).getNoticeContent() %></p>-->
		                   	</a>
		                   </div>
		                       
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
                
                <!--  
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
                -->

            </div>

        </div>
    </div>

</div>

</body>
</html>