<script type="text/javascript">
  function radv1click(param1) {
        ${remoteFunction(action:'radv1click',
        params:'\'id=\'+param1',onSuccess:'reqsent()')};
      }
      
      function radv2click(param1) {
        ${remoteFunction(action:'radv2click',
        params:'\'id=\'+param1',onSuccess:'reqsent()')};
      }
      
      function reqsent() {}
</script>

<div id="adv1">
  <a href="#" onclick="radv1click(${radv1.id})"><img src="${createLink(controller:'home', action:'adv_image', id:radv1.id)}" /></a>
</div>
<div id="adv2">
  <a href="#" onclick="radv2click(${radv2.id})"><img src="${createLink(controller:'home', action:'adv_image', id:radv2.id)}" /></a>
</div>