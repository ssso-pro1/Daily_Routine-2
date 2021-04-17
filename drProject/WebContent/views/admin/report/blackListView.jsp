<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/drProject/WebContent/resources/css/reListView.css" type="text/css" rel="stylesheat">
<style>
    #stopBtn{
        border:1px solid orangered;
        background-color:orangered;
        color: white;
        cursor: pointer;
    }
    #rpList{
        border: 1px solid #4375DB;
        background-color: #4375DB;
        color: white;
        cursor: pointer;
    }
    #susList:hover{
        border: 1px solid #4375DB;
        background-color: #4375DB;
        color: white;
        cursor: pointer;
    }
    #susList{
        border: 1px solid #3DB7CC;
        background-color: #3DB7CC;
        color: white;
    }
</style>
<title>Insert title here</title>
</head> 
<body>

    <div class="outer">
        <div id="nav">
            <span align="left">Admin Center</span>

            <span>
                <!-- 로그인 전 -->
                <i class="fas fa-user-circle"></i>
                <span align="right" >Welcome님</span>
                <!-- <i class="fas fa-bars"></i> -->
                <a href=""><i class="fas fa-home"></i></a> <!-- 오븐에는 메뉴바로 돼있는데, 저희 왼쪽에 메뉴바가 있어서 홈으로 가는 기능으로 바꾸면 좋을 것 같아서 넣었어요!-->

                <!-- 로그인 후
                <div>admin01님</div> -->
            </span>
        </div>
       <br>
       <div id="title">
       
       <div id="content">

        <!--왼쪽 공통메뉴-->
       <div id="content_1">
           
           <div class="content_1_1">
               <h2>회원관리</h2>
               <div><a href="">회원 정보 관리</a></div>
               <br>
           </div>

           <div class="content_1_2">
               <h2>게시물관리</h2>
               <div><a href="">HomeTraining</a></div> 
               <div><a href="">Info&Tip</a></div> 
               <br>
           </div>

           <div class="content_1_3">
               <h2>고객센터</h2>
               <div><a href="">공지사항</a></div> 
               <div><a href="">FAQ</a></div> 
               <div><a href="">1:1문의</a></div> 
               <br>
           </div>

           <div class="content_1_4">
               <h2 style="color: white;">신고관리</h2>
               <div><a href="">전체신고보기</a></div> 
               <div><a href="" style="color: white;">블랙리스트</a></div> 
           </div>
           
       </div>
    <div id="line"></div>
       



       <!-- content -->
       <div id="content_2">

           <!-- 상단 타이틀 -->
           <div id="content2_1">
               <h2>신고관리 > 전체 신고 보기</h2>
           </div>

           <hr style="border:1px solid gray">
           <br><br>

        </div>
        <br><br>
        <form action="">
            <div class="buttons">
                <button id="rpList">신고된 회원</button>
                <button id="susList">활동 정지 회원</button>
            </div>
            <div align="right" class="searchArea">
                <button>검색</button> 
                <input type="text">
            </div>
            <br>
            <table class="listArea" align="center">
                    <thead>
                        <tr>
                            <th width="53">check</th>
                            <th width="360">아이디</th>
                            <th width="300">누적된 신고수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>1</td>
                        </tr>
                    </tbody>
            </table>
            <br>
            <div class="reportCheck">
               <button id="stopBtn">정지해제</button>
            </div> 
        </form>
            


       <br>
       
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
       

    </div>
</body>
</html>