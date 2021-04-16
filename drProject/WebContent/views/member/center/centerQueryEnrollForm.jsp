<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    div{
        box-sizing:border-box
    }
    .wrap{
        width: 1000px;
        height: 800px;
        margin: auto;
    }
    .wrap>div{
        width: 100%;
    }
    
    #content{height: 100%; width: 100%;}
    
    #content>div{
        height: 100%;
        float: left;
    }

    #content_1{width: 15%;}
    #content_2{width: 80%; margin-left: 15px;}
    #line{width: 1%;}

    #line {
        border: 1px solid gray;
        width: 0.1px;
        height: 150px;
    }

    

    #content_2_1{height: 3%;}
    #content_2_2{height: 10%;}
    #content_2_3{height: 10%;}
    #content_2_4{height: 77%;}
    


    #upperIcon{
        border:1px solid black;
        width:150px;
        display:inline-block;
        margin:10px;
        cursor: pointer;
    }

    .searchArea{
        margin: auto;
        background: lightgray;
        height: 50px;
        width: 600px;
    }
    
   
    .underLine {
        border: 1px solid gray;
        width: 0.1px;
        width: 150px;
        }

    .queryArea{
        height: 90%;
        width: 100%;
    }

    .queryArea>form>table{
        margin: auto;
        width: 500px;
        height: 400px;
    }
    

</style>
</head>

<%@ include file="../../common/menubar.jsp"%>
<body>
<div class="wrap">
    <div id="content">
    
        <!--왼쪽 공통메뉴-->
        <div id="content_1">
            <h1><a href="<%=contextPath%>/main.ct">고객센터</a></h1>
            <div class="leftMenu">
                <div><a href="<%=contextPath%>/faqList.ct">FAQ 자주찾는 질문</a></div>
                <br>
                <div><a href="<%=contextPath%>/enrollQuery.ct">1:1 문의</a></div>
                <br>
                <div><a href="<%=contextPath%>/queryList.ct">나의 문의 내역</a></div>
                <br>
                <div><a href="<%=contextPath%>/notice.ct">공지사항</a></div>
            
            </div>
        </div>
        
        <div id="line"></div>
        
        <!--버튼-->
        <div id="content_2">
            <div id="content_2_1">고객센터 HOME > 1:1 문의</div>

            <div id="content_2_2">
                <div class="iconArea">
                    <div id="upperIcon">
                        <img src="../../resources/images/faq.JPG" width="180">
                    </div>
                    <div id="upperIcon">
                        <img src="../../resources/images/11.JPG" width="180">
                    </div>
                    <div id="upperIcon">
                        <img src="../../resources/images/my.JPG" width="180">
                    </div>
                    <div id="upperIcon">
                        <img src="../../resources/images/notice.JPG" width="180">
                    </div>
                </div>
            </div>
                

            <!--관리자에게 문의하기-->
            <!--로그인한 사용자만 볼수있도록 만들어야지-->
            <div id="content_2_3">    
                <p><h3>1:1 문의하기</h3></p>
                <div class="underLine"></div>
            </div>


            <!--문의입력-->
            <div id="content_2_4">
                
                <div class="queryArea">
                    <form id="enrollQueryFrorm" action="<%= contextPath %>/insertQuery.ct" method="post">
                    
                        <table border="1">
                            <tr>
                                <th>문의유형</th>
                                <td>
                                    <select name="qCategory" id="qCategory" required style="width: 100%;">
                                        <option>선택해주세요</option>
                                        <option name="qCategory" id="qCategory" value="회원정보" >회원정보</option>
                                        <option name="qCategory" id="qCategory" value="게시글">게시글/댓글</option>
                                        <option name="qCategory" id="qCategory" value="신고">신고</option>
                                        <option name="qCategory" id="qCategory" value="기타문의">기타문의</option>
                                    </select>
                                    

                                </td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="qtitle" placeholder="제목을 입력해주세요" style="width: 100%;" required></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                    <div>
                                        <textarea id="qContent" name="qContent" style="width: 100%;" rows="10" style="resize: none;" placeholder="궁금하신 내용을 입력하세요 (300자 이내)"></textarea>
                                        <br>
                                    </div>
                                    <span id="count" name="count">0</span> / 300
                            </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <button type="submit">등록</button>
                                    <button type="reset">취소</button>
                                </td>
                            </tr>


                        </table>

                                <script>
                                    $(function(){
                                        $("#qContent").keyup(function(){
                                            var inputlength = $(this).val().length;
                                            $("#count").text(inputlength);
                                        })
                                    })
                                </script>

                    </form>
                </div>
            </div>

            

        </div>
    </div>
</div>

</body>
</html>