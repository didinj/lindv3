<%@ page import="com.media.eximio.auth.User" %>

<script type="text/javascript">
  $(document).ready(function() {
    $("#username").val("");
    $("#password").val("");
    $("#specialties").autocomplete({
      source: '<g:createLink controller='specialist' action='splist'/>'
    });
    $("#city").autocomplete({
      source: '<g:createLink controller='cities' action='citylist'/>'
    });
  });
  
  function validatepassword() {
    var password=$("#password").val();
    var repassword=$("#repassword").val();
    if(password!=repassword) {
      alert("Password not match, please re enter!");
    }
  }
</script>

<table style="width: 100%" class="bordbot">
  <tr>
    <td width="30%">Email</td>
    <td width="70%"><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
        <g:textField name="username" required="" style="width:350px"/>
      </div></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
        <g:field type="password" id="password" name="password" required="" style="width:350px"/>
      </div></td>
  </tr>
  <tr>
    <td>Confirm Password</td>
    <td><div>
        <g:field type="password" id="repassword" name="repassword" required="" style="width:350px" onblur="validatepassword()"/> 
      </div></td>
  </tr>                                   
  <tr>
    <td>Full Name</td>
    <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fullname', 'error')} ">
        <g:textField name="fullname" style="width:350px"/>
      </div></td>
  </tr>  
  <tr>
    <td>Specialties</td>
    <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'specialties', 'error')} ">
        <g:textField name="specialties" id="specialties" style="width:350px"/>
      </div></td>
  </tr>  
  <tr>
    <td>City</td>
    <td><div class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} ">
        <g:textField name="city" id="city" style="width:350px"/>
      </div></td>
  </tr>
  <tr>
    <td>Country</td>
    <td><g:countrySelect name="country" value="${country}" noSelection="['':'-Choose your country-']"/></td>
  </tr>
</table>
<div style="display: none">
  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'createdate', 'error')} ">
    <label for="createdate">
      <g:message code="user.createdate.label" default="Createdate" />

    </label>
    <g:datePicker name="createdate" precision="day"  value="${userInstance?.createdate}" default="none" noSelection="['': '']" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'updatedate', 'error')} ">
    <label for="updatedate">
      <g:message code="user.updatedate.label" default="Updatedate" />

    </label>
    <g:datePicker name="updatedate" precision="day"  value="${userInstance?.updatedate}" default="none" noSelection="['': '']" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
    <label for="accountExpired">
      <g:message code="user.accountExpired.label" default="Account Expired" />

    </label>
    <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
  </div>

  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
    <label for="accountLocked">
      <g:message code="user.accountLocked.label" default="Account Locked" />

    </label>
    <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
  </div>
  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
      <g:message code="user.enabled.label" default="Enabled" />

    </label>
    <g:checkBox name="enabled" value="${userInstance?.enabled}" />
  </div>
  <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
    <label for="passwordExpired">
      <g:message code="user.passwordExpired.label" default="Password Expired" />

    </label>
    <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
  </div>
</div>