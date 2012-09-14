<%@ page import="com.media.eximio.auth.User" %>
<!doctype html>

<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Registration</title>
  </head>
  <body>
    <div id="publicfront">
      <div id="topbanner">
        <div id="innertopbanner" class="round6">
          &nbsp;
        </div>
      </div>
      <div id="leftpublicfront">
        <h1>Doctor Registration</h1>
        <div id="newarticle" class="round6">
          <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
          </g:if>
          <g:hasErrors bean="${userInstance}">
            <ul class="errors" role="alert">
              <g:eachError bean="${userInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
              </g:eachError>
            </ul>
          </g:hasErrors>
          <g:form action="saveaccount" class="form-register">
              <g:render template="newaccountform"/>
            <p align="right">
              <g:submitButton name="create" class="save round3" value="Register" />
            </p>
          </g:form>
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
