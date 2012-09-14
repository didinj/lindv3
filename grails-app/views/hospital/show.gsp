
<%@ page import="com.media.eximio.Hospital" %>
<%@ page import="com.media.eximio.Specialist" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'hospital.label', default: 'Hospital')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
  <style type="text/css">
    * {
      margin: 0;
      padding: 0;
    }
    #tabs {
      font-size: 90%;
      margin: 20px 0;
    }
    #tabs ul {
      float: left;
      width: 500px;
      padding-top: 4px;
    }
    #tabs li {
      margin-left: 8px;
      list-style: none;
    }
    * html #tabs li {
      display: inline;
    }
    #tabs li, #tabs li a {
      float: left;
    }
    #tabs ul li.active {
      background-color: #ffffff;
      background-image: -moz-linear-gradient(center top, #ffffff, #e9e9e9);
      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffffff), color-stop(1, #e9e9e9));
      background-image: linear-gradient(top, #ffffff, #e9e9e9);
      filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#ffffff', EndColorStr = '#e9e9e9');
      background-repeat: no-repeat;
      border: 1px solid #dddddd;
    }
    #tabs ul li.active a {
      color: #333333;
    }
    #tabs div {
      background-color: #ffffff;
      background-image: -moz-linear-gradient(center top, #ffffff, #e9e9e9);
      background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffffff), color-stop(1, #e9e9e9));
      background-image: linear-gradient(top, #ffffff, #e9e9e9);
      filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#ffffff', EndColorStr = '#e9e9e9');
      background-repeat: no-repeat;
      border: 1px solid #dddddd;
      clear: both;
      padding: 15px;
      min-height: 200px;
    }
    #tabs div h3 {
      margin-bottom: 12px;
    }
    #tabs div p {
      line-height: 150%;
    }
    #tabs ul li a {
      text-decoration: none;
      padding: 8px;
      color: #000;
    }
    .thumbs {
      float:left;
      border:#000 solid 1px;
      margin-bottom:20px;
      margin-right:20px;
    }
    -->
  </style>
