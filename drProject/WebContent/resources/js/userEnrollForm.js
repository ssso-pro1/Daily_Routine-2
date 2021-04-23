function validate(){
                
    // 유효성 검사 : 아이디, 비밀번호, 비밀번호 일치, 이름

    // input요소 객체들 가져다두기 (작성되어있는값 아님! input요소객체임!)
    var userId = document.getElementById("userId");
    var userPwd1 = document.getElementById("userPwd1");
    var userPwd2 = document.getElementById("userPwd2");
    var userName = document.getElementById("userName");

    // 1) 아이디 검사 (영문자,숫자로만 총 4글자~12글자로 이뤄져야만 하고 단, 첫글자는 영문자(소문자 한글자)로.)
    var regExp = /^[a-z][a-z\d]{3,11}$/;
    if(!regExp.test(userId.value)) { //userId는 요소객체이기 때문에 value붙여야함
        alert("유효한 아이디를 입력하세요");

        userId.value = "";
        userId.focus();   //입력칸에 깜빡깜빡 focus감(입력유도)

        return false; //틀리면 넘어가지 않게.
    }

    // 2) 비밀번호 검사 (영문자,숫자,특수문자(!@#$%^&*) 포함 총 8자~15자 입력되게)
    regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
    if(!regExp.test(userPwd1.value)){
        alert("유효한 비번 입력하세요.");

        userPwd1.value = ""; //기존값 초기화시키고, 포커스 가게
        userPwd1.focus();

        return false;
    }

    // 3) 비밀번호 일치 검사
    if(userPwd1.value != userPwd2.value){
        alert("동일한 비밀번호를 입력하세요");

        userPwd2.select(); //입력한 비번내용이 파랗게 선택됨.
        return false;
    }
    
    // 4) 이름 검사 (한글(결합)로만, 2글자 이상)
    regExp = /^[가-힣]{2,}$/; //{2} : 그냥 2글자
    if(!regExp.test(userName.value)){
        alert("유효한 이름을 입력하세요");

        userName.value = "";
        userName.focus();

        return false;
    }


    
}
