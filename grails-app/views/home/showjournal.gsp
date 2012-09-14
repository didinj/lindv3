
<%@ page import="com.media.eximio.Journal" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'journal.label', default: 'Journal')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'print-preview.css')}" type="text/css" media="screen">
  <g:javascript library="printelement"/>
</head>
<body>
  <script type="text/javascript">
    function printelement() {    
      $('#newarticle').printElement();
    };
  </script>
  <div id="publicfront">
    <div id="topbanner">
      <div id="innertopbanner" class="round6">
        &nbsp;
      </div>
    </div>
    <div id="leftpublicfront">
      <div id="newarticle" class="round6">
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div class="articletitle">
          <g:if test="${journalInstance?.journaltitle}">
            <h1 align="center"><g:fieldValue bean="${journalInstance}" field="journaltitle"/></h1>
          </g:if>
          <div class="leftcol">
            <g:if test="${journalInstance?.journalauthor}">Posted by <g:fieldValue bean="${journalInstance}" field="journalauthor"/> on 
              <g:formatDate date="${journalInstance?.createdate}" format="MMM dd, yyyy" /></g:if>
          </div>
          <div class="rightcol">
            <g:pdfLink url="/journal/journalpdf/${journalInstance.id}" filename="journal${journalInstance.id}.pdf" method="get">
              <g:img dir="images" file="icon-pdf.png" title="Export to PDF" /></g:pdfLink>
            <a href="#" onclick="printelement()">
              <g:img dir="images" file="icon-print.png" title="Print Journal" /></a>
            <g:pdfLink url="/pdf/demo2" filename="journal${journalInstance.id}.pdf" method="get">
              <g:img dir="images" file="icon-sendemail.png"  title="Email Journal" /></g:pdfLink>
          </div>
        </div>
        <div class="articleabstract">
          <div id="articleabstractleft"><g:if test="${journalInstance?.journalabstract}">
${journalInstance?.journalabstract}
            </g:if></div>
          <div id="articleabstractright"><img align="middle" src="${createLink(controller:'journal', action:'journal_image',id:journalInstance?.id)}" /></div>

        </div>
        <div class="articlecontent">
          <g:if test="${journalInstance?.journalcontent}">
${journalInstance?.journalcontent}
          </g:if>
        </div>
        <div class="articlereference" style="border-bottom: 1px solid #ddd; width: 95%">
          <g:if test="${journalInstance?.journalreference}">
${journalInstance?.journalreference}
          </g:if>
        </div>
        <div class="articlecontent">
          <g:if test="${journalInstance?.quiz}">
            <h1>QUIZ (20 points per right answer)</h1>    
            <g:form controller="journal" action="quizresult">
              <ol>
                <g:set var="counter" value="${1}" />
                <g:each in="${journalInstance?.quiz}" var="q">
                  <li>${q.question}<br><g:hiddenField name="q${counter}" value="${q.id}" />
                  <g:radio name="ans${counter}" value="a"/> ${q.opsa}<br>
                  <g:radio name="ans${counter}" value="b"/> ${q.opsb}<br>
                  <g:radio name="ans${counter}" value="c"/> ${q.opsc}<br>
                  <g:radio name="ans${counter}" value="d"/> ${q.opsd}<br>
                  </li>
                  <g:set var="counter" value="${counter + 1}" />
                </g:each>
              </ol> 
              <p align="right"><g:submitButton name="submitquiz" value="SUBMIT ANSWER" /></p>
            </g:form>
          </g:if>
        </div>
      </div>
    </div>
    <div id="rightpublicfront">
      <g:render template="../commons/advertisement" />
    </div>
  </div>
</body>
</html>