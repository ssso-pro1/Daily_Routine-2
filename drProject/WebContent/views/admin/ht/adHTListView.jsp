<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ht게시글 리스트 조회</title>
    <style>
        table *{
            text-align: center;
        }
        /* #content_2{
            background:rgb(33, 33, 34);
        } */
        .outer{
            width:800px;
            height:500px;
            background:rgb(33, 33, 34);
            margin:auto;
            /* margin-top:10px; */
            padding-top:70px;
        }

        .listArea{
            border:1px solid gray;
            text-align:center;
            color:white;
        }
        .listArea>tbody>tr:hover{
            background:gray;
            
            cursor:pointer;
        }

    </style>
</head>
<body>
     <!-- content -->
     <div id="content_2">

        <!-- 상단 타이틀 -->
        <div id="content2_1">
            <h2>게시물 관리 > HomeTraining</h2>
        </div>

        <hr style="border:1px solid gray">
        <br><br>

     </div>
     <br><br>

     <div class="outer">
         <!-- 관리자 로그인시 보여짐  -->
        <div align="right" style="width:750px">
            <button>글작성</button>
            <br><br>
        </div>

        <table class="listArea" align="center">
                <thead>
                    <tr>
                        <th width="60">글번호</th>
                        <th width="60">카테고리</th>
                        <th width="300">제목</th>
                        <th width="100">작성자</th>
                        <th width="100">작성일</th>
                        <th width="60">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>전신</td>
                        <td>10분안에 끝내는 상쾌한 스트레칭</td>
                        <td>리자1</td>
                        <td>2018-01-01</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>코어</td>
                        <td>가볍게 즐기는 맨몸운동</td>
                        <td>리자1</td>
                        <td>2019-02-03</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>상체</td>
                        <td>10분안에 끝내는 상쾌한 스트레칭</td>
                        <td>리자1</td>
                        <td>2018-01-01</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>하체</td>
                        <td>가볍게 즐기는 맨몸운동</td>
                        <td>리자1</td>
                        <td>2019-02-03</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>스트레칭</td>
                        <td>10분안에 끝내는 상쾌한 스트레칭</td>
                        <td>리자1</td>
                        <td>2018-01-01</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>코어</td>
                        <td>가볍게 즐기는 맨몸운동</td>
                        <td>리자1</td>
                        <td>2019-02-03</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>코어</td>
                        <td>10분안에 끝내는 상쾌한 스트레칭</td>
                        <td>리자1</td>
                        <td>2018-01-01</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>코어</td>
                        <td>가볍게 즐기는 맨몸운동</td>
                        <td>리자1</td>
                        <td>2019-02-03</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>코어</td>
                        <td>10분안에 끝내는 상쾌한 스트레칭</td>
                        <td>리자1</td>
                        <td>2018-01-01</td>
                        <td>10</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>코어</td>
                        <td>가볍게 즐기는 맨몸운동</td>
                        <td>리자1</td>
                        <td>2019-02-03</td>
                        <td>10</td>
                    </tr>
                </tbody>
        </table>
         <br>

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