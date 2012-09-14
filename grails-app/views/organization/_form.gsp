<%@ page import="com.media.eximio.Organization" %>


<table>
  <g:if test="${organizationInstance.orgadminid}">
    <g:hiddenField name="orgadminid" value="${organizationInstance.orgadminid}" />
  </g:if>
  <g:else>
    <tr>
      <td>Hospital Admin User</td>
      <td><div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgadminid', 'error')} required">
          <select name="orgadminid">
            <g:each in="${users}" var="us">
              <option value="${us.id}">${us.username}</option>
            </g:each>
          </select></div>
      </td>
    </tr>
  </g:else>
  <tr>
    <td>About</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgabout', 'error')} ">
        <g:textArea name="orgabout" value="${organizationInstance.orgabout}" cols="80" rows="5"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>Members</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'user', 'error')} ">
        <g:select name="user" from="${com.media.eximio.auth.User.list()}" multiple="multiple" optionKey="id" size="8" value="${organizationInstance?.user*.id}" class="many-to-many"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>Organization Name</td>
    <td><div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgname', 'error')} ">
        <g:textField name="orgname" value="${organizationInstance?.orgname}" class="medtextbox"/>
      </div></td>
  </tr>
  <tr>
    <td>Organization Address</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgaddress', 'error')} ">
        <g:textField name="orgaddress" value="${organizationInstance?.orgaddress}" class="longtextbox"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>City</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgcity', 'error')} ">
        <g:textField name="orgcity" value="${organizationInstance?.orgcity}" class="medtextbox"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>Phone</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgphone', 'error')} ">
        <g:textField name="orgphone" value="${organizationInstance?.orgphone}" class="shortextbox"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>Country</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgcountry', 'error')} ">
        <g:textField name="orgcountry" value="${organizationInstance?.orgcountry}" class="medtextbox"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>Email</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgemail', 'error')} ">
        <g:field type="email" name="orgemail" value="${organizationInstance?.orgemail}" class="medtextbox"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>Website</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgwebsite', 'error')} ">
        <g:field type="url" name="orgwebsite" value="${organizationInstance?.orgwebsite}" class="medtextbox"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>Image</td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: organizationInstance, field: 'orgimage', 'error')} required">
        <input type="file" id="orgimage" name="orgimage" />
      </div>
    </td>
  </tr>
</table>