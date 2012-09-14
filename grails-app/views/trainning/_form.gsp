<%@ page import="com.media.eximio.Trainning" %>

<table>
  <tr>
    <td>Institution</td>
    <td><div class="fieldcontain ${hasErrors(bean: trainningInstance, field: 'institution', 'error')} ">
        <g:textField name="institution" value="${trainningInstance?.institution}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Certification</td>
    <td><div class="fieldcontain ${hasErrors(bean: trainningInstance, field: 'certification', 'error')} ">
        <g:textField name="certification" value="${trainningInstance?.certification}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>City</td>
    <td><div class="fieldcontain ${hasErrors(bean: trainningInstance, field: 'city', 'error')} ">
        <g:textField name="city" value="${trainningInstance?.city}"/>
      </div></td>
  </tr>
  <tr>
    <td>Country</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: trainningInstance, field: 'country', 'error')} ">
        <g:textField name="country" value="${trainningInstance?.country}"/>
      </div></td>
  </tr>
  <tr>
    <td>Year</td>
    <td><div class="fieldcontain ${hasErrors(bean: trainningInstance, field: 'year', 'error')} ">
        <g:textField name="year" value="${trainningInstance?.year}" class="xshortextbox"/>
      </div></td>
  </tr>
</table>

<div style="display: none">
  <div class="fieldcontain ${hasErrors(bean: trainningInstance, field: 'user', 'error')} required">
    <label for="user">
      <g:message code="trainning.user.label" default="User" />
      <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${com.media.eximio.auth.User.list()}" optionKey="id" required="" value="${trainningInstance?.user?.id}" class="many-to-one"/>
  </div>
</div>