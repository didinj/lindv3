<ul class="doctorgrid">
  <g:if test="${searchResult}">
    <g:each var="result" in="${searchResult.results}" status="index">
      <li>
      <sec:ifNotLoggedIn>
        <div id="featdocheader" class="round6top">
          <g:link controller="public" action="show" id="${result.id}">${fieldValue(bean: result, field: "fullname")}</g:link>
        </div>
      </sec:ifNotLoggedIn>
      <sec:ifLoggedIn>
        <div id="featdocheader" class="round6top">
          <table id="featdocheadertable">
            <tr>
              <td width="80%" class="headerrb"><g:link controller="public" action="show" id="${result.id}">${fieldValue(bean: result, field: "fullname")}</g:link></td>
            <td width="10%" valign="middle"><a href="#" onclick="addrequest(${currentUser.id},${result.id})"><g:img dir="images" file="icon-add-connection.png" align="middle" /></a></td>
            <td width="10%" valign="middle"><g:link controller="message" action="create"><g:img dir="images" file="icon-send-message.png" align="middle" /></g:link></td>
            </tr>
          </table>                    
        </div>
      </sec:ifLoggedIn>
      <div id="featdocbody" class="round6bottom"> 
        <table>
          <tbody>
            <tr>
              <td rowspan="4" class="center" width="40%"><g:link controller="public" action="show" id="${result.id}"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:result.id)}" /></g:link></td>
          <td width="60%"><span class="keyfont">Specialist</span><br><span class="valfont">${fieldValue(bean: result, field: "specialties")}</span></td>
          </tr>
          <tr>
            <td><span class="keyfont">Hospital</span><br><g:each in="${result.hospital}" var="h"><span class="valfont"><g:link controller="hospital" action="show" id="${h.id}">${fieldValue(bean: h, field: "hospname")}</g:link></span>&nbsp;</g:each></td>
          </tr>
          <tr>
            <td><span class="keyfont">Organization</span><br><span class="valfont">${fieldValue(bean: result, field: "organization")}</span></td>
          </tr>
          <tr>
            <td><span class="keyfont">Score</span><br><span class="valfont">${fieldValue(bean: result, field: "points")}</span></td></td>
          </tr>
          </tbody>
        </table>
      </div>
      </li>
    </g:each>
  </g:if>
  <g:else>
    No Doctors Found
  </g:else>
</ul>