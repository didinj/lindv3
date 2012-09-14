<!doctype html>
<html>
  <head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
  </head>
  <body>
    <div id="publicfront">
      <div id="topbanner">
        <div id="innertopbanner" class="round6">
          &nbsp;
        </div>
      </div>
      <div id="leftpublicfront">
        <h1>Sign-in to your account</h1>
        <div id="loginbox" class="round3">
          <div id="leftloginbox">
            <div class='fheader'><g:message code="springSecurity.login.header"/></div>

          <g:if test='${flash.message}'>
            <div class='login_message'>${flash.message}</div>
          </g:if>

          <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
		  <table>
		  <tbody>
			<tr>
				<td>
					<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				</td> 
				<td>
					<input type='text' class='text_' name='j_username' id='username'/>
				</td>
			</tr>
            <tr>
				<td>
					<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				</td>
				<td>
					<input type='password' class='text_' name='j_password' id='password'/>
				</td>
            </tr>
			<tr>
				<td>
					<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
				</td>
				<td>
					<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
					<input type='submit' id="submit" class="round3" value='${message(code: "springSecurity.login.button")}'/>
				</td>
			</tr>
			</tbody>
			</table>
          </form>
          </div>
          <div id="rightloginbox">
            <div class="fheader">Not a member?</div>
            <p>If you are a doctor or medical professional, you can register to our network.</p>
            <p><g:link controller="public" action="createaccount" class="a-link round3">Create an account</g:link></p>
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
    </div>
  </body>
</html>