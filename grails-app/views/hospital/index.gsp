<!doctype html>
<html>
  <head>
    <meta name="layout" content="adminlayout"/>
    <title>${hospitalInstance.hospname}</title>
  </head>
  <body>
    <h1>${hospitalInstance.hospname} (<g:link action="edit" id="${hospitalInstance.id}">edit</g:link>)</h1>
    <table style="width:90%">
      <tr>
        <td width="20%"><img class="avatar-large" src="${createLink(action:'hospimage', id:hospitalInstance?.id)}" /></td>
        <td width="1%">&nbsp;</td>
        <td width="79%"><g:if test="${hospitalInstance?.hospabout}">
        <span class="keyfont"><g:fieldValue bean="${hospitalInstance}" field="hospabout"/></span>
      </g:if></td>
  </tr>
  <tr>
    <td>Hospital Address</td>
    <td>:</td>
    <td><g:if test="${hospitalInstance?.hospaddr}">
    <span class="property-value" aria-labelledby="hospaddr-label"><g:fieldValue bean="${hospitalInstance}" field="hospaddr"/></span>
  </g:if></td>
</tr>
<tr>
  <td>Hospital City</td>
  <td>:</td>
  <td><g:if test="${hospitalInstance?.hospcity}">
  <span class="property-value" aria-labelledby="hospcity-label"><g:fieldValue bean="${hospitalInstance}" field="hospcity"/></span>
</g:if></td>
</tr>
<tr>
  <td>Hospital Country</td>
  <td>:</td>
  <td><g:if test="${hospitalInstance?.hospcountry}">
  <span class="property-value" aria-labelledby="hospcountry-label"><g:fieldValue bean="${hospitalInstance}" field="hospcountry"/></span>
</g:if></td>
</tr>
<tr>
  <td>Hospital Phone</td>
  <td>:</td>
  <td><g:if test="${hospitalInstance?.hospphone}">
  <span class="property-value" aria-labelledby="hospphone-label"><g:fieldValue bean="${hospitalInstance}" field="hospphone"/></span>
</g:if></td>
</tr>
<tr>
  <td>Hospital Email</td>
  <td>:</td>
  <td><g:if test="${hospitalInstance?.hospemail}">
  <span class="property-value" aria-labelledby="hospemail-label"><g:fieldValue bean="${hospitalInstance}" field="hospemail"/></span>
</g:if></td>
</tr>
<tr>
  <td>Hospital Website</td>
  <td>:</td>
  <td><g:if test="${hospitalInstance?.hospwebsite}">
  <span class="property-value" aria-labelledby="hospwebsite-label"><g:fieldValue bean="${hospitalInstance}" field="hospwebsite"/></span>
</g:if></td>
</tr>
<tr>
  <td>Hospital Doctors</td>
  <td>:</td>
  <td><g:if test="${hospitalInstance?.user}">
  <g:each in="${hospitalInstance?.user}" var="hu">
    - <span class="property-value" aria-labelledby="hospwebsite-label"><g:fieldValue bean="${hu}" field="fullname"/>&nbsp;</span>
  </g:each></g:if></td>
</tr>
<tr>
  <td style="vertical-align:top">Hospital Specialist</td>
  <td style="vertical-align:top">:</td>
  <td style="vertical-align:top"><g:if test="${hospitalInstance?.hospspecialists}">
    <ol>
  <g:each in="${hospitalInstance?.hospspecialists}" var="hs">
    <li><span class="property-value" aria-labelledby="hospwebsite-label"><g:fieldValue bean="${hs}" field="specialistname"/></li></span>
  </g:each></ol></g:if></td>
</tr>
</table>
</body>
</html>
