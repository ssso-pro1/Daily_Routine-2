<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div{
        box-sizing:border-box;
    }
    .wrap{
        width:1000px;
        height:800px;
        margin:auto;
        margin-top:15px;
    }
    .wrap>div{
        width:100%;
    }

    a{
        text-decoration:none;
        color:black;
        font-size:18px;
        font-weight:bold;
    }
    a:hover{color:rgb(250, 214, 9);}

    #content{height:100%; width:100%;}

    #content>div{
        height:100%;
        float:left;
    }

    #content_1{width:15%;}
    #content_2{width:80%; margin-left:25px;}
    .line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px; 
    }

    #content_2_1{height:15%;}
    #content_2_2{height:80%; margin-left:48px;}

    .listArea{
        border:1px solid gray;
        text-align:center;
        margin-left:50px;
    }
    .listArea>tbody>tr:hover{
        background:lightgray;
        cursor:pointer;
    }
    .listArea>thead>tr{
        background:lightgray;
    }
    .listArea>tr,th,td{
        height:30px;
    }
    .searchArea>button{
        background:hsl(46, 77%, 50%);
        color:white;
        border:hsl(46, 77%, 50%);
    }
    div>button{
        cursor:pointer;
    }

    .pagingArea, .searchArea{
        margin-left:120px;
    }
</style>
<body>
    
   <%@ include file="../../common/menubar.jsp"%>
	

    <div class="wrap">

        <div id="content">

            <!--왼쪽 공통메뉴-->
            <div id="content_1">
                <h1>커뮤니티</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/workoutTip.co">나만의 운동 Tip!</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/free.co">자유게시판</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/question.co">질문게시판</a></div>
                </div>
            </div>

            <div id="line"></div>

            <!-- 게시판 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀-->
                <div id="content2_1">
                    <h2>커뮤니티 > 질문게시판</h2>
                    <hr>
                    <p>운동에 관한 모든 것들! 질문 게시판에서 함께 공유해봐요!</p>
                </div>
                <br><br><br>
                
                <!-- 게시판 목록 테이블 -->
                <div id="content2_2">
                    <table align="center" class="listArea">
                        <thead>
                            <tr>
                                <th width="100" style="color:red;">[공지]</th>
                                <th width="400" style="color:hsl(46, 77%, 50%);">회원 간 비방과 욕설은 삼가주세요</th>
                                <th width="150">관리자</th>
                                <th width="150">2020-03-25</th>
                                <th width="100">조회수 : 30</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>게시글 제목</td>
                                <td>작성자</td>
                                <td>2021-03-22</td>
                                <td>조회수 : 55</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br><br>

                <!-- 클릭했을때 바탕색이 노란색으로 변경되는 버튼 -->
                <!-- 1을 누르면 "<"이 안보이고 마지막 숫자버튼을 누르면 ">"이 안보이도록 조건 처리해야 함-->
                <div align="center" class="pagingArea">
                    <button><</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>></button>
                </div>
                <br><br>
            
                <div align="center" class="searchArea">
                    <input type="text">
                    <button>검색</button> 

                    <!-- 회원일 경우에만 보이는 버튼 -->
                    <button>글쓰기</button>
                </div>
                <br><br>
            </div>

        </div>
    </div>


</body>
</html>