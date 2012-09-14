
<%@ page import="com.media.eximio.Groups" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'groups.label', default: 'Groups')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <div id="featdocheader" class="round6top">
        <table id="featdocheadertable">
          <tr>
            <td width="70%" class="headerrb"><g:if test="${groupsInstance?.groupname}">
            <g:fieldValue bean="${groupsInstance}" field="groupname"/>
          </g:if></td>
          <td width="30%"><g:form>
            <g:hiddenField name="id" value="${groupsInstance?.id}" />
            <g:link class="edit" action="edit" id="${groupsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>         
          </g:form></td>
          </tr>
        </table>
      </div>
      <div id="groupbody" class="round6bottom"> 
        <table>
          <tbody>
            <tr>
              <td rowspan="4" class="center"><img class="avatar-small" src="${createLink(controller:'groups', action:'group_photo', id:groupsInstance.id)}" /></td>
              <td><span class="keyfont">Owner</span><span class="valfont"><g:if test="${groupsInstance?.groupowner}">
${groupsInstance?.groupowner?.encodeAsHTML()}
                  </g:if></td>
            </tr>
            <tr>
              <td><span class="keyfont"><g:if test="${groupsInstance?.groupdesc}">
                    <g:fieldValue bean="${groupsInstance}" field="groupdesc"/>
                  </g:if></span></td></td>
            </tr>
          </tbody>
        </table>
      </div>
      <h1>Group Members</h1>
        <ul class="doctorgrid">
          <g:each in="${groupsInstance.g}" status="i" var="m">
            <li>
              <div id="featdocheader" class="round6top"><g:link controller="public" action="show" id="${m.id}">
${fieldValue(bean: m, field: "fullname")}</g:link>
              </div>
              <div id="featdocbody" class="round6bottom"> 
                <table>
                  <tbody>
                    <tr>
                      <td rowspan="4" class="center" width="40%"><g:link action="show" id="${m.id}"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:m.id)}" /></g:link></td>
                  <td width="60%"><span class="keyfont">Specialist</span><br><span class="valfont">${fieldValue(bean: m, field: "specialties")}</span></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Hospital</span><br><span class="valfont">${fieldValue(bean: m, field: "hospital")}</span></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Organization</span><br><span class="valfont">${fieldValue(bean: m, field: "organization")}</span></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Score</span><br><span class="valfont">${fieldValue(bean: m, field: "points")}</span></td></td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </li>
          </g:each>
        </ul>  
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
    </div>
  </div>
</body>
</html>
