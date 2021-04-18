<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reListView.css">

<title>Insert title here</title>
<style>
    #rpCheck{
        border: 1px solid orangered;
        background-color: orangered;
        color: white;
        cursor: pointer;
    }
    #postList{
        border: 1px solid #4375DB;
        background-color: #4375DB;
        color: white;
        cursor: pointer;
    }
    #replyList:hover{
        border: 1px solid #4375DB;
        background-color: #4375DB;
        color: white;
    }
    #replyList{
        border: 1px solid #3DB7CC;
        background-color: #3DB7CC;
        color: white;
        cursor: pointer;

    }
</style>
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
               <div><a href="" style="color: white;">전체신고보기</a></div> 
               <div><a href="">블랙리스트</a></div> 
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
       <form action="<%= contextPath %>/ ">
            <div class="buttons">
                <button id="postList">게시글</button>
                <button id="replyList">댓글</button>
            </div>
            <div align="right" class="searchArea">
                <button>검색</button> 
                <input type="text">
            </div>
            <br>
            <table class="listArea" align="center">
                    <thead>
                        <tr>
                            <th width="40">check</th>
                            <th width="95">신고자</th>
                            <th width="95">피신고자</th>
                            <th width="90">분류</th>
                            <th width="260">게시글 제목</th>
                            <th width="120">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user04</td>
                            <td>user03</td>
                            <td>욕설</td>
                            <td>운동 실헝</td>
                            <td>2021-02-26</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user11</td>
                            <td>user05</td>
                            <td>음란성</td>
                            <td>이 게시글에는 ..</td>
                            <td>2021-02-25</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-24</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-23</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-22</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-21</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-21</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-20</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-19</td>
                        </tr>                
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-19</td>
                        </tr>   
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-19</td>
                        </tr>   
                        <tr>
                            <td><input type="checkbox" value="check"></td>
                            <td>user01</td>
                            <td>user02</td>
                            <td>광고성 게시글</td>
                            <td>체중감량 보조제 얌얌얌얌얌..</td>
                            <td>2021-02-19</td>
                        </tr>   
                    </tbody>
            </table>
            <br>
            <div class="reportCheck">
                <button type="submit" id="rpCheck">신고확인</button>
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