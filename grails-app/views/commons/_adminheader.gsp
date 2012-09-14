<div id="adminheader">
  <div id="lindlogo">
    <h1>LIND ADMIN PAGE</h1>
  </div>
  <div id="adminuser">
    <strong><sec:username /> | <g:link controller="logout">LOGOUT</g:link></strong>
  </div>
</div>
<div id="adminnav">
  <div id="menu">
    <sec:ifLoggedIn>
      <sec:ifAllGranted roles="ROLE_ADMIN">
        <ul id="nav">
          <li><a href="${createLink(controller:'admin', action:'index')}">Home</a></li>
          <li><a href="${createLink(controller:'admin', action:'user')}">User</a></li>
          <li><a href="${createLink(controller:'journal', action:'index')}">Journal</a></li>
          <li><a href="${createLink(controller:'events', action:'index')}">Events</a></li>
          <li><a href="${createLink(controller:'textbooks', action:'index')}">Textbooks</a></li>
          <li><a href="${createLink(controller:'home', action:'listcontact')}">Application</a>
            <ul>
              <li><a href="${createLink(controller:'hospital', action:'list')}">Hospital</a></li>
              <li><a href="${createLink(controller:'organization', action:'list')}">Organization</a></li>
            </ul>
          </li>
          <li><a href="${createLink(controller:'advertising', action:'index')}">Advertising</a>
            <ul>
              <li><a href="${createLink(controller:'advertising', action:'create')}">Create</a></li>
            </ul>
          </li>
        </ul>
      </sec:ifAllGranted>
    </sec:ifLoggedIn>
  </div>
</div>