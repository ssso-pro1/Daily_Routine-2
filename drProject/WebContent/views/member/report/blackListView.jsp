<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .outer{
        width:800px;
        height:550px;
        margin:auto;
        margin-top:50px;
    }
    #title{
        margin-left:25px;
    }
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
    .buttons{
        width:300px;
        margin-left: 50px;
        display: inline-block
    }
    .searchArea{
        width:300px;
        float: right
        }
    .reportCheck{
        width:100px;
        text-align: right;
        float:right;
    }
    .pagingArea{
        width: 500px;
        margin: auto;
    }
</style>
<body>

    <div class="outer">
       <br>
       <div id="title">
       <h2>신고관리 > 블랙리스트</h2>
       <hr>
       <br><br><br>
        
        </div>
       <br><br>
       <form action="">
            <div class="buttons">
                <button >신고된 회원</button>
                <button>활동 정지 회원</button>
            </div>
            <div align="right" class="searchArea">
                <button>검색</button> 
                <input type="text">
            </div>
            <br>
            <table class="listArea" align="center">
                <thead>
                    <tr>
                        <th width="80">check</th>
                        <th width="160">아이디</th>
                        <th width="230">활동 정지일</th>
                        <th width="160">기간(일)</th>
                        <th width="100">누적된 신고수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>user01</td>
                        <td>2021-02-28</td>
                        <td>300</td>
                        <td>1</td>
                    </tr>         
                </tbody>
            </table>
            
        </form>

       <br>
       <div class="reportCheck">
          <button>활동정지</button>
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

       <br><br>
       

    </div>
</body>
</html>