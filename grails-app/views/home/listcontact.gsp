<%@ page import="com.media.eximio.auth.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <title>Connection List</title>
  </head>
  <body>
    <script type="text/javascript">
      function addrequest(param1,param2) {
        ${remoteFunction(controller:'friendRequest',
        action:'save',
        params:'\'fromUser=\'+param1+\'&toUser=\'+param2',onSuccess:'reqsent()')};
      }      
      
      function reqsent() {
      }
    </script> 
    <div id="publicfront">
      <div id="topbanner">
        <div id="innertopbanner" class="round6">
          &nbsp;
        </div>
      </div>
      <div id="leftpublicfront">
        <h1>Connection List</h1>
        <g:if test="${connInstanceList.size()==0}">
          <div>No Connection Found</div>
        </g:if>
        <div class="results">
          <ul class="doctorgrid">
            <g:each var="connInstance" in="${connInstanceList}" status="i">
              <li>
              <sec:ifNotLoggedIn>
                <div id="featdocheader" class="round6top">
                  <g:link controller="public" action="show" id="${connInstance.id}">${fieldValue(bean: connInstance, field: "fullname")}</g:link>
                </div>
              </sec:ifNotLoggedIn>
              <sec:ifLoggedIn>
                <div id="featdocheader" class="round6top">
                  <table id="featdocheadertable">
                    <tr>
                      <td width="80%" class="headerrb"><g:link controller="public" action="show" id="${connInstance.id}">${fieldValue(bean: connInstance, field: "fullname")}</g:link></td>
                    <td width="20%" valign="middle"><g:link controller="message" action="create" id="${connInstance.id}"><g:img dir="images" file="icon-send-message.png" align="middle" /></g:link></td>
                    </tr>
                  </table>                    
                </div>
              </sec:ifLoggedIn>
              <div id="featdocbody" class="round6bottom"> 
                <table>
                  <tbody>
                    <tr>
                      <td rowspan="4" class="center" width="40%"><g:link controller="public" action="show" id="${connInstance.id}"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:connInstance.id)}" /></g:link></td>
                  <td width="60%"><span class="keyfont">Specialist</span><br><span class="valfont">${fieldValue(bean: connInstance, field: "specialties")}</span></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Hospital</span><br><span class="valfont">${fieldValue(bean: connInstance, field: "hospital")}</span></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Organization</span><br><span class="valfont">${fieldValue(bean: connInstance, field: "organization")}</span></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Score</span><br><span class="valfont">${fieldValue(bean: connInstance, field: "points")}</span></td></td>
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
        <g:render template="../commons/advertisement" />
      </div>
      <div id="bottompublicfront">
        <div class="pagination">
          <g:paginate total="${connInstanceTotal}" />
        </div>
      </div>
    </div>
  </body>
</html>
