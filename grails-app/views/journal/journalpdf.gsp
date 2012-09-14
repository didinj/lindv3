<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${journal.journaltitle}</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'core.css')}" type="text/css" media="print" />
    <style>
      .journaltitle {
        text-align: left;
        width: 95%;
        line-height: 10px;
        margin: 0 0 0 15px;
        padding: 0 0 15px 0;
        border-bottom: 1px solid #ddd;
      }
      .journalabstract {
        text-align: left;
        width: 95%;
      }
    </style>
  </head>
  <body>
    <div class="journaltitle">
      <h1>${journal.journaltitle}</h1>
      Posted by ${journal.journalauthor} on <g:formatDate date="${journal.createdate}" format="MMM dd, yyyy" />
    </div>

    <div class="journalabstract">
${journal.journalabstract}
    </div>

    <div class="journalabstract">
${journal.journalcontent}
    </div>

    <div class="journalabstract" style="border-bottom: 1px solid #ddd; width: 95%">
${journal.journalreference}
    </div>
  </body>
</html>