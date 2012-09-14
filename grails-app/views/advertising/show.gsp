
<%@ page import="com.media.eximio.Advertising" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'advertising.label', default: 'Advertising')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="show-advertising" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table>
      <tr>
        <td rowspan="5" width="30%"><g:if test="${advertisingInstance?.advimage}">
        <img class="image-med" src="${createLink(action:'adv_image', id:advertisingInstance.id)}" />
      </g:if></td>
      <td width="20%">Description :</td>
      <td width="50%">    <g:if test="${advertisingInstance?.advdesc}">
        <span class="property-value" aria-labelledby="advdesc-label"><g:fieldValue bean="${advertisingInstance}" field="advdesc"/></span>
      </g:if></td>
      </tr>
      <tr>
        <td>Clicked :</td>
        <td>    <g:if test="${advertisingInstance?.advclick}">
        <span class="property-value" aria-labelledby="advclick-label"><g:fieldValue bean="${advertisingInstance}" field="advclick"/></span>
    </g:if></td>
      </tr>
      <tr>
        <td>Users :</td>
        <td>    <g:if test="${advertisingInstance?.users}">
      <g:each in="${advertisingInstance.users}" var="u">
        <span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
      </g:each>
    </g:if></td>
      </tr>
      <tr>
        <td>Create Date :</td>
        <td>    <g:if test="${advertisingInstance?.createdate}">
        <span class="property-value" aria-labelledby="createdate-label"><g:formatDate format="dd MMM yyyy" date="${advertisingInstance?.createdate}" /></span>
    </g:if></td>
      </tr>
      <tr>
        <td>Type :</td>
        <td>    <g:if test="${advertisingInstance?.advtype}">
        <span class="property-value" aria-labelledby="advtype-label"><g:fieldValue bean="${advertisingInstance}" field="advtype"/></span>
    </g:if></td>
      </tr>
    </table>

    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${advertisingInstance?.id}" />
        <g:link class="edit" action="edit" id="${advertisingInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
