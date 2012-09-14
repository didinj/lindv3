
<%@ page import="com.media.eximio.Message" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
  <title>Inbox</title>
</head>
<body>
  <script type="text/javascript">
    function updmsgstatus(param1) {
        ${remoteFunction(action:'updmsgstatus',
        params:'\'id=\'+param1',onSuccess:'reqsent()')};
            
        ${remoteFunction(action:'updrepstatus',
        params:'\'id=\'+param1',onSuccess:'reqsent()')};
    }
    function reqsent() {}
  </script>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1>Inbox | <g:link action="sent">Sent Items</g:link></h1>
      <div id="newarticle" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:if test="${messageInstanceList.size()==0}">
          <div>No Message Found</div>
        </g:if>
        <g:each in="${messageInstanceList}" status="i" var="messageInstance">
          <table style="width:100%" id="msglist" class="bordbot">
            <tr>
              <td rowspan="2" width="10%"><g:link action="show" id="${messageInstance.id}" class="listbold" onclick="updmsgstatus(${messageInstance.id})"><img class="avatar-small" src="${createLink(controller:'home', action:'avatar_image2', id:messageInstance.msgfrom.id)}" /></g:link></td>
            <td width="70%">
            <g:link action="show" id="${messageInstance.id}" class="listbold" onclick="updmsgstatus(${messageInstance.id})"><g:if test="${messageInstance.messageStatus=='unread'}"><strong>${fieldValue(bean: messageInstance, field: "msgfrom")}</strong></g:if>
              <g:else>${fieldValue(bean: messageInstance, field: "msgfrom")}</g:else>                
            </g:link>
          </td>
            <td width="20%"><span class="listdate"><g:formatDate format="dd MMM yyyy" date="${messageInstance.msgcreated}" /></span></td>
            </tr>
            <tr>
              <td>${messageInstance.msgbody}</td>
              <td><g:form>
              <g:hiddenField name="id" value="${messageInstance?.id}" />
            </g:form></td>
            </tr>
          </table>
        </g:each>
      </div>
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
      <div id="friendlist">
        &nbsp; 
      </div>
    </div>
    <div id="bottompublicfront">
      <div class="pagination">
        <g:paginate total="${messageInstanceTotal}" />
      </div>
    </div>
  </div>
</body>
</html>
