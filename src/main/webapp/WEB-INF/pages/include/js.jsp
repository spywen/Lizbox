
<!--jquery-->
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery/jquery.js"></script>

<!--Framework JS MVC : backbone (http://backbonejs.org/) + template engine hogan -->
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/underscore/underscore.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/backbone/backbone.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/typeheadjs/hogan.js"></script>

<!-- Framework gestion des dates : moment (http://momentjs.com/) -->
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/moment/min/moment.min.js"></script>

<!-- CONFIGS -->
<!-- Template engine hogan -->
<script type="text/javascript">
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@(.+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };
</script>
<!-- CONFIGS -->