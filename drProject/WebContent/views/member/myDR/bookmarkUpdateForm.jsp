<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 630px;
        height: 800px;
        margin: auto;
    }
    .listArea{
        border: 1px solid black;
        width: 100%;
        height: 100%;
    }
    .thumbnail{
        display: inline-block;
        margin-top: 30px;
        margin-left: 18px;
        
    }
    .thumbnail p{
        width: 250px;
        text-align: left;
        margin-left: 30px;
    }
    .check{
        width: 30px;
        float: left;
    }
    .pagingArea{
        width: 300px;
        display: inline-block;
        margin-left: 175px;
    }
    .Btns{
        width: 130px;
        text-align: right;
        float: right;
    }

</style>
</head>
<body>
    <div class="outer">
        <button>북마크 보관함</button>
        <div class="listArea">
            <div class="thumbnail" align="center">
                <!-- 수정버튼 눌러야 등장 -->
                <div class="check">
                    <input type="checkbox">
                </div>
                <img src="" width="250" height="150">
                <p>
                    초보자를 위한 운동 tip! <br>
                    조회수 : 20 좋아요 : 150 <br>
                    2020-04-20
                </p>
            </div>
            <div class="thumbnail" align="center">
                <div class="check">
                    <input type="checkbox">
                </div>
                <img src="" width="250" height="150">
                <p>
                    초보자를 위한 운동 tip! <br>
                    조회수 : 20 좋아요 : 150 <br>
                    2020-04-20
                </p>  
            </div>
            <div class="thumbnail" align="center">
                <div class="check">
                    <input type="checkbox">
                </div>
                <img src="" width="250" height="150">
                <p>
                    초보자를 위한 운동 tip! <br>
                    조회수 : 20 좋아요 : 150 <br>
                    2020-04-20
                </p>
            </div>
            <div class="thumbnail" align="center">
                <div class="check">
                    <input type="checkbox">
                </div>
                <img src="" width="250" height="150">
                <p>
                    초보자를 위한 운동 tip! <br>
                    조회수 : 20 좋아요 : 150 <br>
                    2020-04-20
                </p>  
            </div><div class="thumbnail" align="center">
                <div class="check">
                    <input type="checkbox">
                </div>
                <img src="" width="250" height="150">
                <p>
                    초보자를 위한 운동 tip! <br>
                    조회수 : 20 좋아요 : 150 <br>
                    2020-04-20
                </p>
            </div>
            <div class="thumbnail" align="center">
                <div class="check">
                    <input type="checkbox">
                </div>
                <img src="" width="250" height="150">
                <p>
                    초보자를 위한 운동 tip! <br>
                    조회수 : 20 좋아요 : 150 <br>
                    2020-04-20
                </p>  
            </div>            
        </div>
       
        <br>

        <div align="center" class="pagingArea">
            <button><</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>></button>
       </div>
       <div class="Btns">
           <button>삭제</button>
           <button>수정완료</button>
       </div>
    </div>
</body>
</html>
