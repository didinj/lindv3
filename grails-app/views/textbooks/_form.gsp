<%@ page import="com.media.eximio.Textbooks" %>



<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'tbauthor', 'error')} required">
	<label for="tbauthor">
		<g:message code="textbooks.tbauthor.label" default="Tbauthor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tbauthor" required="" value="${textbooksInstance?.tbauthor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'tbtitle', 'error')} required">
	<label for="tbtitle">
		<g:message code="textbooks.tbtitle.label" default="Tbtitle" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tbtitle" required="" value="${textbooksInstance?.tbtitle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'tbabstract', 'error')} required">
	<label for="tbabstract">
		<g:message code="textbooks.tbabstract.label" default="Tbabstract" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tbabstract" required="" value="${textbooksInstance?.tbabstract}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'tbcontent', 'error')} required">
	<label for="tbcontent">
		<g:message code="textbooks.tbcontent.label" default="Tbcontent" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tbcontent" required="" value="${textbooksInstance?.tbcontent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'tbreference', 'error')} required">
	<label for="tbreference">
		<g:message code="textbooks.tbreference.label" default="Tbreference" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tbreference" required="" value="${textbooksInstance?.tbreference}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="textbooks.user.label" default="User" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'tbimage', 'error')} ">
	<label for="tbimage">
		<g:message code="textbooks.tbimage.label" default="Tbimage" />
		
	</label>
	<input type="file" id="tbimage" name="tbimage" />
</div>

<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'createdate', 'error')} required">
	<label for="createdate">
		<g:message code="textbooks.createdate.label" default="Createdate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdate" precision="day"  value="${textbooksInstance?.createdate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: textbooksInstance, field: 'updatedate', 'error')} required">
	<label for="updatedate">
		<g:message code="textbooks.updatedate.label" default="Updatedate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedate" precision="day"  value="${textbooksInstance?.updatedate}"  />
</div>

