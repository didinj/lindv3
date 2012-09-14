
<%@ page import="com.media.eximio.Groups" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'groups.label', default: 'Groups')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <script type="text/javascript">
      function joingroup(param1,param2) {
${remoteFunction(controller:'groups',
  action:'join',
  params:'\'userid=\'+param1+\'&groupid=\'+param2',onSuccess:'reqsent()')};
      }      
      
      function reqsent() {
      }
  </script>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1>My Groups</h1>
      <div id="newarticle" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:if test="${groupsInstanceList.size()==0}">
          <div>No Groups Found</div>
        </g:if>
        <g:each in="${groupsInstanceList}" status="i" var="groupsInstance">
          <g:form method="post">
            <g:hiddenField name="id" value="${groupsInstance?.id}" />
            <g:hiddenField name="member" value="${userId}" />
            <table style="width:100%">
              <tr>
                <td rowspan="2"><g:link action="show" id="${groupsInstance.id}" class="listbold"><img class="avatar-small" src="${createLink(controller:'groups', action:'group_photo', id:groupsInstance.id)}" /></g:link></td>
              <td><g:link action="show" id="${groupsInstance.id}">${fieldValue(bean: groupsInstance, field: "groupname")}</g:link></td>
              <td>Owner: ${fieldValue(bean: groupsInstance, field: "groupowner")}</td>
              </tr>
              <tr>
                <td colspan="2">${fieldValue(bean: groupsInstance, field: "groupdesc")}
                  <g:actionSubmit action="join" value="Join Group" />
                </td>
              </tr>
            </table>
          </g:form>            
        </g:each>
      </div>
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
    </div>
    <div id="bottompublicfront">
      <div class="pagination">
        <g:paginate total="${groupsInstanceTotal}" />
      </div>
    </div>
  </div>
</body>
</html>
