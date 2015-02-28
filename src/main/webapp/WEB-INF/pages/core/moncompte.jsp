<%--
  Created by IntelliJ IDEA.
  User: laurent
  Date: 29/05/2014
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
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
        <title>Mon compte - Lizbox</title>
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
                    '<%=request.getContextPath()%>/assets/components/core/js/core.init.js?v=v1.0.3-rc2'
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
    <body>
        <div class="container-fluid menu-hidden">
            <jsp:include page="../include/leftBar.jsp"/>
            <div id="content">
                <jsp:include page="../include/topBar.jsp"/>
                <div class="innerLR">
                    <h2 class="margin-none">Mon compte &nbsp;<i class="fa fa-fw fa-user text-muted"></i></h2>
                    <div id="monCompte" class="row">
                        <!--Bloc de gauche (Contener rempli par le template mon-compte-template)-->
                        <div id="stats" class="col-md-8"> </div>
                        <!--FIN bloc de gauche-->

                        <!--Bloc de droite-->
                        <div class="col-md-4">
                            <div class="widget">
                                <div class="widget-head"><h4 class="heading"><i class="fa fa-info"></i> Mes notifications</h4></div>
                                <div class="widget-body">
                                    <div class="widget widget-heading-simple widget-body-simple">
                                        <div class="widget-body">
                                            <div class="widget widget-tabs widget-tabs-icons-only-2 widget-activity margin-none">
                                                <div class="widget-head">
                                                    <ul>
                                                        <li class="active" data-toggle="tooltip" data-placement="top" title="Notifications non lues"><a data-toggle="tab" href="#filterNoRead"><i class="fa fa-circle-o"></i></a></li>
                                                        <li data-toggle="tooltip" data-placement="top" title="Notifications lues"><a data-toggle="tab" href="#filterRead"><i class="fa fa-circle"></i></a></li>
                                                    </ul>
                                                </div>
                                                <div class="widget-body" id="ContainerNotificationsMonCompte">
                                                    <div class="tab-content">

                                                        <div class="tab-pane active" id="filterNoRead">
                                                            <br/>
                                                            <div class="panel-group accordion" id="notificationsNoRead">

                                                            </div>
                                                        </div>

                                                        <div class="tab-pane" id="filterRead">
                                                            <br/>
                                                            <div class="panel-group accordion" id="notificationsRead">

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bg-gray box-generic margin-none">
                                <div class="innerAll text-center">
                                    <div class="innerAll">
                                        <div class="glyphicons glyphicon-xlarge glyphicon-top circle_question_mark">
                                            <i></i>
                                            <h4>Nous contacter ?</h4>
                                            <p class="margin-none">Notre équipe reste à votre entière disposition par email, 7jours/7 !<br/> <a href="mailto:info@lizbox.com?Subject=Service après-vente Lizbox : (ma demande)" target="_top" class="text-underline">info@lizbox.com</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--FIN Bloc de droite-->
                    </div>
                    <!--FIN Page complete-->
                    <div class="clearfix"></div>
                </div>
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

                <script type="text/javascript" src="<%=request.getContextPath()%>/js/model/statistiques.js" ></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/js/model/notification.js" ></script>

                <script type="text/javascript" src="<%=request.getContextPath()%>/js/collection/notificationsRead.js" ></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/js/collection/notificationsNoRead.js" ></script>

                <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/template/monCompteTemplate.js" ></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/template/notifications/notificationMonCompteTemplate.js" ></script>

                <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/moncompte.js" ></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/gravatarMonCompte.js" ></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/notificationMonCompteView.js" ></script>


                <script>
                    var statistiques = new StatistiquesModel();
                    window.lizbox = {
                        statistiques : statistiques,
                        monCompte : new MonCompteView({model : statistiques}),
                        notificationsView : new NotificationMonCompteView({})
                    }
                </script>

                <script type="text/template" id="mon-compte-template">
                    <div class="row">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="widget">
                                    <div class="widget-head"><h4 class="heading"><i class="fa fa-hdd-o"></i> Mes données</h4></div>
                                    <div class="widget-body">
                                        <p class="text-medium">Espace utilisé</p>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-inverse" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: <@= documentsStatistiques.pourcentageEspaceUtilise @>%"></div>
                                        </div>
                                        <div class="text-right">
                                            <p class="strong margin-none"><@= unUsedStorage @> disponible(s) sur <@= totalStorage @></p>
                                            <p>
                                                <em>Vous avez utilisé <@= documentsStatistiques.pourcentageEspaceUtilise @>%</em>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget">
                                    <div class="bg-primary text-center innerAll">
                                        <div class="innerTB">
                                            <div class="strong text-xlarge text-white">
                                                <@= planEntity.label @>
                                            </div>
                                            <p class="margin-none"><em>Bande passante <@= planEntity.bandepassante @></em></p>
                                        </div>
                                    </div>
                                    <div class="row row-merge">
                                        <div class="col-md-6">
                                            <div class="text-center innerAll">
                                                <p class="margin-none">
                                                    <a href="https://play.google.com/store/apps" target="_blank">
                                                        <i class="fa fa-android fa-3x" style="display: <@= hasAndroid @>;"></i>
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="text-center innerAll">
                                                <p class="margin-none">
                                                    <a href="<%=request.getContextPath()%>/desktopApp/Lizbox_desktop.jar" target="_blank">
                                                        <i class="fa fa-desktop fa-3x" style="display: <@= hasDesktop @>;"></i>
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="media widget innerAll">
                                            <div id="myGravatar" class="pull-left gravatarMonCompte">
                                                <a href="http://www.gravatar.com" target="_blank">
                                                    <img class="media-object gravatarImg" src="">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h5 class="pull-right">Date d'inscription : <@= registerDate @></h5>
                                                <h2 class="media-heading text-primary"><@= utilisateurEntity.pseudo @></h2>
                                                <h5 class="margin-none"><@= isMale @> <@= utilisateurEntity.nom @> <@= utilisateurEntity.prenom @></h5>
                                                <h5 class="margin-none"><em><@= utilisateurEntity.email @></em></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="widget-stats widget-stats-primary widget-stats-1">
                                            <span class="glyphicons file"><i></i><span class="txt">Nombre de fichiers</span></span>
                                            <div class="clearfix"></div>
                                            <span class="count"><@= documentsStatistiques.nbrFichiers @></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="widget-stats widget-stats-primary widget-stats-1">
                                            <span class="glyphicons folder_plus"><i></i><span class="txt">Nombre de dossiers</span></span>
                                            <div class="clearfix"></div>
                                            <span class="count"><@= documentsStatistiques.nbrDossiers @></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="widget-stats widget-stats-inverse widget-stats-1">
                                            <span class="glyphicons globe"><i></i><span class="txt">Partages publics</span></span>
                                            <div class="clearfix"></div>
                                            <span class="count"><@= partageStatistiques.nbrPartagePublic @></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="widget-stats widget-stats-inverse widget-stats-1">
                                            <span class="glyphicons group"><i></i><span class="txt">Partages privés</span></span>
                                            <div class="clearfix"></div>
                                            <span class="count"><@= partageStatistiques.nbrPartagePrivee @></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="widget-stats widget-stats-inverse widget-stats-1">
                                            <span class="glyphicons magnet"><i></i><span class="txt">Documents partagés avec moi</span></span>
                                            <div class="clearfix"></div>
                                            <span class="count"><@= partageStatistiques.nbrPartageAMoi @></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </script>

                <script type="text/template" id="notifications-noread-template">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <i class="fa <@= lu @> pull-right <@= toread @>" data-toggle="tooltip" data-placement="left" title="<@= tooltipToread @>"></i>
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse-<@=id@>">
                                <strong><@=smallDate@></strong>
                                - <@=titre@>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse-<@=id@>" class="panel-collapse collapse">
                        <div class="panel-body">
                            <@=message@>
                        </div>
                    </div>
                </script>
            </div>
        </div>
    </body>
</html>

