<%@ page import="com.media.eximio.Message" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
  <title>New Message</title>
  <resource:richTextEditor />
</head>
<body>
  <script type="text/javascript">
    function updatemsg() {
        $("#msgstatus").text("Message sent");
        window.location = "/lindv3/home/index";
    }
  </script>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1>New Message</h1>
      <div id="newarticle" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${messageInstance}">
          <ul class="errors" role="alert">
            <g:eachError bean="${messageInstance}" var="error">
              <li><g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
          </ul>
        </g:hasErrors>
        <g:formRemote name="msgForm" onSuccess ="updatemsg()" url="[action: 'save']">
          <g:render template="form"/>
          <p align="right">
          <g:submitButton name="create" class="save round3" value="Send" />
          </p>
        </g:formRemote>
        <p><label id="msgstatus"></label></p>
      </div>
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
      <div id="friendlist">
        &nbsp; 
      </div>
    </div>
  </div>
</body>
</html>
