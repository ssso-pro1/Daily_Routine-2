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
    #content_2_4{height: 72%;}
    #content_2_5{height: 5%;}
    


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

    
    
    .queryList{
        background :rgb(241, 236, 229);
        width: 100%;
        height: 40px;
        line-height: 30px;
        border: 1px solid;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
        }

    .queryContent{
        width: 100%;
        height: 100px;
        border:1px solid lightgray;
        margin-top: 5px;
        padding: 10px;
        box-sizing: border-box;
        border-radius: 5px;
        display: none;
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
            <div id="content_2_1">고객센터 HOME > 나의 문의내역</div>

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
                

            <!--나의 문의내역-->
            <div id="content_2_3">    
                <p><h3>나의 문의 내역</h3></p>
                <div class="underLine"></div>
            </div>

            <!--나의 문의내역 리스트-->
            <div id="content_2_4">    
                <div class="queryListArea" style="width: 95%; margin: auto;">
                    <!-- 문의내역이 없을경우-->
                    <!--
                    <div align="center">
                        <p style="color: crimson; font-weight: bolder; font-size: 20px;">1:1 문의 내역이 없습니다</p>
                        <button>1:1 문의 하기</button>

                    </div>
                    -->

                    
                    
                    <!-- 문의 내역이 있을경우-->
                    
                    <div class="queryList">
                        <label id="queryTitle">문의1</label>
                        <label style="float: right;" id="queryDate">2021-04-15</label>
                    </div>
                    <div class="queryContent">
                        <p>내용</p>
                        <button style="float: right;">삭제하기</button>
                    </div>


                    <div class="queryList">
                        <label id="queryTitle">문의2</label>
                        <label style="float: right;" id="queryDate">2021-04-01</label>
                    </div>
                    <div class="queryContent">
                        <p>내용</p>
                        <button style="float: right;">삭제하기</button>
                    </div>

                    <div class="queryList">
                        <label id="queryTitle">문의3</label>
                        <label style="float: right;" id="queryDate">2021-04-01</label>
                    </div>
                    <div class="queryContent">
                        <p>내용</p>
                        <button style="float: right;">삭제하기</button>
                    </div>
                </div>

                <script>
                    $(function(){
                        $(".queryList").click(function(){
            
                            // slideDown 또는 slideUp 시킬 p요소
                            var $queryContent = $(this).next(); // jQuery방식으로 선택한 요소를 담아둘 때 변수명 앞에 $
            
                            if($queryContent.css("display") == "none"){
                                 $(this).siblings(".queryContent").slideUp();
                                 $queryContent.slideDown();// 보여지게
            
                            }else{
                                $queryContent.slideUp(); // 사라지게
                            }
                               
                        })
                    })
                </script>

            </div> 

            <!--맨 아래 페이징 (고정하지말고 유연하게로 바꾸기)-->
            <div id="content_2_5">    
                <div align="center" class="pagingArea">
                    <button><</button>
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                    <button>4</button>
                    <button>5</button>
                    <button>></button>
                </div>
            </div>   
             
        </div>

    </div>
</div>

</body>
</html>