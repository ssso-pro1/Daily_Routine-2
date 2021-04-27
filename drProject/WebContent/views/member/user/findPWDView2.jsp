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
            margin:auto;
            margin-left:200px;
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
        <div class="menu1"> <a href="<%=contextPath%>/findID1.us" style="color:gray"><i class="fas fa-user"> 아이디 찾기</i></a> </div>
        <div class="menu2"> <a href="<%=contextPath%>/findPwd1.us" style="color:rgb(250, 214, 9); "><i class="fas fa-key">비밀번호 찾기</i></a></div>
    </div>
    
    



    <div class="outer">
        <div id="content_1">
            <h3>비밀번호 찾기</h3>
            <!-- <hr> -->
            <p>비밀번호 찾는 방법을 선택해주세요.</p>
        </div>
        
        <br>

        
        <div id="content_2" >
            <form action="<%= request.getContextPath()%>/findID2.us" class="way1" method="post" id="test">
                <div class="way">휴대전화로 인증</div>

                <div class="content">
                    <table id="phoneTable">
                        <tr>
                            <th><input type="radio" name="method" id="phoneRa">휴대전화로 인증 </th><br>
                            <td colspan="2"><small>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</small></td>
                        </tr>
                        <tr>
                            <th align="left">이름</th>
                            <td ><input id="name1" type="text" placeholder="이름을 입력하세요" required></td>
                            <td></td>
                        </tr>

                        <tr>
                            <th align="left">휴대전화</th>
                            <td><input id="tel" type="tel" placeholder="휴대전화번호를 입력하세요(-포함)" required></td>
                            <td><input type="button" id="btn1" value="인증번호 받기" onclick="send()"></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td><input type="text" id="num1" placeholder="인증번호 6자리 숫자 입력" required></td>
                            <td><input type="button" id="btn11" value="인증하기" onclick="enter()"></td>

                        </tr>
                    </table>
                </div>
                


                <div class="way">이메일로 인증</div>

                <div class="content">
                    <table id="emailTable">
                            <tr>
                                <th><input type="radio" name="method" id="emailRa">이메일로 인증</th><br>
                                <td colspan="2"><small>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</small></td>
                            </tr>

                            <tr>
                                <th align="left">이름</th>
                                <td><input id="name2 type="text" placeholder="이름을 입력하세요" required></td>
                                <td></td>
                            </tr>

                            <tr>
                                <th align="left">이메일</th>
                                <td><input id="email" type="email" placeholder="이메일주소를 입력하세요" required></td>
                                <td><input type="button" id="btn2" value="인증번호 받기" onclick="send()"></td>
                            </tr>

                            <tr>
                                <th></th>
                                <td><input type="text" id="num2" placeholder="인증번호 6자리 숫자 입력" required></td>
                                <td><input type="button" id="btn22" value="인증하기" onclick="enter()"></td>

                            </tr>
                    </table>
                </div>
            </form>
        </div> 


        <br>
        <div align="center">
            <input type="button" id="next" class="btn btn-warning" value="다음" onclick="return validate();">
        </div>

        <br><br><br><br><br><br><br><br><br>







        <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
        
        <!-- input입력안하고 다음 클릭 시 경고창, input에 focus -->
      
      

        
        <script>
            function enter(){
                    
                    if($("#idNum").val() == ""){
                        alert("인증번호를 입력하세요.")
                        idNum.value = "";
                        idNum.focus();
    
                        return false;
                    }else{
                        alert("확인되었습니다.");
                }
                    
                    
                }
    
            </script>
    
    
    
             <!-- input입력안하고 다음 클릭 시 경고창 -->
             <script>
               
                //다음 버튼 클릭시 각 경우에 따른 input들에 값이 입력되어있지 않을경우 못넘어가게 
        
                   $(function(){ //id="next" 다음으로 가기 버튼 클릭시
        
                        
                        $("#next").click(function(){
                
                /////1. radio 둘 중에 하나 체크 됐을 떄
                            if($("#phoneRa").prop("checked") || $("#emailRa").prop("checked")){
        
                                /// 1) 휴대폰 인증
                                if($("#phoneRa").prop("checked")){
        
                                    // A. 셋중에 한곳이라도 입력이 안되어있을 경우 => 빈칸 입력 alert, focus가게
                                    
                                    if($("#phoneTable #name1").val() == "" || $("#phoneTable input[type=tel]").val() == "" || $("#phoneTable #num1").val() == "") {
                                    
                                        // alert("빈 칸을 입력해주세요."); 세부적으로 요구할지
                                        
                                        if($("#phoneTable #name1").val() == ""){
                                            alert("이름을 입력해주세요.");
                                            $("#phoneTable #name1").focus();
        
                                        } else if ($("#phoneTable input[type=tel]").val() == "" ) {
                                            alert("휴대전화 번호를 형식에 맞게 입력해주세요.");
                                            $("#phoneTable input[type=tel]").focus(); 
                                            //유효성 검사는 (길이/ 숫자, - 포함)
        
                                        }else{
                                            alert("인증번호를 입력해주세요.");
                                            $("#phoneTable #num1").focus();
                                            //유효성 검사 (6자리 아니면 :"휴대전화 인증을 받고 다시 시도해주세요." )
                                        }
        
        
                                    } else{
                                    
                                        // b. 모두 다 기술이 잘 되었을 경우
                                    $("#test").submit();
        
                                } 
        
                                }else{ /// 2) 이메일 인증
        
                                    // a. 셋중에 한곳이라도 입력이 안되어있을 경우
                                    if($("#emailTable #name2").val() == "" || $("#emailTable #email").val() == "" || $("#emailTable #num2").val() == "") {
                                        
                                        //alert("빈 칸을 입력해주세요.");
                                       
                                        if($("#emailTable #name2").val() == ""){
                                            alert("이름을 입력해주세요.");
                                            $("#emailTable #name2").focus();
        
                                        } else if ($("#emailTable #email").val() == "" ) {
                                            alert("이메일을 형식에 맞게 입력해주세요.");
                                            $("#emailTable #email").focus();
        
                                        }else{
                                            alert("인증번호를 입력해주세요.");
                                            $("#emailTable #num2").focus();
                                        }
        
                                    } else{
                                    
                                    // b. 모두 다 기술이 잘 되었을 경우
                                    $("#test").submit();
                                    } 
                                }
        
        
                            }else{
                /////2. radio 체크 안됐을 때
                
                        alert("인증 방법을 체크해주세요.");
                            }
        
                    })
                })
                </script>
    
    
    
    
    
    <!-- 다음 버튼이나 인증번호 받기 클릭시 빈칸 검사 후, 채워지고 나서 유효성 검사 -->
            <script>
                function validate(){
                           // 인증번호 받기 버튼을 눌렀을 때 유효성 검사: 이름(빈칸만 아니면됨), 휴대전화, 이메일, 인증번호
                           var userName = document.getElement("userName");
                           var tel = document.getElementById("tel");
                           var email = document.getElementById("email");
                           var num1 = document.getElementById("num1");
                           var num2 = document.getElementById("num2");
                        
                        // 1) 이름 검사 (한글로만, 2글자 이상)
                            regExp = /^[가-힣]{2,}$/; //{2} : 그냥 2글자
    
                            if(!regExp.test(name2.value) || !regExp.test(name2.value)==""){
                                alert("이름을 확인해주세요");
    
                                name2.value = "";
                                name2.focus();
    
                                return false;
                            }
    
                           // 2) 휴대폰 전화 길이 검사 
                           regExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
    
                           if(!regExp.test(tel.value)){
                               alert("휴대전화 번호를 형식에 맞게 입력해주세요.");
    
                               tel.value = "";
                               tel.focus();
    
                               return false;
                           }
    
    
                           //3) 이메일
                           regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    
                           if(!regExp.test(email.value)){
                               alert("이메일을 형식에 맞게 입력해주세요.");
    
                               email.value = "";
                               email.focus();
    
                               return false;
                           }
    
                       
    
                           // 4) num1 인증번호 길이 검사 
                           regExp = /^[0-9]{6}/;
    
                               if(!regExp.test(num1.value)){
                                   alert("휴대전화 인증을 받고 다시 시도해주세요.");
    
                                   num1.value = "";
                                   num1.focus();
    
                                   return false;
                               }
                       
                           
                            // 4) num2 인증번호 길이 검사 
                            regExp = /^[0-9]{6}/;
    
                               if(!regExp.test(num2.value)){
                                   alert("휴대전화 인증을 받고 다시 시도해주세요.");
    
                                   num2.value = "";
                                   num2.focus();
    
                                   return false;
                               }
    
                           }
             
           </script>
    
    
            
           
    
    
            
    
    
            <!--인증번호 받기 클릭시 알림창-->
            <script>
                function send(){
                    alert('인증번호가 발송되었습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.');
                }
            </script>
    
    
            <!-- 아코디언 효과 -->
            <script>
    
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
    
    
                
            </script>
            </div>

</body>
</html>

