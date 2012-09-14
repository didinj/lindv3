
<%@ page import="com.media.eximio.JournalQuiz" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout">
  <g:set var="entityName" value="${message(code: 'journalQuiz.label', default: 'JournalQuiz')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div id="list-journalQuiz" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="question" title="${message(code: 'journalQuiz.question.label', default: 'Question')}" />

      <g:sortableColumn property="opsa" title="${message(code: 'journalQuiz.opsa.label', default: 'Opsa')}" />

      <g:sortableColumn property="opsb" title="${message(code: 'journalQuiz.opsb.label', default: 'Opsb')}" />

      <g:sortableColumn property="opsc" title="${message(code: 'journalQuiz.opsc.label', default: 'Opsc')}" />

      <g:sortableColumn property="opsd" title="${message(code: 'journalQuiz.opsd.label', default: 'Opsd')}" />

      <g:sortableColumn property="rightanswer" title="${message(code: 'journalQuiz.rightanswer.label', default: 'Rightanswer')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${journalQuizInstanceList}" status="i" var="journalQuizInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td><g:link action="show" id="${journalQuizInstance.id}">${fieldValue(bean: journalQuizInstance, field: "question")}</g:link></td>

        <td>${fieldValue(bean: journalQuizInstance, field: "opsa")}</td>

        <td>${fieldValue(bean: journalQuizInstance, field: "opsb")}</td>

        <td>${fieldValue(bean: journalQuizInstance, field: "opsc")}</td>

        <td>${fieldValue(bean: journalQuizInstance, field: "opsd")}</td>

        <td>${fieldValue(bean: journalQuizInstance, field: "rightanswer")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${journalQuizInstanceTotal}" />
    </div>
  </div>
</body>
</html>
