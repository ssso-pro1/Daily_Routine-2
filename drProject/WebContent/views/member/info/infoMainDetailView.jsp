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
    #line{width:1%;}

    #line{
        border:1px solid gray;
        width:0.1px;
        height:150px;
    }

    #content_2_1{height:15%;}
    #content_2_2{height:80%; width:100%; margin-left:48px;}

    .detailArea{
        width:100%;
        height:100%;
    }
    table{
        width:100%;
        border:1px solid black;
        border-top:1px solid black;
        border-collapse:collapse;
    }   
    
    .detailArea>table>tr,td{
        border-bottom: 1px solid black;
        border:1px solid black;
    }
    p{
        text-align:center;
    }

    #buttonArea>button{
        background:rgb(250, 214, 9);
        color:white;
        border:rgb(250, 214, 9);
    }
    div>button{
        cursor:pointer;
    }
    .leftMenu>#menu1>a{
    	color:rgb(250, 214, 9);
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
                    <div id="menu1"><a href="<%=contextPath%>/total.in">전체</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/workout.in">운동 정보</a></div>
                    <br>
                    <div><a href="<%=contextPath%>/menu.in">식단 정보</a></div>
                </div>
            </div>

            <div id="line"></div>


            <!-- 인포앤팁 게시글 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>Info & Tip > 전체 </h2>
                    <hr>
                    <p style="text-align:left;">Daily Routine에서 제공하는 다양한 Info & Tip을 소개합니다.</p>
                </div>
                <br>

                <!-- 게시글 세부 영역 -->
                <div id="content_2_2">
                    <div class="detailArea">
                        <table border="0">
                            <tr style="font-size:25px;">
                                <th width="800">전체</th>
                            </tr>
                            <tr>
                                <td height="280">
                                    <div align="center">
                                        <img src="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td height="200"> 
                                    <p>
                                        <b style="font-size:15px;">전체 정보</b> <br><br>
                                        * 추천 대상 <br>
                                        * 추천 대상 <br>
                                        * 추천 대상 <br><br><br>
                                        
                                        <b style="font-size:15px;""># 정보 내용 </b> <br><br>
                                        정보 내용 설명 <br>
                                        정보 내용 설명 <br>
                                        정보 내용 설명 <br>
                                        정보 내용 설명 <br>
                                        정보 내용 설명 <br><br>
                                    </p>
                                </td>
                            </tr>
                        </table>
                        <br>
                    </div>
                </div>

                <!-- 게시글 버튼 영역 -->
                <div id="buttonArea" align="right">
                    <button>글 목록</button>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
