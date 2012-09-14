<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main">
    <title>Search Results</title>
  </head>
  <body>   
    <script type="text/javascript">
      $(document).ready(function(){
        //showresult($("#currentParams").val());

        $("#byhospital").autocomplete({
          source: '<g:createLink controller='hospital' action='hosplist'/>',
          select: function( event, ui ) {
            var hosp = ui.item.value;
            var cur = $("#currentParams").val();
            $("#q2").val(cur+" "+hosp);
            $("#searchupdate").click();
          }
        });
        $("#bylocation").autocomplete({
          source: '<g:createLink controller='cities' action='citylist'/>',
          select: function( event, ui ) {
            var loc = ui.item.value;
            var cur = $("#currentParams").val();
            $("#q2").val(cur+" "+loc);
            $("#searchupdate").click();
          }
        });
      });
      
      function addrequest(param1,param2) {
${remoteFunction(controller:'friendRequest',
  action:'save',
  params:'\'fromUser=\'+param1+\'&toUser=\'+param2',onSuccess:'reqsent()')};
      }      
      
      function reqsent() {
      }
      
      function showresult(param1) {
${remoteFunction(action:'searchresults',
  params:'\'q=\'+param1',update:'searchresults')};
      }
    </script>  
    <div id="publicfront">
      <div id="topbanner">
        <div id="innertopbanner" class="round6">
          &nbsp;
        </div>
      </div>
      <div id="leftpublicfront">
        <h1>Search Results</h1>
        <g:set var="haveQuery" value="${params.q?.trim()}" />
        <g:set var="haveResults" value="${searchResult?.results}" />
        <div class="searchtitle">
          <span>
            <g:if test="${haveQuery && haveResults}">
              Showing <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
              results for <strong>${params.q}</strong>
            </g:if>
            <g:else>
              &nbsp;
            </g:else>
          </span>
        </div>

        <g:if test="${haveQuery && !haveResults && !parseException}">
          <p>Nothing matched your query - <strong>${params.q}</strong></p>
          <g:if test="${!searchResult?.suggestedQuery}">
            <p>Suggestions:</p>
            <ul>
              <li>Try a suggested query: <g:link controller="searchable" action="index" params="[q: params.q, suggestQuery: true]">Search again with the <strong>suggestQuery</strong> option</g:link><br />
              <em>Note: Suggestions are only available when classes are mapped with <strong>spellCheck</strong> options, either at the class or property level.<br />
                The simplest way to do this is add <strong>spellCheck "include"</strong> to the domain class searchable mapping closure.<br />
                See the plugin/Compass documentation Mapping sections for details.</em>
              </li>
            </ul>
          </g:if>
        </g:if>
        <g:if test="${searchResult?.suggestedQuery}">
          <p>Did you mean <g:link controller="searchable" action="index" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
        </g:if>

        <g:if test="${parseException}">
          <p>Your query - <strong>${params.q}</strong> - is not valid.</p>
          <p>Suggestions:</p>
          <ul>
            <li>Fix the query: see <a href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples</li>
            <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
              <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong></em><br />
                <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
              </li>
              <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong></em><br />
                <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
                <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link controller="searchable" action="index" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
              </li>
            </g:if>
          </ul>
        </g:if>

        <g:if test="${haveResults}">
          <div>
            <g:if test="${searchby=='specialist'&&termcount=='1'}">
              <g:textField name="byhospital" id="byhospital" class="round3" placeholder="by Hospital" onblur="disabledlocation()" />
              <g:textField name="bylocation" id="bylocation" class="round3" placeholder="by Location" />
              <g:hiddenField name="currentParams" id="currentParams" value="${currentParams}" />
            </g:if>
          </div>
          <div style="display:none">
            <g:form controller="search">
              <g:textField name="q" id="q2"/>
              <g:textField name="searchby" value="${searchby}" />
              <g:textField name="termcount" value="${termcount}" />
              <g:submitButton name="searchupdate" value="searchupdate" id="searchupdate" />
            </g:form>
          </div>
          <ul class="doctorgrid">
            <g:if test="${searchResult}">
              <g:each var="result" in="${searchResult.results}" status="index">
                <li>
                <sec:ifNotLoggedIn>
                  <div id="featdocheader" class="round6top">
                    <g:link controller="public" action="show" id="${result.id}">${fieldValue(bean: result, field: "fullname")}</g:link>
                  </div>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                  <div id="featdocheader" class="round6top">
                    <table id="featdocheadertable">
                      <tr>
                        <td width="80%" class="headerrb"><g:link controller="public" action="show" id="${result.id}">${fieldValue(bean: result, field: "fullname")}</g:link></td>
                      <td width="10%" valign="middle"><a href="#" onclick="addrequest(${currentUser.id},${result.id})"><g:img dir="images" file="icon-add-connection.png" align="middle" /></a></td>
                      <td width="10%" valign="middle"><g:link controller="message" action="create"><g:img dir="images" file="icon-send-message.png" align="middle" /></g:link></td>
                      </tr>
                    </table>                    
                  </div>
                </sec:ifLoggedIn>
                <div id="featdocbody" class="round6bottom"> 
                  <table>
                    <tbody>
                      <tr>
                        <td rowspan="4" class="center" width="40%"><g:link controller="public" action="show" id="${result.id}"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:result.id)}" /></g:link></td>
                  <td width="60%"><span class="keyfont">Specialist</span><br><span class="valfont"><g:link controller='search' params='["q":result?.specialties]' action='index'>${fieldValue(bean: result, field: "specialties")}</g:link></span></td>
                    </tr>
                    <tr>
                      <td><span class="keyfont">Hospital</span><br><g:each in="${result.hospital}" var="h"><span class="valfont"><g:link controller="hospital" action="show" id="${h.id}">${h}</g:link></span>&nbsp;</g:each></td>
                    </tr>
                    <tr>
                      <td><span class="keyfont">Organization</span><br>
                        <g:each in="${result.organization}" var="org"><span class="valfont"><g:link controller="organization" action="show" id="${org.id}">${org}</g:link></span>&nbsp;</g:each>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
                </li>
              </g:each>
            </g:if>
          </ul>
        </g:if>
      </div>
      <div id="rightpublicfront">
        <div id="adv1">
          <g:img dir="images" file="uob.png" />
        </div>
        <div id="adv2">
          <g:img dir="images" file="md.png" />
        </div>
      </div>
      <div id="bottompublicfront">
        <div class="paging">
          <g:if test="${haveResults}">
            Page:
            <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
            <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
            <g:else><g:paginate action="index" params="[q: params.q,searchby:params.searchby,termcount:params.termcount]" total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/></g:else>
          </g:if>
        </div>
      </div>
    </div>
  </body>
</html>