<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dr.member.user.model.vo.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .footerOuter{
            /* height:20%; */
            display: table-flex;
            border:1px solid gray;

        }

        .footer1 a{
            text-decoration: none;
            color:white;
            padding: 10px;
            
        }
        .footer1_1{
            background:rgb(250, 214, 9);
            display:flex;
            text-align: center;
        }
        .footer1_2 *{
            width:30px;
            /* color:rgb(250, 214, 9); */
            color:white;
            align-items: center;
            
        }

        .footer2{
            padding:0 10px;
        }
        
    </style>
</head>
<body>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    
    <div class="footerOuter">
    
        <div class="footerWrap">

            <div class="footer1">
                <div class="footer1_1">
                    <a href="">이용약관</a> 
                    <a href="">개인정보보호정책</a>

                    <div class="footer1_2" align="right">
                        <i class="fab fa-instagram-square" fa="lg" ></i>
                        <i class="fab fa-youtube"></i>
                        <i class="fab fa-facebook"></i> 
                        <i class="fas fa-arrow-up" fa="lg"></i>
                    </div>
                </div>
                <!-- <div class="footer1_2" align="right">
                    <i class="fab fa-instagram-square" fa="lg" ></i>
                    <i class="fab fa-youtube"></i>
                    <i class="fab fa-facebook"></i> 
                    <i class="fas fa-arrow-up" fa="lg"></i>
                </div> -->
            </div>

            <div class="footer2">
                <p>02) 0909 - 0909 (평일 10:00 ~ 18:00) <br><br>
                    Daily Routine : DR <br>
                    주소 : 서울시 강남구 코딩로 31길, 서울 코딩별관 4층 <br>
                    고객센터 및 제휴문의 : daily@routine.co.kr           
                </p>
            </div>
        </div>

    
    </div>
</body>
</html>