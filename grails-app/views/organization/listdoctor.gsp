<%@ page import="com.media.eximio.auth.User" %>
<!doctype html>

<html>
  <head>
    <meta name="layout" content="main">
    <title>Sample title</title>
  </head>
  <body>
    <div id="publicfront">
      <div id="topbanner">
        <div id="innertopbanner" class="round6">
          &nbsp;
        </div>
      </div>
      <div id="leftpublicfront">
        <div class="results">
          <h1>All Members of ${organization}</h1>
          <ul class="doctorgrid">
            <g:each in="${userInstanceList}" var="u">
              <li>
              <sec:ifNotLoggedIn>
                <div id="featdocheader" class="round6top">
                  <g:link controller="public" action="show" id="${u.id}">${fieldValue(bean: u, field: "fullname")}</g:link>
                </div>
              </sec:ifNotLoggedIn>
              
              <div id="featdocbody" class="round6bottom"> 
                <table>
                  <tbody>
                    <tr>
                      <td rowspan="4" class="center" width="40%"><g:link controller="public" action="show" id="${u.id}"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:u.id)}" /></g:link></td>
                  <td width="60%"><span class="keyfont">Specialist</span><br><span class="valfont">${fieldValue(bean: u, field: "specialties")}</span></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Hospital</span><br><g:each in="${u.hospital}" var="h"><span class="valfont"><g:link controller="hospital" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>&nbsp;</g:each></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Organization</span><br><g:each in="${u.organization}" var="org"><span class="valfont"><g:link controller="organization" action="show" id="${org.id}">${org?.encodeAsHTML()}</g:link></span>&nbsp;</g:each></td>
                  </tr>
                  </tbody>
                </table>
              </div>
              </li>
            </g:each>
          </ul>
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
        <div class="pagination">
          <g:paginate total="${userInstanceTotal}" />
        </div>
      </div>
    </div>
  </body>
</html>
