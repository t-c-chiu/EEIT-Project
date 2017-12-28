<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="287084305266-v34s0llldkbgb3a4pgbuk2vo0c5k6urt.apps.googleusercontent.com">
<title>Login</title>
</head>
<body>
<div style="width:192px;margin:6px;">
<h3>請用Google帳號登入</h3>
<img id="loginImage" src="glogin.gif"><br />
<div class="g-signin2" data-onsuccess="onSignIn" style="width:192px;"></div>
<div id="my-signin2"></div>
</div>

  <script>

  
  
      function onSignIn(googleUser) {
         var profile = googleUser.getBasicProfile();

         var redirectUrl = 'glogin.login';

         var form = $('<form action="' + redirectUrl + '" method="post">' +
                          '<input type="text" name="id_token" value="' +
                           googleUser.getAuthResponse().id_token + '" />' +
                                                                '</form>');
         $('body').append(form);
         form.submit();
      }

   </script>
</body>
</html>