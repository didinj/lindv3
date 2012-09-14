<%@ page import="com.media.eximio.auth.User" %>
<!doctype html>

<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Account Created</title>
  </head>
  <body>
    <div id="publicfront">
      <div id="topbanner">
        <div id="innertopbanner" class="round6">
          &nbsp;
        </div>
      </div>
      <div id="leftpublicfront">
        <h1>Account Created!</h1>
        <div id="newarticle" class="round6">
          <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
          </g:if>
          <p align="center">Your account has been saved and waiting for approval soon. You can activate your
          account after we sent confirmation.</p>
          <p align="right"><g:link controller="public" action="index">Return to home</g:link></p>
        </div>
      </div>
      <div id="rightpublicfront">
        <div id="adv1">
          <g:img dir="images" file="uob.png" />
        </div>
        <div id="adv2">
          <g:img dir="images" file="md.png" />
        </div>
      </div>
    </div>
  </body>
</html>
