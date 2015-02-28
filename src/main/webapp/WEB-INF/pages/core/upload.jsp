<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="ie lt-ie9 lt-ie8 lt-ie7 sidebar sidebar-collapse"> <![endif]-->
<!--[if IE 7]>    <html class="ie lt-ie9 lt-ie8 sidebar sidebar-collapse"> <![endif]-->
<!--[if IE 8]>    <html class="ie lt-ie9 sidebar sidebar-collapse"> <![endif]-->
<!--[if gt IE 8]> <html class="ie sidebar sidebar-collapse"> <![endif]-->
<!--[if !IE]><!-->
<html class="sidebar sidebar-collapse">
<!-- <![endif]-->
<head>
    <title>Upload - Lizbox</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">

    <!--[if lt IE 9]><link rel="stylesheet" href="../assets/components/library/bootstrap/css/bootstrap.min.css" /><![endif]-->
    <link rel="stylesheet" href="../assets/css/admin/module.admin.stylesheet-complete.sidebar_type.collapse.min.css"/>
    <link rel="stylesheet" href="../assets/components/modules/admin/notifications/notyfy/assets/lib/css/jquery.notyfy.css"/>
    <link rel="stylesheet" href="../assets/components/modules/admin/notifications/notyfy/assets/lib/css/notyfy.theme.default.css"/>
    <link rel="stylesheet" href="../assets/components/modules/admin/notifications/notyfy/assets/custom/less/notyfy.less"/>
    <link rel="stylesheet" href="../assets/components/common/ui/buttons/assets/buttons.less"/>


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script src="../assets/components/plugins/ajaxify/script.min.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script>
    var App = {};
    </script>
    <script data-id="App.Scripts">
    App.Scripts = {
        /* CORE scripts always load first; */
        core: [
            '../assets/components/library/jquery/jquery.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/library/modernizr/modernizr.js?v=v1.0.3-rc2&sv=v0.0.1.1'
        ],
        /* PLUGINS_DEPENDENCY always load after CORE but before PLUGINS; */
        plugins_dependency: [
            '../assets/components/library/bootstrap/js/bootstrap.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/library/jquery/jquery-migrate.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/modules/admin/maps/vector/assets/lib/jquery-jvectormap-1.2.2.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/modules/admin/charts/flot/assets/lib/jquery.flot.js?v=v1.0.3-rc2'
        ],
        /* PLUGINS always load after CORE and PLUGINS_DEPENDENCY, but before the BUNDLE / initialization scripts; */
        plugins: [
            '../assets/components/plugins/nicescroll/jquery.nicescroll.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/plugins/breakpoints/breakpoints.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/plugins/ajaxify/davis.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/plugins/ajaxify/jquery.lazyjaxdavis.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/plugins/preload/pace/pace.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/modules/admin/charts/easy-pie/assets/lib/js/jquery.easy-pie-chart.js?v=v1.0.3-rc2',
            '../assets/components/modules/admin/charts/sparkline/jquery.sparkline.min.js?v=v1.0.3-rc2',
            '../assets/components/modules/admin/maps/vector/assets/lib/maps/jquery-jvectormap-world-mill-en.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/common/forms/elements/bootstrap-select/assets/lib/js/bootstrap-select.js?v=v1.0.3-rc2',
            '../assets/components/plugins/less-js/less.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/modules/admin/charts/flot/assets/lib/excanvas.js?v=v1.0.3-rc2',
            '../assets/components/plugins/browser/ie/ie.prototype.polyfill.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/modules/admin/notifications/notyfy/assets/lib/js/jquery.notyfy.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/modules/admin/notifications/notyfy/assets/custom/js/notyfy.init.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/common/forms/elements/jasny-fileupload/assets/js/bootstrap-fileupload.js?v=v1.0.3-rc2&sv=v0.0.1.1'
        ],
        /* The initialization scripts always load last and are automatically and dynamically loaded when AJAX navigation is enabled; */
        bundle: [
            '../assets/components/plugins/ajaxify/ajaxify.init.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/plugins/preload/pace/preload.pace.init.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/core/js/animations.init.js?v=v1.0.3-rc2',
            '../assets/components/common/forms/elements/fuelux-checkbox/fuelux-checkbox.init.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/modules/admin/charts/easy-pie/assets/custom/easy-pie.init.js?v=v1.0.3-rc2',
            '../assets/components/modules/admin/charts/sparkline/sparkline.init.js?v=v1.0.3-rc2',
            '../assets/components/modules/admin/maps/vector/assets/custom/maps-vector.world-map-markers.init.js?v=v1.0.3-rc2&sv=v0.0.1.1',
            '../assets/components/core/js/sidebar.main.init.js?v=v1.0.3-rc2',
            '../assets/components/core/js/sidebar.collapse.init.js?v=v1.0.3-rc2',
            '../assets/components/common/forms/elements/bootstrap-select/assets/custom/js/bootstrap-select.init.js?v=v1.0.3-rc2',
            '../assets/components/core/js/core.init.js?v=v1.0.3-rc2'
        ]
    };
    </script>
    <script>
    $script(App.Scripts.core, 'core');
    $script.ready(['core'], function()
    {
        $script(App.Scripts.plugins_dependency, 'plugins_dependency');
    });
    $script.ready(['core', 'plugins_dependency'], function()
    {
        $script(App.Scripts.plugins, 'plugins');
    });
    $script.ready(['core', 'plugins_dependency', 'plugins'], function()
    {
        $script(App.Scripts.bundle, 'bundle');
    });
    </script>
    <script>
    if ( /*@cc_on!@*/ false && document.documentMode === 10)
    {
        document.documentElement.className += ' ie ie10';
    }
    </script>

    <jsp:include page="../include/header.jsp"/>
