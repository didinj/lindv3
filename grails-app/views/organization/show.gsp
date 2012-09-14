
<%@ page import="com.media.eximio.Organization" %>
<%@ page import="com.media.eximio.Specialist" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'organization.label', default: 'Organization')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <script type="text/javascript">
    $(document).ready(function(){
      showparams($("#orgid").val(),$("#specialist").val());
    });
    
    function showparams(param1,param2) {
      ${remoteFunction(action:'dokterlist',
      params:'\'id=\'+param1+\'&docspec=\'+param2',update:'dokterlist')};
    }
    
    function reqsent() {}
  </script>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <div id="featdocheader" class="round6top">
        <table id="featdocheadertable">
          <tr>
            <td width="100%" class="headerrb headerprof">
          <g:if test="${organizationInstance?.orgname}">
            <span class="property-value" aria-labelledby="hospname-label"><g:fieldValue bean="${organizationInstance}" field="orgname"/></span>
            <g:hiddenField value="${organizationInstance.id}" name="orgid" id="orgid" />
          </g:if>
          </td>
          </tr>
        </table>
      </div>
      <div id="featdocbody" class="round6bottom">
        <table>
          <tbody>
            <tr>
              <td rowspan="4" class="center" width="20%"><img class="avatar-large" src="${createLink(action:'orgimage', id:organizationInstance?.id)}" /></td>
              <td width="20%"><span class="keyfont">Address</span></td>
              <td width="30%"><span class="valfont"><g:if test="${organizationInstance?.orgaddress}">
                    <span class="property-value" aria-labelledby="hospaddr-label"><g:fieldValue bean="${organizationInstance}" field="orgaddress"/></span>
                  </g:if>, <g:if test="${organizationInstance?.orgcity}">
                    <span class="property-value" aria-labelledby="hospcity-label"><g:fieldValue bean="${organizationInstance}" field="orgcity"/></span>
                  </g:if></span></td>
              <td rowspan="4" class="center" width="20%"><span class="keyfont">
                  <span class="valfont"></span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Email</span></td>
              <td><span class="valfont"><g:if test="${organizationInstance?.orgemail}">
                    <span class="property-value" aria-labelledby="hospemail-label"><g:fieldValue bean="${organizationInstance}" field="orgemail"/></span>
                  </g:if></span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Phone</span></td>
              <td><span class="valfont"><g:if test="${organizationInstance?.orgphone}">
                    <span class="property-value" aria-labelledby="hospphone-label"><g:fieldValue bean="${organizationInstance}" field="orgphone"/></span>
                  </g:if></span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Website</span></td></td>
              <td><span class="valfont"><g:if test="${organizationInstance?.orgwebsite}">
                    <span class="property-value" aria-labelledby="hospwebsite-label"><g:fieldValue bean="${organizationInstance}" field="orgwebsite"/></span>
                  </g:if></span></td>
            </tr>
          </tbody>
        </table>
      </div> 
      <div id="schedule" class="round6" style="font-size:13px">
        <table width="100%">
          <tr>
            <td width="60%"><span>MEMBERS</span></td>
            <td width="20%" style="text-align:right"><g:link action="listdoctor" id="${organizationInstance?.id}"><span>Show More</span></g:link> | </td>
          <td width="20%" style="text-align:right">
          <g:select id="specialist" name="specialist" optionValue="description" from="${Specialist.list()}" noSelection="${['null':'By Specialist']}" onchange="showparams(${organizationInstance?.id},this.value)"/></td>
          </tr>
          <tr>
            <td colspan="3">
              <div id="dokterlist">            
              </div>
            </td>
          </tr>
        </table>
      </div>
    </div>
    <div id="rightpublicfront">
      <div id="adv1">
        <g:img dir="images" file="uob.png" />
      </div>
      <div id="adv2">
        <g:img dir="images" file="md.png" />
      </div>
      <div id="friendlist">
        <h1>OTHER ORGANIZATION</h1>

      </div>
    </div>
  </div>
</div>
</body>
</html>
