<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout"/>
    <title>Organization Info</title>
  </head>
  <body>
    <div>
      <g:link action="edit" id="${organizationInstance?.id}">edit</g:link> | <g:link action="index" id="${organizationInstance?.id}">back</g:link>
    </div>
    <h1>Organization Info</h1>
    <p>Spread information to several or all members</p>
    <table>
      <tr>
        <td>Pick Members or <g:checkBox name="allmembers" id="allmembers" /> All Members</td>
    <td><div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'user', 'error')} ">
        <g:select name="user" from="${com.media.eximio.auth.User.list()}" multiple="multiple" optionKey="id" size="8" class="many-to-many"/>
      </div></td>
  </tr>
  <tr>
    <td>Attachment</td>
    <td><input type="file" id="attachment" name="attachment" /></td>
  </tr>
  <tr>
    <td>Subject</td>
    <td><g:textArea name="subject" rows="2" cols="80" /></td>
  </tr>
  <tr>
    <td>Message</td>
    <td><g:textArea name="message" rows="6" cols="80" /></td>
  </tr>
  <tr>
    <td colspan="2"><g:submitButton value="Spread" name="submitButton" /></td>
  </tr>
</table>
</body>
</html>