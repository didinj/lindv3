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
            <td width="100%" class="headerrb headerprof">${userInstance?.fullname}</td>
          </tr>
        </table>	  

      </div>
      <div id="featdocbody" class="round6bottom"> 
        <table>
          <tbody>
            <tr>
              <td rowspan="4" class="center" width="20%"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:userInstance?.id)}" /></td>
              <td width="20%"><span class="keyfont">Specialist</span></td>
              <td width="30%"><span class="valfont"><g:link controller='search' params='["q":userInstance?.specialties]' action='index'>${userInstance?.specialties}</g:link></span></td>
              <td rowspan="4" class="center" width="20%"><span class="keyfont">
                  <span class="valfont">${fieldValue(bean: result, field: "points")}</span></td>
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
      <div id="schedule" class="round6">
        <span class="valfont">Schedules</span><br>
        <span class="keyfont">
          <g:each in="${userInstance.hospital}" var="h">
            <g:link controller="hospital" action="show" id="${h.id}">${h?.hospname}</g:link><br>
            <g:if test="${h.schedule}">
              <ul class="list">
                <g:each in="${h.schedule}" var="hs">
                  <li><span class="property-value" aria-labelledby="schedule-label"><g:link controller="schedule" action="show" id="${hs.id}">${hs?.encodeAsHTML()}</g:link></span></li>
                </g:each></ul>
            </g:if>
            <g:else>
              <ul class="list">
                <li><span class="property-value" aria-labelledby="schedule-label">No Schedules Found</span></li>
              </ul>
            </g:else>
            <br>
          </g:each>
        </span>
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
    </div>
    <div id="rightpublicfront">
      <div id="adv1">
        <g:img dir="images" file="uob.png" />
      </div>
      <div id="adv2">
        <g:img dir="images" file="md.png" />
      </div>
    </div>
    <div id="bottompublicfront">
      &nbsp;
    </div>
  </div>
</body>
</html>