</head>
<body>
  <script type="text/javascript">
    $(document).ready(function(){
      $('#tabs div').hide();
      $('#tabs div:first').show();
      $('#tabs ul li:first').addClass('active');
      $('#tabs ul li a').click(function(){ 
        $('#tabs ul li').removeClass('active');
        $(this).parent().addClass('active'); 
        var currentTab = $(this).attr('href'); 
        $('#tabs div').hide();
        $(currentTab).show();
        return false;
      });
      showparams($("#hospid").val(),$("#specialist").val());
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
          <g:if test="${hospitalInstance?.hospname}">
            <span class="property-value" aria-labelledby="hospname-label"><g:fieldValue bean="${hospitalInstance}" field="hospname"/></span>
            <g:hiddenField value="${hospitalInstance.id}" name="hospid" id="hospid" />
          </g:if>
          </td>
          </tr>
        </table>	  

      </div>
      <div id="featdocbody" class="round6bottom"> 
        <table>
          <tbody>
            <tr>
              <td rowspan="4" class="center" width="20%"><img class="avatar-large" src="${createLink(action:'hospimage', id:hospitalInstance?.id)}" /></td>
              <td width="20%"><span class="keyfont">Address</span></td>
              <td width="30%"><span class="valfont"><g:if test="${hospitalInstance?.hospaddr}">
                    <span class="property-value" aria-labelledby="hospaddr-label"><g:fieldValue bean="${hospitalInstance}" field="hospaddr"/></span>
                  </g:if>, <g:if test="${hospitalInstance?.hospcity}">
                    <span class="property-value" aria-labelledby="hospcity-label"><g:fieldValue bean="${hospitalInstance}" field="hospcity"/></span>
                  </g:if></span></td>
              <td rowspan="4" class="center" width="20%"><span class="keyfont">
                  <span class="valfont"></span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Email</span></td>
              <td><span class="valfont"><g:if test="${hospitalInstance?.hospemail}">
                    <span class="property-value" aria-labelledby="hospemail-label"><g:fieldValue bean="${hospitalInstance}" field="hospemail"/></span>
                  </g:if></span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Phone</span></td>
              <td><span class="valfont"><g:if test="${hospitalInstance?.hospphone}">
                    <span class="property-value" aria-labelledby="hospphone-label"><g:fieldValue bean="${hospitalInstance}" field="hospphone"/></span>
                  </g:if></span></td>
            </tr>
            <tr>
              <td><span class="keyfont">Website</span></td></td>
              <td><span class="valfont"><g:if test="${hospitalInstance?.hospwebsite}">
                    <span class="property-value" aria-labelledby="hospwebsite-label"><g:fieldValue bean="${hospitalInstance}" field="hospwebsite"/></span>
                  </g:if></span></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div id="schedule" class="round6" style="font-size:13px">
        <table width="100%">
          <tr>
            <td width="60%"><span>DOCTORS IN THIS HOSPITAL</span></td>
            <td width="20%" style="text-align:right"><g:link action="listdoctor" id="${hospitalInstance?.id}"><span>Show More</span></g:link> | </td>
          <td width="20%" style="text-align:right">
          <g:select id="specialist" name="specialist" optionValue="description" from="${Specialist.list()}" noSelection="${['null':'By Specialist']}" onchange="showparams(${hospitalInstance?.id},this.value)"/></td>
          </tr>
          <tr>
            <td colspan="3">
              <div id="dokterlist">            
              </div>
            </td>
          </tr>
        </table>
      </div>
      <div id="hospitaltab">
        <div id="tabs">
          <ul>
            <li><a href="#about">About</a></li>
            <li><a href="#service">Service</a></li>
            <li><a href="#gallery">Gallery</a></li>
          </ul>
          <div id="about">
            <h3><span class="keyfont">About Hospital</span></h3>
            <p>
            <g:if test="${hospitalInstance?.hospabout}">
              <span class="keyfont"><g:fieldValue bean="${hospitalInstance}" field="hospabout"/></span>
            </g:if>
            </p>
            <br>
            <h3><span class="valfont">Specialist</span></h3>
            <ol style="list-style-type: disc">
              <g:if test="${hospitalInstance?.hospspecialists}">
                <g:each in="${hospitalInstance.hospspecialists}" var="h">
                  <li><span class="keyfont">${h?.encodeAsHTML()}</span></li>
                </g:each>
              </g:if>
            </ol>
          </div>
          <div id="service">
            <h3><span class="keyfont">Service</span></h3>
            <p>Cath-lab / angiography adalah prosedur / tindakan kardiologi diagnostic invasive dengan menggunakan sinar – x untuk menggambarkan gambaran pembuluh darah di berbagai organ tubuh antara lain, jantung, otak dan ginjal untuk melihat adanya penyakit, sumbatan, penyempitan atau pelebaran pada pembuluh darah tersebut. Alat ini dapat menampilkan pembuluh darah secara detail yang tidak bisa dihasilkan oleh prosedur invasive, sehingga membantu secara akurat dalam tindakan prosedur operasi  atau Percutaneous Transluminal Coronary Angioplasty (PTCA)
              Alat yang digunakan  adalah mini cath-lab merek GE tipe OEC 9900 elite, alat ini dikhususkan untuk tindakan jantung seperti kateterisasi jantung / pemasangan stent atau cincin di jantung (PCI/PTCA), pemasangan TPM (Temporary Pace maker/ Alat pacu jantung sementara), PPM (Permanent Pace Maker / alat pacu jantung permanen ), Penyadapan jantung untuk melihat adanya kelainan jantung bawaan (Congenital), Perikardiosintesis (Mengeluarkan cairan di rongga jantung), Arteriografi (Melihat adanya sumbatan/penyempitan di pembuluh darah arteri di kaki atau tangan dan tempat lain), Aortografi, dll. Namun selain tindakan  bagian jantung, kelebihan alat ini juga bisa membantu dokter bedah karena bisa digunakan untuk membantu dokter bedah tulang belakang (Spine), bedah tulang  (Orthopedic) melakukan operasi</p>
          </div>
          <div id="gallery">
            <h3><span class="keyfont">Gallery</span></h3>
            <p>&nbsp;</p>
          </div>
        </div>
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
        <h1>OTHER HOSPITALS</h1>
        <g:each in="${otherHospital}" var="o">        
          <table>
            <tr>
              <td rowspan="2"><g:link action="show" id="${o.id}"><img class="avatar-small" src="${createLink(action:'hospimage', id:o.id)}" /></g:link></td>
            <td><g:link action="show" id="${o.id}">${o.hospname}</g:link>
            </td>
            </tr>
            <tr>
              <td>${o.hospaddr}, ${o.hospcity}</td>
            </tr>
          </table>
        </g:each>
      </div>
    </div>
    <div id="bottompublicfront">
      &nbsp;
    </div>
  </div>
</body>
</html>