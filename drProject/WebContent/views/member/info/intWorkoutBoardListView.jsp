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
        height:8000px;
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

    #content{width:100%;}

    #content>div{
        height:100%;
        float:left;
    }

    #content_1{width:15%;}
    #content_2{width:80%; margin-left:25px;}
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }

    #content_2_2{height:10%; width:100%;}

    .listArea{
        width:700px;
        margin:auto;
    }

    .tipcategory{
        width:200px;
        height:1px;
    }
    .thumbnail{
        border:1px solid black;
        width:200px;
        display:inline-block;
        margin:10px;
    }
    .searchArea>button{
        background:rgb(250, 214, 9);
        color:white;
        border:rgb(250, 214, 9);
    }
    .searchArea{
        float: right;
        margin-right: 95px;
    }
    .pagingArea{
        width: 300px;
        display: inline-block;
        margin-left: 250px;
    }
    .btn{
        width: 100px;
        text-align: right;
        float: right;
        margin-right:100px;
    }
    div>button{
        cursor:pointer;
    }
</style>
<body>
    
    <%@ include file="../../common/menubar.jsp"%>


    <div class="wrap">
        
        <div id="content">

            <!-- 왼쪽 공통메뉴 -->
            <div id="content_1">
                <h1>Info & Tip</h1><br>
                <div class="leftMenu">
                    <div><a href="<%=contextPath%>/total.in">전체</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/workoutRT.in">운동 루틴</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/workout.in">운동 정보</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/menu.in">식단 정보</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/etc.in">기타 팁</a></div>
                </div>
            </div>

            <div id="line"></div>


            <!-- 게시글 목록 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>Info & Tip > 운동 정보</h2>
                    <hr>
                    <p>Daily Routine에서 제공하는 다양한 운동 정보를 참고해보세요!</p>
                </div><br>


                <!-- 게시글 목록 카테고리 & 검색 버튼 -->
                <div id="content_2_2">
                    <div class="tipcategory" style="margin-left:60px">
                        <select name="category">
                            <option value="upload">업로드순</option>
                            <option value="like">좋아요순</option>
                            <option value="view">조회수순</option>
                        </select>
                    </div>
                    <div align="center" class="searchArea">
                        <input type="text">
                        <button>검색</button> 
                    </div><br><br>
                </div>


                <!-- 게시글 목록 테이블-->
                <div id="content_2_3">
                    <div class="listArea">
                        <div class="thumbnail" align="center">
                            <img src="" width="200" height="150">
                            <p>
                                운동 정보 1 <br>
                                조회수 : 20 좋아요 : 150 <br>
                                2020-04-20
                            </p>
                        </div>
                        <div class="thumbnail" align="center">
                            <img src="" width="200" height="150">
                            <p>
                                운동 정보 1 <br>
                                조회수 : 20 좋아요 : 150 <br>
                                2020-04-20
                            </p>
                        </div>
                        <div class="thumbnail" align="center">
                            <img src="" width="200" height="150">
                            <p>
                                운동 정보 1 <br>
                                조회수 : 20 좋아요 : 150 <br>
                                2020-04-20
                            </p>
                        </div>
                        <div class="thumbnail" align="center">
                            <img src="" width="200" height="150">
                            <p>
                                운동 정보 1 <br>
                                조회수 : 20 좋아요 : 150 <br>
                                2020-04-20
                            </p>
                        </div>
                        <div class="thumbnail" align="center">
                            <img src="" width="200" height="150">
                            <p>
                                운동 정보 1 <br>
                                조회수 : 20 좋아요 : 150 <br>
                                2020-04-20
                            </p>
                        </div>
                        <div class="thumbnail" align="center">
                            <img src="" width="200" height="150">
                            <p>
                                운동 정보 1 <br>
                                조회수 : 20 좋아요 : 150 <br>
                                2020-04-20
                            </p>
                        </div>
                    </div><br>
                </div>

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
               
               <div align="right" class="btn">
                   <!-- 관리자만 사용할 수 있는 버튼 -->
                    <button 
                        style="background-color:rgb(250, 214, 9); border:rgb(250, 214, 9); color:white;" >글쓰기
                    </button>
               </div><br><br>
               

            </div>   
            
            
        </div>      
    </div>
</body>
</html>