<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   .wrap{
		width:1000px;
		height:800px;
		margin:auto;
	}
    .outer{
        width:800px;
        height:550px;
        margin:auto;
        margin-top:50px;
    }
    .listArea{
        width:800px;
        margin:auto;
    }
    .thumbnail{
        border:1px solid black;
        width:230px;
        display:inline-block;
        margin:10px;
    }
    .tipcategory{
        width: 200px;
        display: inline-block;
    }
    .searchArea{
        float: right;
        margin-right: 45px;
    }
    .searchArea>button{
        background:hsl(46, 77%, 50%);
        color:white;
        border:hsl(46, 77%, 50%);
    }
    .pagingArea{
        width: 300px;
        display: inline-block;
        margin-left: 235px;
    }
    .btn{
        width: 100px;
        text-align: right;
        float: right;
        margin-right:46px;
    }
</style>
<body>
    <%@ include file="../../common/menubar.jsp" %>
    <div class="wrap">
	    <div class="outer">
	        <br>
	        <h2>Home Training > 복부 </h2>
	        <hr>
	        <p>홈트레이닝 복부 운동 게시물 조회</p>
	        <br><br>
	        <div class="tipcategory" style="margin-left:10px">
	            <select name="category">
	                <option value="upload">업로드순</option>
	                <option value="like">좋아요순</option>
	                <option value="view">조회수순</option>
	            </select>
	        </div>
	        <div align="center" class="searchArea">
	            <input type="text">
	            <button>검색</button> 
	           </div>
	        <br><br>
	
	        <div class="listArea">
	            <div class="thumbnail" align="center">
	                <img src="" width="230" height="150">
	                <p>
	                    초보자를 위한 트레이닝<br>
	                    조회수 : 20 좋아요 : 150 <br>
	                    2020-04-20
	                </p>
	            </div>
	            <div class="thumbnail" align="center">
	                <img src="" width="230" height="150">
	                <p>
	                    30분 복부 운동 <br>
	                    조회수 : 20 좋아요 : 150 <br>
	                    2020-04-20
	                </p>
	            </div>
	            <div class="thumbnail" align="center">
	                <img src="" width="230" height="150">
	                <p>
	                    7분 스트레칭 <br>
	                    조회수 : 20 좋아요 : 150 <br>
	                    2020-04-20
	                </p>
	            </div>
	            <div class="thumbnail" align="center">
	                <img src="" width="230" height="150">
	                <p>
	                    15분 힙업 운동 <br>
	                    조회수 : 20 좋아요 : 150 <br>
	                    2020-04-20
	                </p>
	            </div>
	            <div class="thumbnail" align="center">
	                <img src="" width="230" height="150">
	                <p>
	                    복부 지방 태우기<br>
	                    조회수 : 20 좋아요 : 150 <br>
	                    2020-04-20
	                </p>
	            </div>
	            <div class="thumbnail" align="center">
	                <img src="" width="230" height="150">
	                <p>
	                   10분 몸풀기<br>
	                    조회수 : 20 좋아요 : 150 <br>
	                    2020-04-20
	                </p>
	            </div>
	        </div>
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
	       <div class="btn">
	           <!-- 관리자만 사용할 수 있는 버튼 -->
	            <button>글쓰기</button>
	       </div>
	       
	
	       <br><br>
	       
	
	    </div>
	</div>
</body>
</html>