</head>
<body class="scripts-async">
    <div class="container-fluid menu-hidden">
        <jsp:include page="../include/leftBar.jsp"/>
        <div id="content">
            <jsp:include page="../include/topBar.jsp"/>
            <div class="innerLR" id="upload">
                <h2 class="margin-none">Upload de fichiers &nbsp;<i class="fa fa-fw fa-upload text-muted"></i>
                </h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget">
                            <div class="widget-head">
                                <h4 class="heading"></h4>
                            </div>
                            <div class="widget-body innerAll inner-2x">
                                <form method="post" id="uploadForm" action="/lizbox/documents/upload" enctype="multipart/form-data" class="apply-nolazy">
                                    <div class="fileupload fileupload-new innerAll inner-2x" data-provides="fileupload">
                                        <div class="input-group">
                                            <div class="form-control col-md-3">
                                                <i class="fa fa-file fileupload-exists"></i>
                                                <span class="fileupload-preview"></span>
                                            </div>
                                            <span class="input-group-btn">
                                                <span class="btn btn-default btn-file">
                                                    <span class="fileupload-new">Select file</span>
                                                    <span class="fileupload-exists">Change</span>
                                                    <input type="file" name="file" id="file" class="margin-none" />
                                                </span>
                                            </span>

                                        </div>
                                        </br>
                                        <input type="hidden" name="idDossierParent" value="0"/>
                                        <button type="submit" class="btn btn-default"><i class="fa fa-upload"></i> Upload le fichier</button>
                                        <br/>
                                        <br/>
                                        <p>
                                            <em class="text-danger">${error}</em>
                                        </p>
                                    </div>
                                </form>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>


        <script data-id="App.Config">
        var basePath = '',
            commonPath = '../assets/',
            rootPath = '../',
            DEV = false,
            componentsPath = '../assets/components/';
        var primaryColor = '#3695d5',
            dangerColor = '#b55151',
            successColor = '#609450',
            infoColor = '#4a8bc2',
            warningColor = '#ab7a4b',
            inverseColor = '#45484d';
        var themerPrimaryColor = primaryColor;
        App.Config = {
            ajaxify_menu_selectors: ['#menu'],
            ajaxify_layout_app: false
        };
        </script>
    </div>
</body>
</html>