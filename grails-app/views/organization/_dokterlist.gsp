<ul class="doctorgrid">
  <g:if test="${orgDoctor}">
    <g:each in="${orgDoctor}" var="u">
      <li>
        <table>
          <tbody>
            <tr>
              <td rowspan="3" class="center" width="30%"><g:link controller="public" action="show" id="${u.id}"><img class="avatar-medium" src="${createLink(action:'avatar_image', id:u.id)}" /></g:link></td>
          <td width="70%"><span class="valfont"><g:link controller="public" action="show" id="${u.id}">${u.fullname}</g:link></span></td>
          </tr>
          <tr>
            <td><span class="valfont">${u.specialties}</span></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          </tbody>
        </table>
      </li>
    </g:each>
  </g:if>
  <g:else>
    No Doctors Found
  </g:else>
</ul>

