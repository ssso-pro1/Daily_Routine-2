<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findID_1</title>
    
     <!-- Latest compiled and minified CSS -->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="../../../resources/css/findIdPwdNavi.css">

<!-- 제일 위의 부트스트랩 넣으면 크기나 여백이 다 바뀜. 근데 버튼하려면 저거 써야함.. 질문 -->

    <style>
        .menuWrap{
            width:1000px;
            margin:auto;

            display:flex;
            justify-content:center;
            }

        .menuWrap>.menu1{
            text-decoration:none;
            color:rgb(250, 214, 9);
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            /* display:block; */
            width:15%;
            height:100%;
            margin:0px 50px;
        }

        .menuWrap>.menu2{
            text-decoration:none;
            color:gray;
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            /* display:block; */
            width:15%;
            height:100%;
            margin:0px 50px;
        }
        

        .outer{
            width:800px;
            height:auto;
            margin:auto;
            margin-top:30px;
            text-align:center;
        }

        .way{
            background :rgb(245, 229, 124);;
            width: 80%;
            height: 40px;
            line-height: 30px;
            text-align:center;
            font-size: 13px;
            font-weight:bold;
            border: 1px solid rgb(255, 248, 208);;
            border-radius: 5px;
            cursor: pointer;
        
        }

        .content{
            width: 80%;
            height: 200px;
            border:1px solid lightgray;
            margin-top: 5px;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 10px;
            display: none;
            
            }

        #content_1{
            margin-top:50px;
            
        }
        #content_2{
            display:block;
            align-items: center;
        }

        #content_2>table{
            margin:0 auto;
        }
        /*  include의 css가 적용돼서 이게 안먹힘.. 질문 */
        .menu2:hover{
            color:rgb(250, 214, 9);
        }
    </style>
</head>
<body>
    
     <%@ include file="../../common/menubar.jsp" %> 
    
    <!-- navi -->
    <div class="menuWrap" align="center">
        <div class="menu1"> <a href="<%=contextPath%>/findID1.us" style="color:rgb(250, 214, 9);"><i class="fas fa-user"> 아이디 찾기</i></a> </div>
        <div class="menu2"> <a href="<%=contextPath%>/findPwd1.us" style="color:gray; "><i class="fas fa-key">비밀번호 찾기</i></a></div>
    </div>
    



    <div class="outer">
        <div id="content_1">
            <h3>아이디 찾기</h3>
            <!-- <hr style="width:300px;"> -->
            <p>아이디 찾는 방법을 선택해주세요.</p>
        </div>
        
        <br>

        
        <div id="content_2" >
            <form action="" class="way1" method="post">
                <div class="way">휴대전화로 인증</div>

                <div class="content">
                    <table>
                        <tr>
                            <th><input type="radio" name="way">휴대전화로 인증 </th><br>
                            <td colspan="2"><small>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</small></td>
                        </tr>
                        <tr>
                            <th align="left">이름</th>
                            <td colspan="2"><input id="name" type="text" placeholder="이름을 입력하세요" required></td>
                        </tr>

                        <tr>
                            <th align="left">휴대전화</th>
                            <td><input id="tel" type="text" placeholder="휴대전화번호" required></td>
                            <td><input type="button" value="인증번호 받기" onclick="send()"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td colspan="2"><input type="text" placeholder="인증번호 6자리 숫자 입력" required></td>
                        </tr>
                    </table>
                </div>
            </form>
                

            <form action="" class="way1" method="post">

                <div class="way">이메일로 인증</div>

                <div class="content">
                    <table>
                            <tr>
                                <th><input type="radio" name="way">이메일로 인증</th><br>
                                <td colspan="2"><small>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</small></td>
                            </tr>

                            <tr>
                                <th align="left">이름</th>
                                <td colspan="2"><input id="name" type="text" placeholder="이름을 입력하세요" ></td>
                            </tr>

                            <tr>
                                <th align="left">이메일</th>
                                <td><input id="email" type="text" placeholder="이메일주소를 입력하세요"></td>
                                <td><input type="button" value="인증번호 받기" onclick="send()"></td>
                            </tr>

                            <tr>
                                <th></th>
                                <td colspan="2"><input type="text" placeholder="인증번호 6자리 숫자 입력"></td>
                            </tr>
                    </table>
                </div>
            </form>
        </div> 


        <br>
        <div align="center">
            <input type="submit" onclick="ID1();" class="btn btn-warning" value="다음" return="false;">
        </div>
        </div>
        




        <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
        
        <!-- input입력안하고 다음 클릭 시 경고창, input에 focus -->
        <script>
            $(function() {
                $("input[type=submit]").click(function() {
                    var result = $("input[type=text]").val();
                    if (!result) {
                    alert("입력하십시오");
                    }
                })
            })





            $(document).ready(function(){

                $("#submit").click(function(){

				if($("#name").val().length==0){ alert("이름을 입력하세요."); $("#name").focus(); return false; }
				if($("#tel").val().length==0){ alert("이메일을 입력하세요."); $("#tel").focus(); return false; }
				if($("#email").val().length==0){ alert("휴대폰번호를 입력하세요."); $("#email").focus(); return false; }
			});
            })

        </script>

        <!--인증번호 알림창/ 다음클릭시 다음단계로 이동-->
        <script>
            function send(){
                alert('인증번호가 발송되었습니다');
            }

            $(function(){

                $(".way").click(function(){

                    var $content = $(this).next(); //next(): 클릭이벤트 발생한 this의 다음요소 $: 안붙여도 되지만 jQuery 방식으로 선택한 요소를 담아둘 때 변수명 앞에 $붙임

                    if($content.css("display") == "none") {    //display속성값이 none일 경우 (안보이는 상태)

                        $(this).siblings(".content").slideUp(); //다른 거 클릭하는 순간, 기존거는 up되면서 열림
                        $content.slideDown();                 //보여지게
                    }else{
                        $content.slideUp();                   //사라지게
                    }
                    
                })
            })


            function ID1(){
                location.href = "<%= request.getContextPath()%>/findID2.us ";
            }
        </script>
        </div>


</body>
</html>

