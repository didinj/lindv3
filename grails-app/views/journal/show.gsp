
<%@ page import="com.media.eximio.Journal" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'journal.label', default: 'Journal')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="show-journal" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${journalInstance?.journaltitle}">
      <h2><g:fieldValue bean="${journalInstance}" field="journaltitle"/></h2>
    </g:if>
    <g:if test="${journalInstance?.journalauthor}">
      <div><g:fieldValue bean="${journalInstance}" field="journalauthor"/></div>
    </g:if>

    <g:if test="${journalInstance?.journalabstract}">
      <div>${journalInstance.journalabstract}</div>
    </g:if>

    <g:if test="${journalInstance?.journalcontent}">
      <div>${journalInstance.journalcontent}</div>
    </g:if>

    <g:if test="${journalInstance?.journalreference}">
      <div>${journalInstance.journalreference}</div>
    </g:if>

    <g:if test="${journalInstance?.user}">
      <h3>Readers:</h3>
      <div>
        <g:each in="${journalInstance.user}" var="u">
          <span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
        </g:each>
      </div>
    </g:if>

    <g:if test="${journalInstance?.quiz}">
      <h3>Journal Quiz</h3>
      <ol>
        <g:each in="${journalInstance.quiz}" var="q">
          <li><span class="property-value" aria-labelledby="quiz-label"><g:link controller="journalQuiz" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span></li>
        </g:each>
      </ol>
    </g:if>


    <div style="display:none">
      <g:if test="${journalInstance?.journalimage}">
        <li class="fieldcontain">
          <span id="journalimage-label" class="property-label"><g:message code="journal.journalimage.label" default="Journalimage" /></span>

        </li>
      </g:if>
      <g:if test="${journalInstance?.downers}">
        <li class="fieldcontain">
          <span id="downers-label" class="property-label"><g:message code="journal.downers.label" default="Downers" /></span>

        <g:each in="${journalInstance.downers}" var="d">
          <span class="property-value" aria-labelledby="downers-label"><g:link controller="journalDownloader" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
        </g:each>

        </li>
      </g:if>

      <g:if test="${journalInstance?.createdate}">
        <li class="fieldcontain">
          <span id="createdate-label" class="property-label"><g:message code="journal.createdate.label" default="Createdate" /></span>

          <span class="property-value" aria-labelledby="createdate-label"><g:formatDate date="${journalInstance?.createdate}" /></span>

        </li>
      </g:if>



      <g:if test="${journalInstance?.updatedate}">
        <li class="fieldcontain">
          <span id="updatedate-label" class="property-label"><g:message code="journal.updatedate.label" default="Updatedate" /></span>

          <span class="property-value" aria-labelledby="updatedate-label"><g:formatDate date="${journalInstance?.updatedate}" /></span>

        </li>
      </g:if>
    </div>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${journalInstance?.id}" />
        <g:link class="edit" action="edit" id="${journalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
