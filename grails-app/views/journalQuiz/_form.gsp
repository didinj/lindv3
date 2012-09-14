<%@ page import="com.media.eximio.JournalQuiz" %>

<table>
  <tr style="display: none">
    <td>Journal</td>
    <td><div class="fieldcontain ${hasErrors(bean: journalQuizInstance, field: 'journal', 'error')} required">
        <g:textField name="journal.id" value="${journalQuizInstance?.journal?.id}" class="many-to-one"/>
      </div></td>
  </tr>
  <tr>
    <td>Question</td>
    <td><div class="fieldcontain ${hasErrors(bean: journalQuizInstance, field: 'question', 'error')} ">
        <g:textArea name="question" value="${journalQuizInstance?.question}" cols="80" rows="2" />
      </div></td>
  </tr>
  <tr>
    <td>Choice A</td>
    <td><div class="fieldcontain ${hasErrors(bean: journalQuizInstance, field: 'opsa', 'error')} ">
        <g:textArea name="opsa" value="${journalQuizInstance?.opsa}" cols="80" rows="2"/>
      </div></td>
  </tr>
  <tr>
    <td>Choice B</td>
    <td><div class="fieldcontain ${hasErrors(bean: journalQuizInstance, field: 'opsb', 'error')} ">
        <g:textArea name="opsb" value="${journalQuizInstance?.opsb}" cols="80" rows="2"/>
      </div></td>
  </tr>
  <tr>
    <td>Choice C</td>
    <td><div class="fieldcontain ${hasErrors(bean: journalQuizInstance, field: 'opsc', 'error')} ">
        <g:textArea name="opsc" value="${journalQuizInstance?.opsc}" cols="80" rows="2"/>
      </div></td>
  </tr>
  <tr>
    <td>Choice D</td>
    <td><div class="fieldcontain ${hasErrors(bean: journalQuizInstance, field: 'opsd', 'error')} ">
        <g:textArea name="opsd" value="${journalQuizInstance?.opsd}" cols="80" rows="2"/>
      </div></td>
  </tr>
  <tr>
    <td>Right Answer</td>
    <td><div class="fieldcontain ${hasErrors(bean: journalQuizInstance, field: 'rightanswer', 'error')} ">
        <g:select name="rightanswer" from="${['a', 'b', 'c', 'd']}" />
      </div></td>
  </tr>
</table>













<div class="fieldcontain ${hasErrors(bean: journalQuizInstance, field: 'answered', 'error')} " style="display:none">
  <label for="answered">
    <g:message code="journalQuiz.answered.label" default="Answered" />

  </label>
  <g:checkBox name="answered" value="${journalQuizInstance?.answered}" />
</div>



