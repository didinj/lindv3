
<%@ page import="com.media.eximio.FriendRequest" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'friendRequest.label', default: 'FriendRequest')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1>Connection Request</h1>
      <div id="conrequest" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:if test="${friendRequestInstanceList.size()==0}">
          <div>No Request Found</div>
        </g:if>
        <table>
          <tbody>
          <g:each in="${friendRequestInstanceList}" status="i" var="friendRequestInstance">
            <tr>
              <td class="bordbot" rowspan="2"><img class="avatar-small" src="${createLink(controller:'public', action:'avatar_image', id:friendRequestInstance.fromUser.id)}" /></td>
              <td>${fieldValue(bean: friendRequestInstance, field: "fromUser")} - ${fieldValue(bean: friendRequestInstance, field: "fromUser.specialties")}</td>
            </tr>
            <tr>
              <td class="bordbot">
            <g:form method="post" >
              <g:hiddenField name="id" value="${friendRequestInstance?.id}" />
              <g:hiddenField name="version" value="${friendRequestInstance?.version}" />
              <div style="display: none">
                <g:select id="fromUser" name="fromUser.id" from="${com.media.eximio.auth.User.list()}" optionKey="id" required="" value="${friendRequestInstance?.fromUser?.id}" class="many-to-one"/>
                <g:select id="toUser" name="toUser.id" from="${com.media.eximio.auth.User.list()}" optionKey="id" required="" value="${friendRequestInstance?.toUser?.id}" class="many-to-one"/>
                <g:textField name="status" value="accept"/>
              </div>
              <g:actionSubmit action="acceptreq" value="Accept" />
              <button id="rejectreq" onclick="rejectrequest(friendRequestInstance.id)">Reject</button>
            </g:form>
            </td>
            </tr>
          </g:each>
          </tbody>
        </table>
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
    <div id="bottompublicfront">
      <div class="pagination">
        <g:paginate total="${friendRequestInstanceTotal}" />
      </div>
    </div>
  </div>
</body>
</html>
