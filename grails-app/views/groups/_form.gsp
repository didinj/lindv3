<%@ page import="com.media.eximio.Groups" %>


<table style="width: 100%">
  <tr>
    <td>Group Name</td>
    <td><div class="fieldcontain ${hasErrors(bean: groupsInstance, field: 'groupname', 'error')} required">
        <g:textField class="longtextbox" name="groupname" required="" value="${groupsInstance?.groupname}"/>
      </div></td>
  </tr>
  <tr>
    <td>Description</td>
    <td><div class="fieldcontain ${hasErrors(bean: groupsInstance, field: 'groupdesc', 'error')} ">
        <g:textArea rows="2" cols="58" name="groupdesc" value="${groupsInstance?.groupdesc}"/>
      </div></td>
  </tr>
  <tr>
    <td>Photo/Image</td>
    <td><div class="fieldcontain ${hasErrors(bean: groupsInstance, field: 'groupphoto', 'error')} required">
        <input type="file" id="groupphoto" name="groupphoto" />
      </div></td>
  </tr>
</table>

<div style="display: none">
  <div class="fieldcontain ${hasErrors(bean: groupsInstance, field: 'member', 'error')} ">
  </div>
  <div class="fieldcontain ${hasErrors(bean: groupsInstance, field: 'groupowner', 'error')} required">
    <label for="groupowner">
      <g:message code="groups.groupowner.label" default="Groupowner" />
      <span class="required-indicator">*</span>
    </label>
    <g:textField id="groupowner" name="groupowner.id" required="" value="${userId}" class="many-to-one"/>
  </div>
</div>