<%@ page import="com.media.eximio.Education" %>

<table>
  <tr>
    <td>Institution Name</td>
    <td><div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'institutionname', 'error')} ">
        <g:textField name="institutionname" value="${educationInstance?.institutionname}"/>
      </div></td>
  </tr>
  <tr>
    <td>Institution City</td>
    <td><div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'institutioncity', 'error')} ">
        <g:textField name="institutioncity" value="${educationInstance?.institutioncity}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Institution Country</td>
    <td><div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'institutioncountry', 'error')} ">
        <g:textField name="institutioncountry" value="${educationInstance?.institutioncountry}"/>
      </div></td>
  </tr>
  <tr>
    <td>Major</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'major', 'error')} ">
        <g:textField name="major" value="${educationInstance?.major}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Degree</td>
    <td><div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'degree', 'error')} ">
        <g:textField name="degree" value="${educationInstance?.degree}" class="shortextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Year</td>
    <td><div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'year', 'error')} ">
        <g:textField name="year" value="${educationInstance?.year}" class="xshortextbox"/>
      </div></td>
  </tr>
</table>

<div style="display: none">
  <div class="fieldcontain ${hasErrors(bean: educationInstance, field: 'user', 'error')} required">
    <label for="user">
      <g:message code="education.user.label" default="User" />
      <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${com.media.eximio.auth.User.list()}" optionKey="id" required="" value="${educationInstance?.user?.id}" class="many-to-one"/>
  </div>
</div>