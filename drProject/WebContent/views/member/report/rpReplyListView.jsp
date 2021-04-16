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
       <h2>신고관리 > 전체 신고 보기</h2>
       <hr>
       <br><br><br>
        
        </div>
       <br><br>
       <form action="">
            <div class="buttons">
                <button >게시글</button>
                <button>댓글</button>
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
                            <th width="120">신고자</th>
                            <th width="120">피신고자</th>
                            <th width="110">분류</th>
                            <th width="300">게시글 제목</th>
                            <th width="150">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user04</td>
                            <td>user03</td>
                            <td>욕설</td>
                            <td>운동 실헝</td>
                            <td>2021-02-26</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user11</td>
                            <td>user05</td>
                            <td>음란성</td>
                            <td>이 게시글에는 ..</td>
                            <td>2021-02-25</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-24</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-23</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-22</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-21</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-21</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-20</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-19</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-19</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-18</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-16</td>
                        </tr>
                    </tbody>
            </table>
            
        </form>

       <br>
       <div class="reportCheck">
          <button>신고확인</button>
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