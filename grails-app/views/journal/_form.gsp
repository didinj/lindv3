<%@ page import="com.media.eximio.Journal" %>

<table>
  <tr>
    <td width="20%">Author</td>
    <td width="80%"><div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'journalauthor', 'error')} required">
        <g:textField class="longtextbox" name="journalauthor" required="" value="${journalInstance?.journalauthor}"/>
      </div></td>
  </tr>
  <tr>
    <td width="20%">Title</td>
    <td width="80%"><div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'journaltitle', 'error')} required">
        <g:textField class="longtextbox" name="journaltitle" required="" value="${journalInstance?.journaltitle}"/>
      </div></td>
  </tr>
  <tr>
    <td width="20%">Abstract</td>
    <td width="80%"><div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'journalabstract', 'error')} required">
        <richui:richTextEditor name="journalabstract" value="${journalInstance?.journalabstract}" width="470" />
      </div></td>
  </tr>
  <tr>
    <td width="20%">Content</td>
    <td width="80%"><div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'journalcontent', 'error')} required">
        <richui:richTextEditor name="journalcontent" value="${journalInstance?.journalcontent}" width="470" />
      </div></td>
  </tr>
  <tr>
    <td width="20%">Reference</td>
    <td width="80%"><div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'journalreference', 'error')} required">
        <g:textField class="longtextbox" name="journalreference" required="" value="${journalInstance?.journalreference}"/>
      </div></td>
  </tr>
  <tr>
    <td width="20%">Reader</td>
    <td width="80%"><div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'user', 'error')} ">
        <g:select name="user" from="${com.media.eximio.auth.User.list()}" multiple="multiple" optionKey="id" size="8" value="${journalInstance?.user*.id}" class="many-to-many"/>
      </div></td>
  </tr>
  <tr>
    <td width="20%">Image/Photo</td>
    <td width="80%">
      <div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'journalimage', 'error')} ">
        <input type="file" id="journalimage" name="journalimage" /></div>
    </td>
  </tr>
</table>
<div style="display: none;">
  <div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'createdate', 'error')} required">
    <label for="createdate">
      <g:message code="journal.createdate.label" default="Createdate" />
      <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="createdate" precision="day"  value="${journalInstance?.createdate}"  />
  </div>

  <div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'updatedate', 'error')} required">
    <label for="updatedate">
      <g:message code="journal.updatedate.label" default="Updatedate" />
      <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="updatedate" precision="day"  value="${journalInstance?.updatedate}"  />
  </div>
</div>

<div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'quiz', 'error')} ">
  <label for="quiz">
    <g:message code="journal.quiz.label" default="Quiz" />

  </label>

  <ul class="one-to-many">
    <g:each in="${journalInstance?.quiz?}" var="q">
      <li><g:link controller="journalQuiz" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
    <g:link controller="journalQuiz" action="create" params="['journal.id': journalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz')])}</g:link>
    </li>
  </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'createdate', 'error')} required" style="display: none">
  <label for="createdate">
    <g:message code="journal.createdate.label" default="Createdate" />
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="createdate" precision="day"  value="${journalInstance?.createdate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: journalInstance, field: 'updatedate', 'error')} required" style="display: none">
  <label for="updatedate">
    <g:message code="journal.updatedate.label" default="Updatedate" />
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="updatedate" precision="day"  value="${journalInstance?.updatedate}"  />
</div>

