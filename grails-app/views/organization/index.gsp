<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout"/>
    <title>${organizationInstance}</title>
  </head>
  <body>
    <div>
      <g:link action="edit" id="${organizationInstance?.id}">edit</g:link> | <g:link action="info" id="${organizationInstance?.id}">info</g:link>
    </div>
    <h1>${organizationInstance}</h1>
    <table style="width:90%">
      <tr>
        <td width="20%"><img class="avatar-large" src="${createLink(action:'orgimage', id:organizationInstance?.id)}" /></td>
        <td width="1%">&nbsp;</td>
        <td width="79%"><g:if test="${organizationInstance?.orgabout}">
        <span class="keyfont"><g:fieldValue bean="${organizationInstance}" field="orgabout"/></span>
      </g:if></td>
  </tr>
  <tr>
    <td>Organization Address</td>
    <td>:</td>
    <td><g:if test="${organizationInstance?.orgaddress}">
    <span class="property-value" aria-labelledby="hospaddr-label"><g:fieldValue bean="${organizationInstance}" field="orgaddress"/></span>
  </g:if></td>
</tr>
<tr>
  <td>Organization City</td>
  <td>:</td>
  <td><g:if test="${organizationInstance?.orgcity}">
  <span class="property-value" aria-labelledby="hospcity-label"><g:fieldValue bean="${organizationInstance}" field="orgcity"/></span>
</g:if></td>
</tr>
<tr>
  <td>Organization Country</td>
  <td>:</td>
  <td><g:if test="${organizationInstance?.orgcountry}">
  <span class="property-value" aria-labelledby="hospphone-label"><g:fieldValue bean="${organizationInstance}" field="orgcountry"/></span>
</g:if></td>
</tr>
<tr>
  <td>Organization Phone</td>
  <td>:</td>
  <td><g:if test="${organizationInstance?.orgphone}">
  <span class="property-value" aria-labelledby="hospphone-label"><g:fieldValue bean="${organizationInstance}" field="orgphone"/></span>
</g:if></td>
</tr>
<tr>
  <td>Organization Email</td>
  <td>:</td>
  <td><g:if test="${organizationInstance?.orgemail}">
  <span class="property-value" aria-labelledby="hospemail-label"><g:fieldValue bean="${organizationInstance}" field="orgemail"/></span>
</g:if></td>
</tr>
<tr>
  <td>Organization Website</td>
  <td>:</td>
  <td><g:if test="${organizationInstance?.orgwebsite}">
  <span class="property-value" aria-labelledby="hospwebsite-label"><g:fieldValue bean="${organizationInstance}" field="orgwebsite"/></span>
</g:if></td>
</tr>
<tr>
  <td>Organization Members</td>
  <td>:</td>
  <td><g:if test="${organizationInstance?.user}">
  <g:each in="${organizationInstance?.user}" var="hu">
    - <span class="property-value" aria-labelledby="hospwebsite-label"><g:fieldValue bean="${hu}" field="fullname"/>&nbsp;</span>
  </g:each></g:if></td>
</tr>
</table>
</body>
</html>
