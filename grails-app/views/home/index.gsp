<%@ page import="com.media.eximio.auth.User" %>
<%@ page import="com.media.eximio.Article" %>

<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <div id="otherprofile" class="round6">
        <table width="100%">
          <tr>
            <td width="20%" class="bordbot"><span>EVENTS</span></td>
            <td width="80%" class="bordbot" align="right"><g:link action="listevents"><span>ALL EVENTS</span></g:link></td>
          </tr>
          <g:each in="${eventsInstance}" var="e">
            <tr>
              <td>
            <g:link action="showevent" id="${e.id}"><img class="avatar-medium" src="${createLink(controller:'events',action:'eventimage', id:e.id)}" /></g:link>
              </td>
              <td>
                <div id="journalhead">
                  ${e.eventname}
                </div>
                <div id="journalabstract" class="bordbot" style="font-size: 80% !important">
                  <g:if test="${e.eventdesc.size()>120}">
                    <g:set var="jabstract" value="${e.eventdesc[0..120] + '...'}" /></g:if>
                  <g:else>
                    <g:set var="jabstract" value="${e.eventdesc}" />
                  </g:else>
                    ${jabstract} <g:link action="showevent" id="${e.id}">Read More <g:img dir="images" file="btn-detail.png" align="middle"/></g:link>
                </div>
              </td>
            </tr>
          </g:each>
        </table>
      </div>
      
      <div id="journallist">
        <table>
          <tr>
            <td width="50%" class="bordbot"><span>JOURNAL</span></td>
            <td width="50%" class="bordbot" align="right"><g:link action="listjournal"><span>ALL JOURNAL</span></g:link></td>
          </tr>
          <g:each in="${journalInstanceList}" var="j">
            <tr>
              <td colspan="2">
                <div id="journalhead">
${j.journaltitle}
                </div>
                <div id="journalabstract" class="bordbot">
                  <g:if test="${j.journalabstract.size()>120}">
                    <g:set var="jabstract" value="${j.journalabstract[0..120] + '...'}" /></g:if>
                  <g:else>
                    <g:set var="jabstract" value="${j.journalabstract}" />
                  </g:else>
${jabstract} <g:link action="showjournal" id="${j.id}">Read More <g:img dir="images" file="btn-detail.png" align="middle"/></g:link>
                </div>
              </td>
            </tr>
          </g:each>
        </table>
      </div>      
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
      <div id="friendlist">
        <h1>Connections</h1>
        <g:each in="${connInstance}" var="conn">        
          <table>
            <tr>
              <td rowspan="2"><g:link action="showconnection"><img class="avatar-small" src="${createLink(controller:'public', action:'avatar_image', id:conn.id)}" /></g:link></td>
            <td><g:link action="showconnection" id="${conn.id}">${conn.fullname}</g:link><br />
${conn.specialties}
            </td>
            </tr>
            <tr>
              <td><g:link controller="message" action="create" id="${conn.id}"><g:img dir="images" file="icon-send-message.png" align="middle" /> Send Message</g:link></td>
            </tr>
          </table>
        </g:each>  
      </div>
    </div>
    <div id="bottompublicfront">
      <div id="myarticles">
        <h1>ARTICLES</h1>
        <ul class="myarticlegrid">
          <g:each in="${articleInstanceList}" status="i" var="articleInstance">
            <li>
              <table>
                <tr>
                  <td><g:link controller="article" action="show" id="${articleInstance.id}"><img align="middle" class="image100" src="${createLink(controller:'article', action:'article_image',id:articleInstance.id)}" /></g:link></td>
                </tr>
                <tr>
                  <td>
                <g:if test="${articleInstance.articletitle.size()>60}">
                  <g:set var="title" value="${articleInstance.articletitle[0..60] + '...'}" /></g:if>
                <g:else>
                  <g:set var="title" value="${articleInstance.articletitle}" />
                </g:else>
                <g:link controller="article" action="show" id="${articleInstance.id}">${title.encodeAsHTML()}</g:link>
                </td>
                </tr>
                <tr>
                  <td>
                <g:if test="${articleInstance.articleabstract.size()>120}">
                  <g:set var="abstracts" value="${articleInstance.articleabstract[0..120] + '...'}" /></g:if>
                <g:else>
                  <g:set var="abstracts" value="${articleInstance.articleabstract}" />
                </g:else>
${abstracts}
                </td>
                </tr>
              </table>
            </li>
          </g:each>
        </ul>
      </div>
    </div>
  </div>
</body>
</html>