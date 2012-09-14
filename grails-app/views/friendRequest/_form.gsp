<%@ page import="com.media.eximio.FriendRequest" %>



<div class="fieldcontain ${hasErrors(bean: friendRequestInstance, field: 'fromUser', 'error')} required">
	<label for="fromUser">
		<g:message code="friendRequest.fromUser.label" default="From User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fromUser" name="fromUser.id" from="${com.media.eximio.auth.User.list()}" optionKey="id" required="" value="${friendRequestInstance?.fromUser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: friendRequestInstance, field: 'toUser', 'error')} required">
	<label for="toUser">
		<g:message code="friendRequest.toUser.label" default="To User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="toUser" name="toUser.id" from="${com.media.eximio.auth.User.list()}" optionKey="id" required="" value="${friendRequestInstance?.toUser?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: friendRequestInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="friendRequest.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${friendRequestInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: friendRequestInstance, field: 'createDate', 'error')} required">
	<label for="createDate">
		<g:message code="friendRequest.createDate.label" default="Create Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createDate" precision="day"  value="${friendRequestInstance?.createDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: friendRequestInstance, field: 'updateDate', 'error')} ">
	<label for="updateDate">
		<g:message code="friendRequest.updateDate.label" default="Update Date" />
		
	</label>
	<g:datePicker name="updateDate" precision="day"  value="${friendRequestInstance?.updateDate}" default="none" noSelection="['': '']" />
</div>

