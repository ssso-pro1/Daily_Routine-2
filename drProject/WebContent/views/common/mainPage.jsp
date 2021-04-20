<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    /* menubar */
    #header>p{
        background:rgb(250, 214, 9);
        font-size: 15px;
    }

    #outer {
        height:1600px;
    }
    .outerWrap a{
        text-decoration:none;
        color: black;
        font-size:12px;
        line-height:50px;
        font-weight:bold;

        
    }
    .menu{
        display: table-cell;
        height: 50px;
        width: 300px;
    }
    .menu a{
        text-decoration:none;
        color:black;
        font-size:20px;
        line-height:50px;
        font-weight:bold;
        display:block;
        width:100%;
        height:100%;
    }
    .outerWrap a:hover{
        color:darkorchid
	}
   
   /* content */
    #content1{
        width:100%;
        height:20%;
        background-color: gray;
    }
    
    .line{
        border: 1px solid gray;
        height:250px;
        margin: 0 20px;
    }
    
    #content2{
        display:flex;
        justify-content: center;
    }

    #content3 *{
        text-decoration:none;
        color:black;
        font-weight:bold;
        margin:20px;
        padding: 0px 20px;
        
    }

</style>
</head>
<body>
    <!-- <%@ include file = "menubar.jsp"%> -->
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

	<script>
    // 회원가입 성공 시 뜨는 알림창 메시지. 확인 누르면 메뉴바로 (메인페이지)
    var msg = "<%=session.getAttribute("alertMsg")%>";

    if(msg != "null"){
        alert(msg);
        <% session.removeAttribute("alertMsg"); %>
    }
    </script>
    
<div id="outer">


    <div class="outerWrap">
        <div id="header">
            <p align="center">Reading is to the mind what exercise is to the body</p>
            
            <table id="topMenu" align="right">
                <tr>
                    <th><a href="<%=contextPath%>/loginForm.us">로그인</a></th>
                    <th>|</th>
                    <th><a href="<%=contextPath%>/enrollForm1.us">회원가입</a></th>
                    <th>|</th>
                    <th><a href="<%=contextPath%>/main.ct">고객센터</a></th>
                </tr>
            </table>
        </div>
    </div>

    <br><br>
    <div id="navWrap1" >
        <div class="nav1" align="center">
            <div class="menu"><a href="<%=contextPath%>/mainPage.co">메인페이지</a></div>
            <div class="menu"><a href="">HomeTraining</a></div>
            <div class="menu"><a href="<%=contextPath%>/commMain.co?currentPage=1">Community</a></div>
            <div class="menu"><a href="<%=contextPath%>/intMain.in">Info&Tip</a></div>
            <div class="menu"><a href="<%=contextPath%>/myPage.md">My D.R.</a></div>
            <div></div>
        </div>
        
        <!-- 얘 위치 조정이 안돼요.. 흑흑 -->
        <div class="nav2" align="right">
            Welcome DR님<i class="fas fa-user-circle"></i>
        </div>
        <hr>
    </div>

    <div id="content1" style="margin-top:20px; margin-bottom:50px;">
        <video src="https://youtube.com" autoplay width="100%" height="150px" controls></video>
        <!-- <iframe width="420" height="315"
            src="https://www.youtube.com/embed/tgbNymZ7vqY?controls=0">
        </iframe> -->
    
    </div>
    

    <div id="content2">
        <div class="content2_1">
            <table border="1" style="text-align:center;">
                <caption><b>Info&Tip 최신글</b></caption>
                
                <tr>
                    <th width="50px" height="40px">글번호</th>
                    <th width="200px">제목</th>
                    <th width="130px">등록 날짜</th>
                    <th width="50px">조회수</th>
                </tr>
                <tr>
                    <td height="25px">1</td>
                    <td>유산소 운동 시 주의할 점</td>
                    <td>2019-03-04</td>
                    <td>123</td>
                </tr>
                <tr>
                    <td height="25px">2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">3</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">4</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">5</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>

        <div class="line"></div>

        <div class="content2_2">
            <table border="1" style="text-align:center;">
                <caption><b>Community 인기글</b></caption>
                
                <tr>
                    <th width="50px" height="40px">글번호</th>
                    <th width="200px">제목</th>
                    <th width="130px">등록 날짜</th>
                    <th width="50px">조회수</th>
                </tr>
                <tr>
                    <td height="25px">1</td>
                    <td>운동하기 딱 좋은 날씨네요</td>
                    <td>2019-03-04</td>
                    <td>123</td>
                </tr>
                <tr>
                    <td height="25px">2</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">3</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">4</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td height="25px">5</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>


    </div>


    <hr style="margin-top:20px; margin-bottom:30px;">

    <div id="content3" >
        <table align="center"></table>
            <tr>
                <th>트린이를 위한 초보자 추천 운동</th>
                <th>트린이를 위한 초보자 추천 운동</th>
                <th>트린이를 위한 초보자 추천 운동</th>
                <th>트린이를 위한 초보자 추천 운동</th>
                
            </tr>
            <tr>
                <video src="https://youtube.com" autoplay width="120px;" height="120px;" controls></video>
                <video src="https://youtube.com" autoplay width="120px;" height="120px;" controls></video>
                <video src="https://youtube.com" autoplay width="120px;" height="120px;" controls></video>
                <video src="https://youtube.com" autoplay width="120px;" height="120px;" controls></video>
            </tr>
            
        </table>


        <!-- <div class="content3_1" style="" >
            <a href="">트린이를 위한 초보자 추천 운동</a> <br>
            <video src="https://youtube.com" autoplay width="100px;" height="100px;" controls></video>
        </div>
        <div class="content3_2" >
            <a href="">기구없이 하는 맨몸 운동</a> <br>
            <video src="https://youtube.com" autoplay width="100px;" height="100px;" controls></video>
        </div>
        <div class="content3_3" >
            <a href="">자기 전 간단한 10분 운동</a> <br>
            <video src="https://youtube.com" autoplay width="100px;" height="100px;" controls></video>
        </div>
        <div class="content3_4" >
            <a href="">거북목 예방위한 스트레칭</a> <br>
            <video src="https://youtube.com" autoplay width="100px;" height="100px;" controls></video>
        </div>
    </div> -->


    <!-- footer -->
    <%@ include file="footerbar.jsp"%>
</div>
</body>
</html>