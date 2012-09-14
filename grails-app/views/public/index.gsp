<%@ page import="com.media.eximio.auth.User" %>
<%@ page import="com.media.eximio.Article" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>LIND - Linking Doctors</title>
  </head>
  <body>
    <script type="text/javascript">
      $(document).ready(function() {
        $("#byspecialist").autocomplete({
          source: '<g:createLink controller='specialist' action='splist'/>'
        });
        $("#bylocation").autocomplete({
          source: '<g:createLink controller='cities' action='citylist'/>'
        });
        $("#username").focus();
      });
    </script>
    <div id="publicfront">
      <div id="finder">

        <div id="innerfinder" class="round6">
          <div id="leftfinderspace">
            <div class="slides_container">
              <a><img src="images/dummy/slide1.png"></a>
              <a><img src="images/dummy/slide1.png"></a>
              <a><img src="images/dummy/slide1.png"></a>
            </div>	
          </div>

          <div id="doctorfinder" class="round6">
            <div><h2>Doctors Finder</h2></div>
            <div>Please find your doctor by selecting location, specialist, hospital name or free search</div>
            <div><g:textField name="byspecialist" id="byspecialist" class="round3" placeholder="by Specialty" /></div>
            <div><g:textField name="byhospital" id="byhospital" class="round3" placeholder="by Hospital" onblur="disabledlocation()" /></div>
            <div><g:textField name="bylocation" id="bylocation" class="round3" placeholder="by Location" /></div>
            <div><g:textField name="byname" id="byname" class="round3" placeholder="by Name" /></div>
            <div id="findbuttondiv"><button type="button" id="findbutton" class="round3" onclick="search()">Find</button></div>
            <div style="display: none">
              <g:form controller="search" id="search2">
                <g:textField name="q" value="${params.q}" id="searchbottom" />
                <g:textField name="searchby" id="searchby" />
                <g:textField name="termcount" id="termcount" />
                <g:submitButton id="searchsubmit" value="Submit" name="searchsubmit" />
              </g:form>
            </div>
          </div>
        </div>

      </div>
      <div id="leftpublicfront">
        <h1 class="home">Featured Doctors</h1>
        <ul class="doctorgrid">
          <g:each in="${userInstanceList}" status="i" var="userInstance">
            <li>
              <div id="featdocheader" class="round6top"><g:link action="show" id="${userInstance.id}">
${fieldValue(bean: userInstance, field: "fullname")}</g:link>
              </div>
              <div id="featdocbody" class="round6bottom"> 
                <table>
                  <tbody>
                    <tr>
                      <td rowspan="4" class="center" width="40%"><g:link action="show" id="${userInstance.id}"><img class="avatar-large" src="${createLink(controller:'public', action:'avatar_image', id:userInstance.id)}" /></g:link></td>
                <td width="60%"><span class="keyfont">Specialist</span><br><span class="valfont"><g:link controller='search' params='["q":userInstance?.specialties]' action='index'>${fieldValue(bean: userInstance, field: "specialties")}</g:link></span></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Hospital</span><br><g:each in="${userInstance.hospital}" var="h"><span class="valfont"><g:link controller="hospital" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>&nbsp;</g:each></td>
                  </tr>
                  <tr>
                    <td><span class="keyfont">Organization</span><br><g:each in="${userInstance.organization}" var="org"><span class="valfont"><g:link controller="organization" action="show" id="${org.id}">${org?.encodeAsHTML()}</g:link></span>&nbsp;</g:each></td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </li>
          </g:each>
        </ul>        
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
        <div id="featarticle">
          <h1>Featured Article</h1>
          <ul class="featarticlegrid">
            <g:each in="${articleInstanceList}" status="i" var="articleInstance">
              <li>
                <table>
                  <tr>
                    <td><g:link controller="article" action="show" id="${articleInstance.id}"><img align="middle" class="avatar-medium" src="${createLink(controller:'article', action:'article_image',id:articleInstance.id)}" /></g:link></td>
                  </tr>
                  <tr>
                    <td>
                  <g:if test="${articleInstance.articletitle.size()>60}">
                    <g:set var="title" value="${articleInstance.articletitle[0..60] + '...'}" /></g:if>
                  <g:else><g:set var="title" value="${articleInstance.articletitle}" /></g:else>
                  <g:link controller="article" action="show" id="${articleInstance.id}">${title.encodeAsHTML()}</g:link>
                  </td>
                  </tr>
                  <tr>
                    <td>
                  <g:if test="${articleInstance.articleabstract.size()>120}">
                    <g:set var="abstracts" value="${articleInstance.articleabstract[0..120] + '...'}" /></g:if>
                  <g:else><g:set var="abstracts" value="${articleInstance.articleabstract}" /></g:else>
                    ${abstracts}
                  </td>
                  </tr>
                </table>
              </li>
            </g:each>
          </ul>
        </div>
        <div id="featvideo">
          <h1>Featured Videos</h1>
          <ul>
            <li>
              <div class="featvid-image">
                <a href="#"><img src="images/dummy/vid.png" /></a>
              </div>
              <div class="featvid-text">
                <p>Lorem Ipsum is simply dummy text of the printing typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
              </div>
            </li>
            <li>
              <div class="featvid-image">
                <a href="#"><img src="images/dummy/vid.png" /></a>
              </div>
              <div class="featvid-text">
                <p>Lorem Ipsum is simply dummy text of the printing typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>