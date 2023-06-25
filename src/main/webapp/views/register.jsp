<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    let register_form = {
        init:function (){
            // $('#register_btn').addClass('disabled');
            $("#register_btn").attr("disabled", true);
            $('#register_btn').click(function (){
                register_form.send();
            });

            $('#checkEmail').click(function() {
                var email_txt = $('#email').val()
                $.ajax({
                    // type : 'POST',
                    url : '/mailConfirm',
                    data : {"email" : email_txt},
                    success : function(data){
                        alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
                        console.log("data : "+data);
                        chkEmailConfirm(data, $('#emailconfirm'), $('#emailconfirmTxt'));
                    }
                })
            })
            // 이메일 인증번호 체크 함수
            function chkEmailConfirm(data/*,$('#emailconfirm'), $('#emailconfirmTxt')*/){
                $('#emailconfirm').on("keyup", function(){
                    if (data != $('#emailconfirm').val()){ //
                        emconfirmchk = false;
                        $('#emailconfirmTxt').html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>")
                        $("#register_btn").attr("disabled", true);
                        $("#emconfirmchk").css({
                            "color" : "#FA3E3E",
                            "font-weight" : "bold",
                            "font-size" : "10px"
                        })

                    } else {
                        emconfirmchk = true;
                        $('#emailconfirmTxt').html("<span id='emconfirmchk'>인증번호 확인 완료</span>")
                        $("#register_btn").attr("disabled", false);
                        $("#emconfirmchk").css({
                            "color" : "#0D6EFD",
                            "font-weight" : "bold",
                            "font-size" : "10px"
                        })

                    }
                })
            }
            $('#name').keyup(function () {
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var name = $('#name').val();
                // if (id != '' && pwd != '' && name != '') {
                //     $('#register_btn').removeClass('disabled')
                // }
            });

                $('#id').keyup(function (){
                var txt_id =  $('#id').val();
                if(txt_id.length <= 3){
                   return;
               }
                $.ajax({
                    url:'/checkid',
                    data:{'id':txt_id}, // 'id' 라는 이름으로 id를 전송하 겠다
                    success:function (result){
                        if(result == 0){
                            $('#check_id').text('사용가능한 ID입니다.')
                            //$('#pwd').focus();
                        }else{
                            $('#check_id').text('이미 사용중인 ID입니다..')
                        }
                    }  //주의!!!success일때는 세미콜론, 컴마가 없다!!!!!!!!!!!!!!!!!!!!
                });
            });
        },
        send:function (){
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var name = $('#name').val();
            if(id.length <= 3){
                $('#check_id').text('ID는 4자리 이상으로 만들어 주세용~♥');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            if(name == ''){
                $('#name').focus();
                return;
            }

            $('#register_form').attr({
                'action':'/registerimpl',
                'method':'post'
            });
            $('#register_form').submit();
        }
    };

    // 화면에 접속 되면 로그인폼 객체에 이닛을 출력해라
    $(function (){
        register_form.init();
    });
</script>

<div class="col-sm-8 text-left">
  <div class="container col-sm-8">
      <h1>Register Page</h1></br>
      <form id="register_form" class="form-horizontal well">
          <div class="form-group">
              <input type="text" class="form-control" id="id" name="id" placeholder="Make Your ID" >
          </div>
              <div class="col-sm-10">
                  <span id="check_id" class="bg-danger"></span>
              </div>

          <div class="form-group">
              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password" >
          </div>

          <div class="form-group">
              <input type="text" class="form-control" id="name" name="name" placeholder="name" >
          </div>

          <div class="form-group">
              <input type="text" class="form-control" id="email" name="email" placeholder="email" >
          </div>
          <!-- <span>이메일 인증번호</span> -->
          <button class="btn btn-outline-primary" type="button" id="checkEmail">인증번호 받기</button>

          <div class="form-group last mb-4 check_input">
              <label for="emailconfirm" id="emailconfirmTxt">인증번호를 입력해주세요</label>
              <input type="text" class="form-control" id="emailconfirm">
          </div>
              <div>
                  <button type="button" id="register_btn" class="btn btn-primary">Regsiter</button>
              </div>
      </form>


  </div>
</div>