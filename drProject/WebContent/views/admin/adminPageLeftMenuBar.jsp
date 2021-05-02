<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");
	
	String contextPath = request.getContextPath();
%>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 페이지- 좌측 메뉴바</title>
    <!-- jQuery library-->
    <script src="https://ajax.googleeapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
        /* @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic:wght@700&display=swap'); */
        .f{
            font-family: 'Do Hyeon', sans-serif;
        }
        div{
            box-sizing:border-box;
        }
        .wrap{
            width:1000px;
            height:800px;
            margin:auto;
            margin-top:15px;
            background-color: rgb(33, 33, 34);
        }
        .wrap>div{
            width:100%;
        }
        
        #content{height:100%; width:100%;}
        #content>div{
            height:100%;
            float:left;
        }
        #content_1{width:15%;}
        #content_2{width:80%; margin-left:30px;}
        #line{width:1%;}
        #line{
            border:1px solid gray;
            width:0.1px;
            height:150px;
        }
        #welcome{
            text-decoration: none;
            color:white;
        }
        
        #nav{
            width:100%;
            height:40px;
            background-color: gray;
            padding:5px;
            
            display:flex;
            justify-content:space-between;
            color:white;
            font-weight:bold;
            font-size:20px;
        }
        #content_1 *{
            color:gray;
            margin: 10px 3px;
        }
        #content_1>div{
            font-size:13px;
            margin-top:20px;
            margin-left:10px;
        }
        #content_1 a{
            font-size:12px;
            text-decoration:none;
            font-weight:bold;
            margin-left:10px;
        }
        #content a:hover{color:white;}
        #content_2_1{
            color:white;
            font-size:10px;
            padding:10px;
        }
        .loginNavi *, #nav *{
            color:white;
            text-decoration: none;
        }
        #ac:hover, #log:hover, .hov:hover{
            color:black;
        }

        #content_2_2{
            margin-left:30px;
        }

        /* content_3 */
        #content_3{
            display:flex;
            border: 1px solid rgb(255, 250, 201);
            height:500px;
            width:700px;
            margin:30px;
            padding-left:50px;
            text-align: center;

        }
        #user:hover{
            color: skyblue
        }
        #center:hover{
            color:salmon;
        }
        #post:hover{
            color:lightgoldenrodyellow
        }
        #user, #center{
            /* border:3px solid salmon; */
            width:250px;
            height:200px;
            /* position:relative; */
            margin:30px 30px;
            padding:10px 0px;
            color:white;
            background-color: rgb(46, 46, 46);
            
        }

        #center{
            /* border:3px solid #C694C6; */
            margin:20px 
            margin-left:30px;
        }
        #post{
            /* border:3px solid #57B8B9; */
            width:250px;
            height:430px;
            margin-top:30px;
            padding:10px ;
            color:white;
            background-color:rgb(46, 46, 46);
            
        }
        #user{
            color:white;

        }
    </style>
</head>
<body>
    <div class="f">
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

    <div class="wrap">

        <div id="nav">
            <span align="left"><a href="<%=contextPath%>/mainPage.ad" id="ac">Admin Center</a></span>

             <span class="loginNavi">
                <!-- 로그인 전 -->
                   
                    
                   <!-- 로그인  후 -->
                    <% if(loginUser != null && loginUser.getAdminCheck().equals("Y")){ %>
                        <b><%=loginUser.getUserName() %>님</b> 환영합니다. 
                       <small><a href="<%=contextPath%>/adLogout.aus" id="log">로그아웃</a></small>
                       <a href="<%=contextPath%>" ><i class="fas fa-home" class="hov"></i></a>  <!--사용자 메인페이지-->
               
                  <%} else {%>
                    <div>
                    <!-- 로그인 전 -->
                        <a id="welcome" >Welcome</a>
                        <small><a href="<%=contextPath%>/loginForm.aus" id="log">로그인</a></small>
                        <a href="<%=contextPath%>" ><i class="fas fa-home" class="hov"></i></a>  <!--사용자 메인페이지--></div>
                  <% } %>

                   <!-- 사용자 메인페이지로 돌아감 -->
                    
            </span>
        </div>
    



        <div id="content">

             <!--왼쪽 공통메뉴-->
             <div id="content_1">
                
                <div class="content_1_1">
                    <h2>회원관리</h2>
                    <div><a href="<%=contextPath%>/userListView.aus?currentPage=1">전체 회원 조회 </a></div>
                    <br>
                </div>

                <div class="content_1_2">
                    <h2>게시물관리</h2>
                    <div><a href="<%=contextPath%>/htList.aht?currentPage=1">HomeTraining</a></div> 
                    <div><a href="<%=contextPath%>/info.ad?currentPage=1">Info&Tip</a></div> 
                    <br>
                </div>

                <div class="content_1_3">
                    <h2>고객센터</h2>
                    <div><a href="<%=contextPath%>/ctNotice.ad?currentPage=1">공지사항</a></div> 
                    <div><a href="<%=contextPath%>/ctFaqList.ad?currentPage=1&ctg=top">FAQ</a></div> 
                    <div><a href="<%=contextPath%>/ctQuery.ad?currentPage=1">1:1문의</a></div> 
                    <br>
                </div>

            </div>

            <div id="line"></div>



            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>Daily Routine</h2>
                </div>

                <hr style="border:1px solid gray">


            <!-- content -->
                <div id="content_2_2">
                    <p style="color:white">Daily Routine 관리자 페이지에 오신 것을 환영합니다. <br>
                    </p>
                </div>
           


            <div id="content_3">

                <div class="content_3_1">
                    <a href="<%=contextPath%>userListView.aus?currentPage=1"><div id="user" ></a>
                        <h2>회원</h2>
                        <div>
                            <h3>전체회원조회</h3></a>
                            <h3>회원 탈퇴처리</h3>
                        </div>
                    </div>
                    <div id="center">
                        <h2>고객센터</h2>
                        <h3>공지사항</h3>
                        <h3>FAQ</h3>
                        <h3>1:1문의</h3>
                    </div>
                </div>

                <div class="content_3_2">
                    <div id="post">
                        <h2>게시물 관리</h2>

                        <div id="ht">
                            <h3>HomeTraining</h3>

                        </div>

                        <div id="it">
                            <h3>Info&Tip</h3>
                        </div>
                        
                       
                        
                    </div>
                </div>
                
            </div>

        </div>

    </div>
</div>

</body>
</html>