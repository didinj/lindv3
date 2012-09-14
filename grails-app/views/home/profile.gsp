<%@ page import="com.media.eximio.auth.User" %>

<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <h1>Profile Page</h1>
      <div id="featdocheader" class="round6top">
        <table id="featdocheadertable">
          <tr>
            <td width="80%" class="headerrb headerprof">${userInstance?.fullname}</td>
            <td width="20%"><g:link action="edit" class="edit-profil" id="${userInstance?.id}">Edit</g:link></td>
          </tr>
        </table>
      </div>
      <div id="featdocbody" class="round6bottom"> 
        <table>
          <tbody>
            <tr>
              <td rowspan="4" class="center" width="20%"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:userInstance?.id)}" /></td>
              <td width="10%"><span class="keyfont">Specialist</span></td>
              <td width="30%"><span class="valfont"><g:link controller='search' params='["q":userInstance?.specialties]' action='index'>${userInstance?.specialties}</g:link></span></td>
              <td rowspan="4" class="score center" width="20%"><span class="nilai-score valfont">${userInstance?.points}</span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Hospital</span></td>
              <td><span class="valfont"><g:each in="${userInstance.hospital}" var="h">
                    <span class="property-value" aria-labelledby="hospital-label"><g:link controller="hospital" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
                  </g:each></span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Organization</span></td>
              <td><span class="valfont"><g:each in="${userInstance.organization}" var="o">
                    <span class="property-value" aria-labelledby="organization-label"><g:link controller="organization" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
                  </g:each></span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Location</span></td></td>
              <td><span class="valfont">${userInstance.city}, ${userInstance.country}</span></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div id="otherprofile" class="round6">
        <div>
          <span class="valfont">Board Certifications</span><br>

        </div>
        <div>
          <span class="valfont">Post Graduate Clinical Training</span><br>
          <span class="keyfont">
            <g:each in="${userInstance.trainning}" var="t">
              <span class="property-value" aria-labelledby="trainning-label"><g:link controller="trainning" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
            </g:each>
          </span>
        </div>
        <div>
          <span class="valfont">Medical School</span><br>
          <span class="keyfont"><g:each in="${userInstance.education}" var="e">
              <span class="property-value" aria-labelledby="education-label"><g:link controller="education" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
            </g:each></span>
        </div>
        <div>
          <span class="valfont">Membership</span><br>
        </div>
      </div>
      <div id="schedule" class="round6">
        <span class="valfont">Schedules</span><br>
        <span class="keyfont">
          <g:each in="${userInstance.schedule}" var="s">
            <span class="property-value" aria-labelledby="schedule-label"><g:link controller="schedule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
          </g:each>
        </span>
      </div>      
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
      <div id="friendlist">
        <h1>Connections</h1>
        <g:each in="${connInstance}" var="conn">        
          <table>
            <tr>
              <td rowspan="2"><g:link action="showconnection"><img class="avatar-small" src="${createLink(controller:'public', action:'avatar_image', id:conn.id)}" /></g:link></td>
            <td><g:link action="showconnection" id="${conn.id}">${conn.fullname}</g:link><br />
${conn.specialties}
            </td>
            </tr>
            <tr>
              <td><g:link controller="message" action="create" id="${conn.id}"><g:img dir="images" file="icon-send-message.png" align="middle" /> Send Message</g:link></td>
            </tr>
          </table>
        </g:each>  
      </div>
    </div>
  </div>
</body>
</html>
