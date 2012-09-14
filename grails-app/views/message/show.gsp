
<%@ page import="com.media.eximio.Message" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <script type="text/javascript">
        
    function newreply(data,textStatus) {
      if(data.length>0) {
        $("#replybody").val("");
        location.reload();
        $("#replymsg").text("Message replied");
      }
    }
  </script>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1><g:message code="default.show.label" args="[entityName]" /></h1>
      <div id="newarticle" class="round6">
        <g:link action="inbox">Back to Inbox</g:link>
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table style="width: 100%" class="bordbot">
          <tr>
            <td rowspan="2" width="10%"><img class="avatar-small" src="${createLink(controller:'home', action:'avatar_image2', id:messageInstance.msgfrom.id)}" /></td>
            <td width="70%"><g:if test="${messageInstance?.msgfrom}">
${messageInstance?.msgfrom?.fullname.encodeAsHTML()}
          </g:if></td>
          <td width="20%"><g:if test="${messageInstance?.msgcreated}">
            <g:formatDate format="dd MMM yyyy"date="${messageInstance?.msgcreated}" />
          </g:if></td>
          </tr>
          <tr>
            <td colspan="2"><g:if test="${messageInstance?.msgbody}">
${messageInstance.msgbody}
          </g:if></td>
          </tr>
        </table>
        <g:if test="${messageInstance?.reply}">
          <g:each in="${messageInstance.reply}" var="r">
            <table style="width: 100%" class="bordbot">
              <tr>
                <td rowspan="2" width="10%"><img class="avatar-small" src="${createLink(controller:'home', action:'avatar_image2', id:r.replyuser.id)}" /></td>
                <td width="70%">
${r?.replyuser?.fullname.encodeAsHTML()}
                </td>
                <td width="20%">
              <g:formatDate format="dd MMM yyyy"date="${r?.replydate}" />
              </td>
              </tr>
              <tr>
                <td colspan="2">${r?.replybody?.encodeAsHTML()}</td>
              </tr>
            </table>
          </g:each>
        </g:if>
        <g:formRemote name="replyform" url="[controller: 'message', action: 'savereply']" onSuccess="newreply(data,textStatus)">
          <table style="width: 100%">
            <tr>
              <td>
            <g:textArea id="replybody" name="replybody" cols="40" rows="2" maxlength="8094" style="width:570px; height:40px" />
            <p align="right"><g:submitButton name="create" class="save" value="Reply" /></p>
            </td>
            </tr>
          </table>
          <div style="display: none">
            <g:datePicker name="replydate" precision="day"  />
            <g:textField id="replyuser" name="replyuser.id" required="" value="${messageInstance.msgto.id}" />
            <g:textField id="message" name="message.id" required="" value="${messageInstance?.id}" />
          </div>
        </g:formRemote>
        <label id="replymsg"></label>
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
