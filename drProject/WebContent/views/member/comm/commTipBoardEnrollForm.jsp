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
        box-sizing:border-box
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
    #content_2_2{height:70%; margin-left:48px;}
    
    #enrollForm input, #enrollForm textarea{
        width:100%;
        box-sizing:border-box;
    }
    .enrollArea{
        right:500px;
    }
    .enrollButton>button{
        background:hsl(46, 77%, 50%);
        color:white;
        border:hsl(46, 77%, 50%);
    }
    div>button{
        cursor:pointer;
    }
</style>

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

            
            <!-- 게시글 작성 -->
            <div id="content_2">

                <!-- 상단 타이틀 -->
                <div id="content_2_1">
                    <h2>커뮤니티 > 나만의 운동 Tip!</h2>
                    <hr>
                    <p>Daily Routine에서 나만의 식단과 운동 tip을 함께 공유해보세요!</p>
                </div><br>


                <!-- 게시글 작성 폼 -->
                <div id="content_2_2">
                    <div class="enrollArea">
                       <form action="" id="enrollForm" method="post" enctype="multipart/form-data">
                            <table>
                                <tr>
                                    <td width="700" height="30">
                                        <input type="text" name="title" placeholder="제목을 입력해주세요." required>
                                    </td> 
                                </tr>
                                <tr>
                                    <table>
                                        <tr>
                                            <td width="700" height="30">
                                                <input type="text" name="title" value="게시글 제목" required>
                                            </td> 
                                        </tr>
                                        <tr>
                                            <table>
                                                <tr>
                                                    <td width="800" height="30">
                                                        <input type="file" name="upfile" style="cursor:pointer;">
                                                        <input type="file" name="upfile" style="cursor:pointer;">
                                                    </td>
                                                    <td>
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button><br>
                                                        <button style="cursor:pointer; background-color:rgb(250, 214, 9);">-</button>
                                                    </td>
                                                </tr>
                                            </table><br>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="500">
                                                <textarea name="content" rows="20" style="resize:none" required>게시글 내용</textarea>   
                                            </td>
                                        </tr>
                                    </table>
                                </tr>
                            </table>
                            <br><br>
                        </form>

                    <div align="right" class="enrollButton">
                        <button>등록</button>
                        <button>취소</button>
                    </div>
                    
                    </div>
                </div>

            </div>


        </div> 
    </div>
</body>
</html>