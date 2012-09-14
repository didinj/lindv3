<%@ page import="com.media.eximio.Reply" %>



<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'replybody', 'error')} ">
  <label for="replybody">
    <g:message code="reply.replybody.label" default="Replybody" />

  </label>
  <g:textArea name="replybody" cols="40" rows="5" maxlength="8094" value="${replyInstance?.replybody}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'replydate', 'error')} required">
  <label for="replydate">
    <g:message code="reply.replydate.label" default="Replydate" />
    <span class="required-indicator">*</span>
  </label>
  <g:datePicker name="replydate" precision="day"  value="${replyInstance?.replydate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'replyuser', 'error')} required">
  <label for="replyuser">
    <g:message code="reply.replyuser.label" default="Replyuser" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="replyuser" name="replyuser.id" from="${com.media.eximio.auth.User.list()}" optionKey="id" required="" value="${replyInstance?.replyuser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'message', 'error')} required">
  <label for="message">
    <g:message code="reply.message.label" default="Message" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="message" name="message.id" from="${com.media.eximio.Message.list()}" optionKey="id" required="" value="${replyInstance?.message?.id}" class="many-to-one"/>
</div>

