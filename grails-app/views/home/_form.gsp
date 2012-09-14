<%@ page import="com.media.eximio.auth.User" %>

<script type="text/javascript">
      $(document).ready(function() {
        $("#specialties").autocomplete({
          source: '<g:createLink controller='specialist' action='splist'/>'
        });
      });
</script> 

<div>
  <h1 style="margin-left: 10px">Personal Profile</h1>
  
  
  
  <table id="edit-profile" class="bordbot clearfix">
    <tr>
      <td rowspan="7" width="21%"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:userInstance?.id)}" /><br />
      </td>
      <td width="10%">Username</td>
      <td colspan="2"><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
          <g:textField name="username" required="" value="${userInstance?.username}" class="midtextbox"/>
        </div></td>
    </tr>
    <tr>
      <td>Password</td>
      <td colspan="2"><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
          <g:field type="password" name="password" required="" value="${userInstance?.password}" class="midtextbox"/>
        </div></td>
    </tr>
    <tr>
      <td>Photo</td>
      <td colspan="2"><input type="file" id="avatar" name="avatar" /></td>
    </tr>
    <tr>
      <td>Full Name</td>
      <td colspan="2"><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fullname', 'error')} ">
          <g:textField name="fullname" value="${userInstance?.fullname}" class="midtextbox"/>
        </div></td>
    </tr>
    <tr>
      <td>Specialties</td>
      <td colspan="2"><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'specialties', 'error')} ">
          <g:textField name="specialties" id="specialties" value="${userInstance?.specialties}"/>
        </div></td>
    </tr>
    <tr>
      <td>City</td>
      <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} ">
          <g:textField name="city" value="${userInstance?.city}"/>
        </div></td>
    </tr>
	<tr>
      <td>Country</td>
      <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'country', 'error')} ">
          <g:textField name="country" value="${userInstance?.country}"/>
        </div></td>	
	</tr>
  </table>
  
  
  <h1 style="margin-left: 10px">Education</h1>
  <table id="edit-profile" class="bordbot" style="width: 100%">
    <tr>
      <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'education', 'error')} ">
          <ol class="one-to-many">
            <g:each in="${userInstance?.education?}" var="e">
              <li>${e?.encodeAsHTML()} <g:link controller="education" action="edit" id="${e.id}">Edit</g:link></li>
            </g:each>
            <g:link controller="education" action="create" params="['user.id': userInstance?.id]"><g:img dir="images" file="btn-detail.png" /> ${message(code: 'default.add.label', args: [message(code: 'education.label', default: 'Education')])}</g:link>
          </ol>
        </div></td>
    </tr>
  </table>
  
  
  <h1 style="margin-left: 10px">Training</h1>
  <table id="edit-profile" class="bordbot" style="width: 100%">
    <tr>
      <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'trainning', 'error')} ">
          <ol class="one-to-many">
            <g:each in="${userInstance?.trainning?}" var="t">
              <li>${t?.encodeAsHTML()} <g:link controller="trainning" action="edit" id="${t.id}">Edit</g:link></li>
            </g:each>
            <g:link controller="trainning" action="create" params="['user.id': userInstance?.id]"><g:img dir="images" file="btn-detail.png" /> ${message(code: 'default.add.label', args: [message(code: 'trainning.label', default: 'Trainning')])}</g:link>
          </ol>
        </div></td>
    </tr>
  </table>
  
  
  <h1 style="margin-left: 10px">Hospital</h1>
  <table id="edit-profile" class="bordbot" style="width: 100%">
    <tr>
      <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'hospital', 'error')} ">
          <g:select name="hospital" from="${com.media.eximio.Hospital.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.hospital*.id}" class="many-to-many"/>
        </div></td>
    </tr>
  </table>
  
  
  <h1 style="margin-left: 10px">Schedules</h1>
  <table id="edit-profile" class="bordbot" style="width: 100%">
    <tr>
      <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'schedule', 'error')} ">
          <ol class="one-to-many">
            <g:each in="${userInstance?.schedule?}" var="s">
              <li>${s?.encodeAsHTML()} <g:link controller="schedule" action="edit" id="${s.id}">Edit</g:link></li>
            </g:each>
            <g:link controller="schedule" action="create" params="['user.id': userInstance?.id]"><g:img dir="images" file="btn-detail.png" /> ${message(code: 'default.add.label', args: [message(code: 'schedule.label', default: 'Schedule')])}</g:link>
          </ol>
        </div></td>
    </tr>
  </table>
  
  
  <h1 style="margin-left: 10px">Organization</h1>
  <table id="edit-profile" class="bordbot" style="width: 100%">
    <tr>
      <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'organization', 'error')} ">
          <g:select name="organization" from="${com.media.eximio.Organization.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.organization*.id}" class="many-to-many"/>
        </div></td>
    </tr>
  </table>
</div>

<div  style="display:none">
  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'grps', 'error')} ">
    <g:select name="groups" from="${com.media.eximio.Groups.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.grps*.id}" class="many-to-many"/>
  </div>
  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'points', 'error')} ">
    <label for="points">
      <g:message code="user.points.label" default="Points" />

    </label>
    <g:field name="points" type="number" value="${userInstance.points}"/>
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'createdate', 'error')} ">
    <label for="createdate">
      <g:message code="user.createdate.label" default="Createdate" />

    </label>
    <g:datePicker name="createdate" precision="day"  value="${userInstance?.createdate}" default="none" noSelection="['': '']" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'updatedate', 'error')} ">
    <label for="updatedate">
      <g:message code="user.updatedate.label" default="Updatedate" />

    </label>
    <g:datePicker name="updatedate" precision="day"  value="${userInstance?.updatedate}" default="none" noSelection="['': '']" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
    <label for="accountExpired">
      <g:message code="user.accountExpired.label" default="Account Expired" />

    </label>
    <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
    <label for="accountLocked">
      <g:message code="user.accountLocked.label" default="Account Locked" />

    </label>
    <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'articles', 'error')} ">
    <label for="articles">
      <g:message code="user.articles.label" default="Articles" />

    </label>

    <ul class="one-to-many">
      <g:each in="${userInstance?.articles?}" var="a">
        <li><g:link controller="article" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
      </g:each>
      <li class="add">
      <g:link controller="article" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'article.label', default: 'Article')])}</g:link>
      </li>
    </ul>

  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
      <g:message code="user.enabled.label" default="Enabled" />

    </label>
    <g:checkBox name="enabled" value="${userInstance?.enabled}" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'friends', 'error')} ">
    <label for="friends">
      <g:message code="user.friends.label" default="Friends" />

    </label>
    <g:select name="friends" from="${com.media.eximio.auth.User.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.friends*.id}" class="many-to-many"/>
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'journals', 'error')} ">
    <label for="journals">
      <g:message code="user.journals.label" default="Journals" />

    </label>
    <g:select name="journals" from="${com.media.eximio.Journal.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.journals*.id}" class="many-to-many"/>
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
    <label for="passwordExpired">
      <g:message code="user.passwordExpired.label" default="Password Expired" />

    </label>
    <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
  </div>
</div>