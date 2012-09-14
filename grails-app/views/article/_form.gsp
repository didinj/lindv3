<%@ page import="com.media.eximio.Article" %>
<%@ page import="com.media.eximio.auth.User" %>

<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'user', 'error')} required" style="display: none">
  <label for="user">
    <g:message code="article.user.label" default="User" />
    <span class="required-indicator">*</span>
  </label>
  <g:textField id="user" name="user.id" required="" value="${userInstance?.id}" />
</div>

<table>
  <tr>
    <td>
      <img class="avatar-medium" align="middle" src="${createLink(controller:'home', action:'avatar_image')}" />
    </td>
    <td>
      <span>Written by:</span><br />
      <span>${userInstance?.fullname}</span><br />
      <div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'publish', 'error')} ">
        <label for="publish">
          <g:message code="article.publish.label" default="Publish" />
        </label>
        <g:checkBox name="publish" value="${articleInstance.publish.toString()}" />
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <span>Title :</span>
    </td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'articletitle', 'error')} required">
        <g:textField name="articletitle" class="longtextbox" required="" value="${articleInstance?.articletitle}"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <span>Abstract :</span>
    </td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'articleabstract', 'error')} required">
        <richui:richTextEditor name="articleabstract" value="${articleInstance?.articleabstract}" />
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <span>Content :</span>
    </td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'articlecontent', 'error')} required">
        <richui:richTextEditor name="articlecontent" value="${articleInstance?.articlecontent}"/>
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <span>Image :</span>
    </td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'articleimage', 'error')} ">
        <input type="file" id="articleimage" name="articleimage" />
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <span>Reference :</span>
    </td>
    <td>
      <div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'articlereference', 'error')} required">
        <g:textField name="articlereference" required="" class="longtextbox" value="${articleInstance?.articlereference}"/>
      </div>
    </td>
  </tr>
</table>