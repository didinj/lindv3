
<%@ page import="com.media.eximio.JournalQuiz" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'journalQuiz.label', default: 'JournalQuiz')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="show-journalQuiz" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list journalQuiz">

      <g:if test="${journalQuizInstance?.question}">
        <li class="fieldcontain">
          <span id="question-label" class="property-label"><g:message code="journalQuiz.question.label" default="Question" /></span>

          <span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${journalQuizInstance}" field="question"/></span>

        </li>
      </g:if>

      <g:if test="${journalQuizInstance?.opsa}">
        <li class="fieldcontain">
          <span id="opsa-label" class="property-label"><g:message code="journalQuiz.opsa.label" default="Opsa" /></span>

          <span class="property-value" aria-labelledby="opsa-label"><g:fieldValue bean="${journalQuizInstance}" field="opsa"/></span>

        </li>
      </g:if>

      <g:if test="${journalQuizInstance?.opsb}">
        <li class="fieldcontain">
          <span id="opsb-label" class="property-label"><g:message code="journalQuiz.opsb.label" default="Opsb" /></span>

          <span class="property-value" aria-labelledby="opsb-label"><g:fieldValue bean="${journalQuizInstance}" field="opsb"/></span>

        </li>
      </g:if>

      <g:if test="${journalQuizInstance?.opsc}">
        <li class="fieldcontain">
          <span id="opsc-label" class="property-label"><g:message code="journalQuiz.opsc.label" default="Opsc" /></span>

          <span class="property-value" aria-labelledby="opsc-label"><g:fieldValue bean="${journalQuizInstance}" field="opsc"/></span>

        </li>
      </g:if>

      <g:if test="${journalQuizInstance?.opsd}">
        <li class="fieldcontain">
          <span id="opsd-label" class="property-label"><g:message code="journalQuiz.opsd.label" default="Opsd" /></span>

          <span class="property-value" aria-labelledby="opsd-label"><g:fieldValue bean="${journalQuizInstance}" field="opsd"/></span>

        </li>
      </g:if>

      <g:if test="${journalQuizInstance?.rightanswer}">
        <li class="fieldcontain">
          <span id="rightanswer-label" class="property-label"><g:message code="journalQuiz.rightanswer.label" default="Rightanswer" /></span>

          <span class="property-value" aria-labelledby="rightanswer-label"><g:fieldValue bean="${journalQuizInstance}" field="rightanswer"/></span>

        </li>
      </g:if>

      <g:if test="${journalQuizInstance?.answered}">
        <li class="fieldcontain">
          <span id="answered-label" class="property-label"><g:message code="journalQuiz.answered.label" default="Answered" /></span>

          <span class="property-value" aria-labelledby="answered-label"><g:formatBoolean boolean="${journalQuizInstance?.answered}" /></span>

        </li>
      </g:if>

      <g:if test="${journalQuizInstance?.journal}">
        <li class="fieldcontain">
          <span id="journal-label" class="property-label"><g:message code="journalQuiz.journal.label" default="Journal" /></span>

          <span class="property-value" aria-labelledby="journal-label"><g:link controller="journal" action="show" id="${journalQuizInstance?.journal?.id}">${journalQuizInstance?.journal?.encodeAsHTML()}</g:link></span>

        </li>
      </g:if>

    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${journalQuizInstance?.id}" />
        <g:link class="edit" action="edit" id="${journalQuizInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
