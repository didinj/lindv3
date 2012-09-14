<%@ page import="com.media.eximio.Hospital" %>

<table>
  <g:if test="${hospitalInstance.adminid}">
    <g:hiddenField name="adminid" value="${hospitalInstance.adminid}" />
  </g:if>
  <g:else>
    <tr>
      <td>Hospital Admin User</td>
      <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'adminid', 'error')} required">
          <select name="adminid">
            <g:each in="${users}" var="us">
              <option value="${us.id}">${us.username}</option>
            </g:each>
          </select></div>
      </td>
    </tr>
  </g:else>
  <tr>
    <td>Hospital Name</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospname', 'error')} required">
        <g:textField name="hospname" required="" value="${hospitalInstance?.hospname}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital Address</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospaddr', 'error')} required">
        <g:textField name="hospaddr" required="" value="${hospitalInstance?.hospaddr}" class="longtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital City</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospcity', 'error')} ">
        <g:textField name="hospcity" value="${hospitalInstance?.hospcity}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital Country</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospcountry', 'error')} ">
        <g:textField name="hospcountry" value="${hospitalInstance?.hospcountry}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital Schedule</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'schedule', 'error')} ">
        <ul class="one-to-many">
          <g:each in="${hospitalInstance?.schedule?}" var="s">
            <li><g:link controller="schedule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
          </g:each>
          <li class="add">
          <g:link controller="schedule" action="create" params="['hospital.id': hospitalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'schedule.label', default: 'Schedule')])}</g:link>
          </li>
        </ul>

      </div></td>
  </tr>
  <tr>
    <td>Hospital Phone</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospphone', 'error')} ">
        <g:textField name="hospphone" value="${hospitalInstance?.hospphone}" class="shorttextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital Email</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospemail', 'error')} ">
        <g:field type="email" name="hospemail" value="${hospitalInstance?.hospemail}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital Website</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospwebsite', 'error')} ">
        <g:field type="url" name="hospwebsite" value="${hospitalInstance?.hospwebsite}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital About</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospabout', 'error')} ">
        <g:textArea name="hospabout" value="${hospitalInstance?.hospabout}" cols="80" rows="5"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital Galleries</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospgalleries', 'error')} ">
        <g:select name="hospgalleries" from="${com.media.eximio.Hospgallery.list()}" multiple="multiple" optionKey="id" size="5" value="${hospitalInstance?.hospgalleries*.id}" class="many-to-many"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital Specialist</td>
    <td><div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospspecialists', 'error')} ">
        <g:select name="hospspecialists" from="${com.media.eximio.Hospspecialist.list()}" multiple="multiple" optionKey="id" size="5" value="${hospitalInstance?.hospspecialists*.id}" class="many-to-many"/>
      </div></td>
  </tr>
  <tr>
    <td>Hospital Image</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'hospimage', 'error')} required">
        <input type="file" id="hospimage" name="hospimage" />
      </div>
    </td>
  </tr>
</table>
<div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'user', 'error')} " style="display: none">
  <label for="user">
    <g:message code="hospital.user.label" default="User" />

  </label>

</div>