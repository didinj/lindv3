<%@ page import="com.media.eximio.auth.User" %>

    <script type="text/javascript">
      $(document).ready(function() {
        $("#specialties").autocomplete({
          source: '<g:createLink controller='specialist' action='splist'/>'
        });
      });
    </script>  

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
  <label for="username">
    <g:message code="user.username.label" default="Username" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
  <label for="password">
    <g:message code="user.password.label" default="Password" />
    <span class="required-indicator">*</span>
  </label>
  <g:field type="password" name="password" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fullname', 'error')} ">
  <label for="fullname">
    <g:message code="user.fullname.label" default="Fullname" />

  </label>
  <g:textField name="fullname" value="${userInstance?.fullname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'specialties', 'error')} ">
  <label for="specialties">
    <g:message code="user.specialties.label" default="Specialties" />

  </label>
  <g:textField name="specialties" id="specialties" value="${userInstance?.specialties}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'education', 'error')} ">
  <label for="education">
    <g:message code="user.education.label" default="Education" />

  </label>

  <ul class="one-to-many">
    <g:each in="${userInstance?.education?}" var="e">
      <li><g:link controller="education" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
    <g:link controller="education" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'education.label', default: 'Education')])}</g:link>
    </li>
  </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'trainning', 'error')} ">
  <label for="trainning">
    <g:message code="user.trainning.label" default="Trainning" />

  </label>

  <ul class="one-to-many">
    <g:each in="${userInstance?.trainning?}" var="t">
      <li><g:link controller="trainning" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
    <g:link controller="trainning" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trainning.label', default: 'Trainning')])}</g:link>
    </li>
  </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} ">
  <label for="city">
    <g:message code="user.city.label" default="City" />

  </label>
  <g:textField name="city" value="${userInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'country', 'error')} ">
  <label for="country">
    <g:message code="user.country.label" default="Country" />

  </label>
  <g:textField name="country" value="${userInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'avatar', 'error')} ">
  <label for="avatar">
    <g:message code="user.avatar.label" default="Avatar" />

  </label>
  <input type="file" id="avatar" name="avatar" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'hospital', 'error')} ">
  <label for="hospital">
    <g:message code="user.hospital.label" default="Hospital" />

  </label>
  <g:select name="hospital" from="${com.media.eximio.Hospital.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.hospital*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'schedule', 'error')} ">
  <label for="schedule">
    <g:message code="user.schedule.label" default="Schedule" />

  </label>

  <ul class="one-to-many">
    <g:each in="${userInstance?.schedule?}" var="s">
      <li><g:link controller="schedule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
    <g:link controller="schedule" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'schedule.label', default: 'Schedule')])}</g:link>
    </li>
  </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'organization', 'error')} ">
  <label for="organization">
    <g:message code="user.organization.label" default="Organization" />

  </label>
  <g:select name="organization" from="${com.media.eximio.Organization.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.organization*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'groups', 'error')} ">
  <label for="groups">
    <g:message code="user.groups.label" default="Groups" />

  </label>
  <g:select name="groups" from="${com.media.eximio.Groups.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.groups*.id}" class="many-to-many"/>
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