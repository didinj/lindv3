<script type="text/javascript">
function search() {
  if(!$("#byspecialist").val()==""&&$("#byhospital").val()==""&&$("#bylocation").val()==""&&$("#byname").val()=="") {
    $("#searchbottom").val($("#byspecialist").val());
    $("#searchby").val("specialist");
    $("#termcount").val("1");
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if(!$("#byhospital").val()==""&&$("#byspecialist").val()==""&&$("#bylocation").val()==""&&$("#byname").val()=="") {
    $("#searchbottom").val($("#byhospital").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if($("#byspecialist").val()==""&&$("#byhospital").val()==""&&!$("#bylocation").val()==""&&$("#byname").val()=="") {
    $("#searchbottom").val($("#bylocation").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if($("#byspecialist").val()==""&&$("#byhospital").val()==""&&$("#bylocation").val()==""&&!$("#byname").val()=="") {
    $("#searchbottom").val($("#byname").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if(!$("#byspecialist").val()==""&&!$("#byhospital").val()==""&&$("#bylocation").val()==""&&$("#byname").val()=="") {
    $("#searchbottom").val($("#byspecialist").val()+" "+$("#byhospital").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if(!$("#byspecialist").val()==""&&$("#byhospital").val()==""&&!$("#bylocation").val()==""&&$("#byname").val()=="") {
    $("#searchbottom").val($("#byspecialist").val()+" "+$("#bylocation").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if(!$("#byspecialist").val()==""&&$("#byhospital").val()==""&&$("#bylocation").val()==""&&!$("#byname").val()=="") {
    $("#searchbottom").val($("#byspecialist").val()+" "+$("#byname").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if($("#byspecialist").val()==""&&!$("#byhospital").val()==""&&$("#bylocation").val()==""&&!$("#byname").val()=="") {
    $("#searchbottom").val($("#byhospital").val()+" "+$("#byname").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if($("#byspecialist").val()==""&&$("#byhospital").val()==""&&!$("#bylocation").val()==""&&!$("#byname").val()=="") {
    $("#searchbottom").val($("#bylocation").val()+" "+$("#byname").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if(!$("#byspecialist").val()==""&&!$("#byhospital").val()==""&&$("#bylocation").val()==""&&!$("#byname").val()=="") {
    $("#searchbottom").val($("#byspecialist").val()+" "+$("#byhospital").val()+" "+$("#byname").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } else if(!$("#byspecialist").val()==""&&$("#byhospital").val()==""&&!$("#bylocation").val()==""&&!$("#byname").val()=="") {
    $("#searchbottom").val($("#byspecialist").val()+" "+$("#bylocation").val()+" "+$("#byname").val());
    $("#searchsubmit").click();
    $("#searchbottom").val("");
  } 
}

function disabledlocation() {
  if($("#byhospital").val()=="")
    $("#bylocation").prop("disabled", false);
  else
    $("#bylocation").prop("disabled", true);
}

function getFriendRequest(data) {
  $.ajax({
    url : "/lindv3/friendRequest/getrequest/"+data,
    type : "GET",
    dataType:"json",
    success : function(data) {
      if(data.length>0) {
        $("#conn-notice").text(data.length);
        $("#conn-notice").show();
      } else {
        $("#conn-notice").text("");
        $("#conn-notice").hide();
      }
    }
  });
}

function getMessage(data) {
  $.ajax({
    url : "/lindv3/message/getmessage/"+data,
    type : "GET",
    dataType:"json",
    success : function(data) {
      var msgtotal=data.total;
      if(msgtotal>0) {
        $("#msg-notice").text(msgtotal);
        $("#msg-notice").show();
      } else {
        $("#msg-notice").text("");
        $("#msg-notice").hide();
      }
    }
  });
}

function getJournal(data) {
  $.ajax({
    url : "/lindv3/journal/getjournal/"+data,
    type : "GET",
    dataType:"json",
    success : function(data) {
      if(data.length>0) {
        $("#journal-notice").text(data.length);
        $("#journal-notice").show();
      } else {
        $("#journal-notice").text("");
        $("#journal-notice").hide();
      }
    }
  });
}

</script>

<sec:ifLoggedIn>
  <script type="text/javascript">
    $(window).load(function () {
      getFriendRequest(<sec:loggedInUserInfo  field="id" />);
      getMessage(<sec:loggedInUserInfo  field="id" />);
      //getJournal(<sec:loggedInUserInfo  field="id" />);
    });
  </script>
</sec:ifLoggedIn>

<div id="topheader">
  <div id="logo">
    <sec:ifNotLoggedIn>
      <a href="${createLink(controller:'home', action:'index')}"><img src="${resource(dir: 'images', file: 'logolind.png')}" alt="Linking Doctors"/></a>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
      <a href="/user/show"><img src="${resource(dir: 'images', file: 'logolind.png')}" alt="Linking Doctors"/></a>
    </sec:ifLoggedIn>
  </div>
  <div id="userinfo">
    <sec:ifNotLoggedIn>
      <div id="notificationbox2">
        &nbsp;
      </div>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
      <div id="notificationbox" class="round15">
        <table id="notificationtable">
          <tr>
            <td>
          <g:link controller="message" action="inbox"><g:img dir="images" file="notice-message.png" align="middle"/></g:link>
          <label id="msg-notice" style="display:none"></label>
          </td>
          <td>
          <g:link controller="friendRequest" action="list"><g:img dir="images" file="notice-connection.png" align="middle"/></g:link>
          <label id="conn-notice" style="display:none"></label></td>
          <td><g:link controller="home" action="listjournal"><g:img dir="images" file="notice-jurnal.png" align="middle"/></g:link>
          <label id="journal-notice" style="display:none"></label></td>
          </tr>
        </table>        
      </div>
    </sec:ifLoggedIn>
    <div id="userinfobox" class="round15h">
      <sec:ifNotLoggedIn>
        <g:img dir="images" file="default-profile.png" align="middle" width="28px" height="28px"/>
        <span id="areyoudoctor" align="middle">Are you doctor?</span>
        <g:link controller="login" action="auth" elementId="login">Login here</g:link>
      </sec:ifNotLoggedIn>
      <sec:ifLoggedIn>
        <div id="uiboxleft">
          <img class="avatar-xsmall" align="middle" src="${createLink(controller:'home', action:'avatar_image')}" />
          <sec:username/>
        </div>
        <div id="uiboxright">
          <ul>
            <li><g:link controller="home" action="profile" id="${userInstance?.id}">Profile</g:link></li>
            <li><g:link controller="logout">Logout</g:link></li>
          </ul>
        </div>       
      </sec:ifLoggedIn>
    </div>
  </div>
</div>
<div id="bottomheader">
  <div id="menu">
    <sec:ifLoggedIn>
      <ul id="nav">
        <li><a href="${createLink(controller:'home', action:'index')}">Home</a></li>
        <li><a href="${createLink(controller:'article', action:'index')}">Article</a>
          <ul>
            <li><a href="${createLink(controller:'article', action:'create')}">Create Article</a></li>
            <li><a href="${createLink(controller:'article', action:'show')}">Show Article</a></li>
          </ul>
        </li>
        <li><a href="${createLink(controller:'home', action:'listcontact')}">Contact</a>
          <ul>
            <li><a href="${createLink(controller:'home', action:'listcontact')}">Connection</a></li>
          </ul>
        </li>
        <li><a href="${createLink(controller:'groups', action:'index')}">Groups</a>
          <ul>
            <li><a href="${createLink(controller:'groups', action:'list')}">My Groups</a></li>
            <li><a href="${createLink(controller:'groups', action:'create')}">Add Group</a></li>
          </ul>
        </li>
      </ul>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
      <ul id="nav">
        <li><a href="${createLink(controller:'public',action:'index')}" class="current">HOME</a></li>
      </ul>
    </sec:ifNotLoggedIn>
  </div>
  <div id="searchbox">
    <g:form controller="search">
      <g:textField name="q" value="${params.q}" id="searchtop" placeholder="Search" class="round15" />
    </g:form>
  </div>
</div>