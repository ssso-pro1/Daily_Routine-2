<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 인코딩 확인 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3.회원가입_1.회원약관동의</title>
        
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
         .formOuter{
            border:1px solid gray;
            padding:60px 30px;
            width:50%;
            margin:auto;
        }

        .menuWrap{
            width:100%;
            height:50px;
            margin-top:30px;
            margin-bottom:60px;

            display:flex;
            justify-content:center;
        }
        
        .menuWrap>span{
            text-decoration:none;
            /* color:white; */
            font-size:15px;
            line-height:50px;
            font-weight:bold;

            height:100%;
            margin:0px 50px;
        }

        .step_1, .arrow1 {color:rgb(250, 214, 9);}
        .step_2, .step_3{color:rgb(116, 116, 116);}

        i{margin-top:20px; color:rgb(116, 116, 116);}

        .btn{
            display:flex;
            justify-content:center;
            margin:10px;
        }
        .scroller {
            width: 90%;
            height: 50px;
            overflow-y: scroll;
            scrollbar-color: rebeccapurple green;
            scrollbar-width: thin;
        }


        /* footer */
        .footerOuter{
        width:1000px;
        margin:auto;
        align-items: center;

    }
    .footerOuter>.footer1_1, .footer2{
        width:1000px;
    }

    .footer1_1{
        height:30px;
        background-color:rgb(250, 214, 9);
        /* display:flex;
       justify-content: space-between; */
       padding-top:10px;

    }

    .footer2{
        height:80%;
        padding-left:25px;
        font-size:11px;
    }

    .footer1_1>a{
        text-decoration: none;
        color:black;
        font-weight:bold;
        
        padding:30px;
        text-align:center;
    }
    .footer1_2{
        margin-top:-30px;
        padding: 0px 30px;
    }
    .footer1_2>i{
        padding: 10px 5px;
    }
        
    </style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
    
    
    
    <!-- <hr style="border:1px solid lightgray"> -->

    <div class="menuWrap" align="center">
        <span class="step_1">회원약관동의</span> <i class="arrow1 fas fa-chevron-circle-right fa-lg"></i>
        <span class="step_2">회원정보입력</span> <i class="arrow2 fas fa-chevron-circle-right fa-lg"></i>
        <span class="step_3">회원가입완료</span>
    </div>

    <!-- 상세보기 팝업넣기 -->
 

    <!-- 1. 전체 선택
         2. 전체 해제
         3. 전체 선택 후 하나만 해제했을 때, 전체선택도 해제
         4. 개별 선택으로 전체 다 선택 시, 전체 선택에도 체크-->
    <div class="formOuter">
        <form action="<%=request.getContextPath()%>/enrollForm2.us" id="check_outer" >
            <input type="checkbox" id="check_all" >
            <strong><label for="check_all">DailyRoutine 이용약관, 개인정보 수집 및 이용에 모두 동의합니다. (전체동의)</label></strong>
            
            <hr style="border:1px solid gray" width="100%">

            <input type="checkbox" id="check_1" class="normal" required>
            <strong><label for="check_1">DailyRoutine 이용약관 <span style=color:red>(필수)</span></label> </strong> <br>
            <div class="scroller">
                여러분을 환영합니다.
                DailyRoutine 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한  DailyRoutine 서비스의 이용과 관련하여  DailyRoutine 서비스를 제공하는  DailyRoutine 주식회사(이하  DailyRoutine)와 이를 이용하는  DailyRoutine 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                
                DailyRoutine 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
                
                다양한 네이버 서비스를 즐겨보세요.
                네이버는 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
                여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.
                
                네이버는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
                
                네이버 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고 네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.
                
                회원으로 가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다.
                여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.
                
                네이버는 단체에 속한 여러 구성원들이 공동의 계정으로 네이버 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.
                따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.
                
                단체회원 계정 사용에서의 관리자, 멤버 등의 권한 및 (공동)책임에 관한 사항 등은 계정 운영정책 및 고객센터 내 네이버 단체회원(단체 아이디) 소개 등에서 확인해 주시기 바랍니다.
                
                여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.
                네이버는 여러분이 게재한 게시물이 네이버 서비스를 통해 다른 이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게 할 목적으로 네이버 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종 콘텐츠 자체 또는 파일을 말합니다.
                
                네이버는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다.
                
                한편, 네이버 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.
                게시물 게재로 여러분은 네이버에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.
                
                네이버는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 네이버 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.
                만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.
                
                또한 여러분이 제공한 소중한 콘텐츠는 네이버 서비스를 개선하고 새로운 네이버 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 네이버 및 네이버 계열사에서 사용될 수 있습니다. 네이버는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.
                
                네이버는 여러분이 자신이 제공한 콘텐츠에 대한 네이버 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 네이버 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.
                다만, 일부 네이버 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.
                
                여러분의 개인정보를 소중히 보호합니다
            </div>
            <br><br>
            
            <input type="checkbox" id="check_2" class="normal" required>
            <strong><label for="check_2">개인정보 수집 및 이용 동의 <span style=color:red>(필수)</span></label></strong> <br>
            <div class="scroller">
                개인정보보호법에 따라 DailyRoutine에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

                1. 수집하는 개인정보
                이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

                회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
                - 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
                - 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
                서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
                NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.

                서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
                구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
                2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
                네이버에서 제공하는 위치기반 서비스에 대해서는 '네이버 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
                이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.

                2. 수집한 개인정보의 이용
                네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

                - 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
                - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
                - 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
                - 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
                - 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
                - 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
                - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
                3. 개인정보의 보관기간
            </div>
            <br><br>

            <input type="checkbox" id="check_3" class="normal" >
            <strong><label for="check_3">프로모션 정보 수신 동의 (선택)</label></strong>
            <div class="scroller">
                DailyRoutine에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화( DailyRoutine앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나  DailyRoutine가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
            </div>

            <div class="btn">
                <!-- 취소 : 메인페이지로 이동/ 확인 : 회원가입2단계 (/enrollForm2.us) -->
                <a href="<%=request.getContextPath()%>" type="reset" class="btn btn-secondary ">취소 </a>
                <button type="submit" class="btn btn-warning">확인</button>
            </div>
        </form>
    </div>
    

    </div>




      <!-- footer -->
      <div class="footerOuter">
    
        

        <div class="footer1" >
            <div class="footer1_1">
                <a href="">이용약관</a> | 
                <a href="">개인정보보호정책</a>
            </div>

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
        
        <div class="footer2">
            <p>02) 0909 - 0909 (평일 10:00 ~ 18:00) <br><br>
                Daily Routine : DR <br>
                주소 : 서울시 강남구 코딩로 31길, 서울 코딩별관 4층 <br>
                고객센터 및 제휴문의 : daily@routine.co.kr           
                <br>
                CopyRight 2000-2021 Daily Routine All Right Reserved
            </p>
        </div>
