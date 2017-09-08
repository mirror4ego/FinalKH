<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style type="text/css">


body>.grid {
   height: 100%;
}

.image {
   margin-top: -100px;
}

.signUp.column {
   max-width: 450px;
}
</style>
<script>
  $(document)
    .ready(function() {
      $('.ui.signup.form')
        .form({
          fields: {
            email: {
              identifier  : 'email',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your e-mail'
                },
                {
                  type   : 'email',
                  prompt : 'Please enter a valid e-mail'
                }
              ]
            },
            password: {
              identifier  : 'password',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[8]',
                  prompt : 'Your password must be at least 8 characters'
                }
               ]
           },
           password_check: {
              identifier : 'sign_up_password_check',
               rules: [
                  {
                     type : 'match[pwd]',
                     prompt : 'Please match with your password'
                  }
              ]
           }
          } 
        }) 
       ; 
     }) 
    ;
  </script>


   <div class="signUp column">
      <h2 class="ui teal image header">
         <img src="https://semantic-ui.com/examples/assets/images/logo.png"
            class="image">
         <div class="content">Sign-up your account</div>
      </h2>
      <form class="ui large signup form" id="signUpForm" action="${path}/member/insert.do" method="post">
         <div class="ui stacked segment">
            <div class="field">
               <div class="ui left icon input">
                  <i class="mail icon"></i> <input type="text" name="email" id="semail"
                     placeholder="E-mail address">
               </div>
            </div>
            <div class="field">
               <div class="ui signup left icon input">
                  <i class="lock icon"></i> <input type="password" name="password" id="pwd"
                     placeholder="Password">
               </div>
            </div>
            <div class="field">
               <div class="ui left icon input">
                  <i class="lock icon"></i> <input type="password" name="sign_up_password_check" id="pwdchk"
                     placeholder="Password check">
               </div>
            </div>
            <div class="field">
               <div class="ui left icon input">
                  <i class="user icon"></i> <input type="text" name="userid" id="userid"
                     placeholder="User ID">
               </div>
            </div>
            <div class="ui fluid large teal submit button" onclick="errorShow()">가입</div>
         </div>
         <div><p>가입을 클릭하시면 <a href ="#">서비스 약관</a>과 <a href="#">개인정보 취급방침</a>을 읽고 동의하신 것으로 간주됩니다.</p></div>
         <div class="ui error message" id="error"></div>
      </form>
   </div>
<script>
$(document).on(
		"change",
		"#semail",
		function(e) {
			var email =$('#semail').val();
			$.ajax({
				type : "get",
				headers : {
					'Accept' : 'application/text',
					'Content-Type' : 'text/plain'
				},
				url : "${path}/member/overlap.do?",
				data : "email="
						+ email,
				processData : false,
				contentType : "application/text;charset=UTF-8",
				cache : false,
				async : true,
				success : function(result) {
					console.log(result);
					$('#signUpForm').find('#already').remove();
					if(result=='1'){
						$('#signUpForm').append("<div class='ui red message' id='already'><ul class='list'><li>이미 있는 이메일 입니다.</li></ul></div>	");
					}else{
						$('#signUpForm').find('#already').remove();
					}
					
					
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
		}
);

function errorShow(ee){
	$('#signUpForm').find('#error').show();
}
</script>