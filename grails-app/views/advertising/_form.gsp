<%@ page import="com.media.eximio.Advertising" %>



<div class="fieldcontain ${hasErrors(bean: advertisingInstance, field: 'advimage', 'error')} ">
  <label for="advimage">
    <g:message code="advertising.advimage.label" default="Advimage" />

  </label>
  <input type="file" id="advimage" name="advimage" />
</div>

<div class="fieldcontain ${hasErrors(bean: advertisingInstance, field: 'advdesc', 'error')} ">
  <label for="advdesc">
    <g:message code="advertising.advdesc.label" default="Advdesc" />

  </label>
  <g:textField name="advdesc" value="${advertisingInstance?.advdesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: advertisingInstance, field: 'advclick', 'error')} ">
  <label for="advclick">
    <g:message code="advertising.advclick.label" default="Advclick" />

  </label>
  <g:field name="advclick" type="number" value="${advertisingInstance.advclick}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: advertisingInstance, field: 'users', 'error')} ">
  <label for="users">
    <g:message code="advertising.users.label" default="Users" />
    <g:select name="users" from="${com.media.eximio.auth.User.list()}" multiple="multiple" optionKey="id" size="8" value="${advertisingInstance?.users*.id}" class="many-to-many"/>
  </label>
</div>

<div class="fieldcontain ${hasErrors(bean: advertisingInstance, field: 'createdate', 'error')} " style="display:none">
  <label for="createdate">
    <g:message code="advertising.createdate.label" default="Createdate" />

  </label>
  <g:datePicker name="createdate" precision="day"  value="${advertisingInstance?.createdate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: advertisingInstance, field: 'advtype', 'error')} ">
  <label for="advtype">
    <g:message code="advertising.advtype.label" default="Advtype" />

  </label>
  <select name="advtype">
    <option value="banner">Banner</option>
    <option value="right1">Right Panel1</option>
    <option value="right2">Right Panel2</option>
  </select>
</div>