</div>

    
    <script>
    //필수항목 미체크 시 알림창
    /*
    if($("#check_1").prop("checked", false) || $("#check_2").prop("checked", false)){
                  
        alert("필수항목에 동의해주세요."); 
    }else if($("#check_1").prop("checked", false) && $("#check_2").prop("checked", false)){
                  
                  alert("필수항목에 동의해주세요."); 
    }*/

    
        
 


        // document.getElementById($("check_1")).required=true ;
        // document.getElementById($("check_2")).required =true;



        //체크박스 전체 선택
        $(".formOuter").on("click", "#check_all", function () {
            $(this).parents(".formOuter").find('input').prop("checked", $(this).is(":checked"));
        });

        // 체크박스 개별 선택
        $(".formOuter").on("click", ".normal", function() {
            var is_checked = true;

            $(".formOuter .normal").each(function(){
                is_checked = is_checked && $(this).is(":checked");
            });

            $("#check_all").prop("checked", is_checked);
        });
    


        // if($("#check_1").prop("checked") && ($("#check_2").prop("checked")) {

        // }
        


        // 취소 : 메인페이지로 이동
        // function mainPage(){
        //     location.href="<%=request.getContextPath()%>";
        // }

        // // 확인 : 회원가입2단계 servlet 으로 이동 (사용자 정보입력폼)
        // function enrollForm2(){

        //     //var check = document.getElementById("checkbox").required; //==> 전체동의 체크하고 확인누르면 넘어가는데, 체크안하고 확인 다시 체크해도 화면 안 넘어감

        //     location.href = "<%=request.getContextPath()%>/enrollForm2.us";
        // }


    </script>


    <!-- 문제 : required 부여 안됨
                체크 안하고 확인 클릭시, 다시 클릭해도 페이지 안 넘어감 -->
    
    
 


</body>
</html>