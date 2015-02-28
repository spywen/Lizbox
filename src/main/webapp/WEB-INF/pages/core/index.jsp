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
        <title>Mes documents - Lizbox</title>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">

        <!--[if lt IE 9]><link rel="stylesheet" href="<%=request.getContextPath()%>/assets/components/library/bootstrap/css/bootstrap.min.css" /><![endif]-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/module.admin.stylesheet-complete.sidebar_type.collapse.min.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/components/modules/admin/notifications/notyfy/assets/lib/css/jquery.notyfy.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/components/modules/admin/notifications/notyfy/assets/lib/css/notyfy.theme.default.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/components/modules/admin/notifications/notyfy/assets/custom/less/notyfy.less"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/components/common/ui/buttons/assets/buttons.less"/>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <script src="<%=request.getContextPath()%>/assets/components/plugins/ajaxify/script.min.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
        <script>
        var App = {};
        </script>
        <script data-id="App.Scripts">
        App.Scripts = {
            /* CORE scripts always load first; */
            core: [
                '<%=request.getContextPath()%>/assets/components/library/jquery/jquery.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/library/modernizr/modernizr.js?v=v1.0.3-rc2&sv=v0.0.1.1'
            ],
            /* PLUGINS_DEPENDENCY always load after CORE but before PLUGINS; */
            plugins_dependency: [
                '<%=request.getContextPath()%>/assets/components/library/bootstrap/js/bootstrap.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/library/jquery/jquery-migrate.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/modules/admin/maps/vector/assets/lib/jquery-jvectormap-1.2.2.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/modules/admin/charts/flot/assets/lib/jquery.flot.js?v=v1.0.3-rc2'
            ],
            /* PLUGINS always load after CORE and PLUGINS_DEPENDENCY, but before the BUNDLE / initialization scripts; */
            plugins: [
                '<%=request.getContextPath()%>/assets/components/plugins/nicescroll/jquery.nicescroll.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/plugins/breakpoints/breakpoints.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/plugins/ajaxify/davis.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/plugins/ajaxify/jquery.lazyjaxdavis.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/plugins/preload/pace/pace.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/modules/admin/charts/easy-pie/assets/lib/js/jquery.easy-pie-chart.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/modules/admin/charts/sparkline/jquery.sparkline.min.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/modules/admin/maps/vector/assets/lib/maps/jquery-jvectormap-world-mill-en.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/common/forms/elements/bootstrap-select/assets/lib/js/bootstrap-select.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/plugins/less-js/less.min.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/modules/admin/charts/flot/assets/lib/excanvas.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/plugins/browser/ie/ie.prototype.polyfill.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/modules/admin/notifications/notyfy/assets/lib/js/jquery.notyfy.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/modules/admin/notifications/notyfy/assets/custom/js/notyfy.init.js?v=v1.0.3-rc2&sv=v0.0.1.1'
            ],
            /* The initialization scripts always load last and are automatically and dynamically loaded when AJAX navigation is enabled; */
            bundle: [
                '<%=request.getContextPath()%>/assets/components/plugins/ajaxify/ajaxify.init.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/plugins/preload/pace/preload.pace.init.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/core/js/animations.init.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/modules/admin/charts/easy-pie/assets/custom/easy-pie.init.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/modules/admin/charts/sparkline/sparkline.init.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/modules/admin/maps/vector/assets/custom/maps-vector.world-map-markers.init.js?v=v1.0.3-rc2&sv=v0.0.1.1',
                '<%=request.getContextPath()%>/assets/components/core/js/sidebar.main.init.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/core/js/sidebar.collapse.init.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/common/forms/elements/bootstrap-select/assets/custom/js/bootstrap-select.init.js?v=v1.0.3-rc2',
                '<%=request.getContextPath()%>/assets/components/core/js/core.init.js?v=v1.0.3-rc2',
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
        <!-- Main Container Fluid -->
        <div class="container-fluid menu-hidden">
            <jsp:include page="../include/leftBar.jsp"/>
            <!-- Content -->
            <div id="content">
                <jsp:include page="../include/topBar.jsp"/>
                <div class="innerLR" id="arborescence">
                    <h2 class="margin-none">Mes documents &nbsp;<i class="fa fa-fw fa-file-text text-muted"></i> </h2>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="widget">
                                <div class="widget-head">
                                    <h4 class="heading">
                                        <button class="btn btn-xs btn-default" id="refresh">
                                            <i class="fa fa-refresh"></i>
                                             Rafraîchir
                                        </button>
                                        <button class="btn btn-xs btn-default no-ajaxify" id="upload"><i class="fa fa-upload"></i> Upload</button>
                                        <button class="btn btn-xs btn-default" id="newFolder"><i class="fa fa-folder-open-o"></i> Nouveau dossier</button>
                                        <button class="btn btn-xs btn-default" id="share"><i class="fa fa-users"></i> Partager</button>
                                        <button class="btn btn-xs btn-default" id="deleteDoc"><i class="fa fa-trash-o"></i> Supprimer</button>
                                    </h4>
                                </div>
                                <div class="widget-body innerAll inner-2x">
                                    <ol id="breadcrumb"></ol>
                                    <br/>
                                    <!-- Table -->
                                    <table class=" table">
                                        <!-- Table heading -->
                                        <thead class="bg-gray">
                                        <tr>
                                            <th style="width: 5%"><i class="fa fa-question-circle text-question" data-toggle="tooltip" data-placement="top" title="Glisser/Déposer pour modifier l'emplacement des documents"></i></th>
                                            <th style="width: 50%">Nom</th>
                                            <th style="width: 15%">Création</th>
                                            <th style="width: 10%">Taille</th>
                                            <th style="width: 10%">Partage</th>
                                            <th style="width: 10%"><input type="checkbox" id="selectAll"/></th>
                                        </tr>
                                        </thead>
                                        <!-- // Table heading END -->
                                        <!-- Table body -->
                                        <tbody>

                                        </tbody>
                                        <!-- // Table body END -->
                                    </table>
                                    <!-- // Table END -->
                                </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="clearfix"></div>
            </div>
            <!-- // Content END -->
            <!-- // Main Container Fluid END -->
            <!-- Global -->
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



            <script type="text/javascript" src="<%=request.getContextPath()%>/js/utils.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/modal/newFolderModal.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/modal/shareModal.js" ></script>

            <script type="text/javascript" src="<%=request.getContextPath()%>/js/model/document.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/model/publicShare.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/model/privateShare.js" ></script>

            <script type="text/javascript" src="<%=request.getContextPath()%>/js/collection/privateShareCollection.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/collection/dossier.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/collection/breadcrumbs.js" ></script>

            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/template/document.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/template/breadcrumb.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/template/publicShareTemplate.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/template/privateShareTemplate.js" ></script>

            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/documents/newFolder.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/documents/shareView.js" ></script>
            <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/documents/arborescence.js" ></script>
            <script>
                var notification = function(type,message) {
                    notyfy({
                        text: '<strong>'+message+'</strong>',
                        type: type,
                        theme: null,
                        timeout: 7000,
                        events: {
                            show: true,
                            hide: null,
                            shown: null,
                            hidden: null
                        }
                    });
                }
                window.lizbox = {
                    notification : notification,
                    arborescence : new ArborescenceView({collection : new Dossier()})
                }
            </script>


            <script type="text/template" id="document-template">
                <td>
                    <i dropzone="move" data-id="<@= id @>" class="fa fa-th-large dragDropElement"></i>
                </td>
                <td>
                    <a class="<@= linkClass @> clickRight" data-toggle="tooltip" data-placement="top" title="<@= tooltipDownloadFile @>" data-id="<@= id @>" <@= linkCompl @> href="<@= link @>">
                    <i data-id="<@= id @>" class="<@= image @>"></i>
                    <@= nom @>
                    </a>
                </td>
                <td><@= creation @></td>
                <td><@= taille @></td>
                <td>
                    <@= publicShare @>
                    <@= privateShare @>
                </td>
                <td>
                    <input type="checkbox" name="checkbox" class="check" <@= attrChecked @> data-id="<@= id @>">
                </td>
            </script>

            <script type="text/template" id="breadcrumb-template">
                <a class="linkPrev" data-id="<@= id @>"><i class="fa fa-folder-open-o"></i> <@= nom @></a>
            </script>

            <script type="text/template" id="public-share-template">
                <div class="widget-head">
                    <h4 class="heading">Partage public</h4>
                </div>
                <div class="widget-body innerAll inner-2x">
                    <input type="text" class="form-control" id="publicShareLink" <@= attrEnabled @> value="<@= publicShareLink @>"/>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="isPublicShared" <@= attrChecked @>/> Activation du partage public
                        </label>
                    </div>
                </div>
            </script>

            <script type="text/template" id="private-share-template">
                <td>
                    <@= userLabel @>
                </td>
                <td>
                    <input type="checkbox" name="addWriteRight" class="addWriteRight" data-id="<@= id @>" <@= attrChecked @>/>
                </td>
                <td>
                    <button class="btn btn-default btn-xs removePrivateShare" data-id="<@= id @>"><i class="fa fa-trash-o"></i></button>
                </td>
            </script>
        </div>
    </body>
</html>