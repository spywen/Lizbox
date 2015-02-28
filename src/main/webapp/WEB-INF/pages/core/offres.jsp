<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="ie lt-ie9 lt-ie8 lt-ie7 "> <![endif]-->
<!--[if IE 7]>    <html class="ie lt-ie9 lt-ie8 "> <![endif]-->
<!--[if IE 8]>    <html class="ie lt-ie9 "> <![endif]-->
<!--[if gt IE 8]> <html class="ie "> <![endif]-->
<!--[if !IE]><!-->
<html>
<!-- <![endif]-->
<head>
    <title>Offres - Lizbox</title>
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
    <script src="<%=request.getContextPath()%>/assets/components/library/jquery/jquery.min.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/library/jquery/jquery-migrate.min.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/library/modernizr/modernizr.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/plugins/less-js/less.min.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/modules/admin/charts/flot/assets/lib/excanvas.js?v=v1.0.3-rc2"></script>
    <script src="<%=request.getContextPath()%>/assets/components/plugins/browser/ie/ie.prototype.polyfill.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/modules/admin/notifications/notyfy/assets/lib/js/jquery.notyfy.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/modules/admin/notifications/notyfy/assets/custom/js/notyfy.init.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script>
    if ( /*@cc_on!@*/ false && document.documentMode === 10)
    {
        document.documentElement.className += ' ie ie10';
    }
    </script>

    <jsp:include page="../include/header.jsp"/>
</head>
<body class="offresWrapper">
    <div class="container-fluid menu-hidden">
        <div id="content">
            <div class="container">
                <div class="row row-app">
                    <div class="col-separator col-unscrollable box">
                        <div class="col-table">
                            <h4 class="innerAll margin-none border-bottom text-center"><i class="fa fa-flag"></i> Nos offres</h4>
                            <div class="col-table-row">
                                <div class="col-app col-unscrollable">
                                    <div class="col-app">
                                        <div class="containerOffres">
                                            <div class="table-pricing-3">
                                                <ul class="list-unstyled row">
                                                    <li class="col-md-4">
                                                        <div class="innerAll">
                                                            <h3>FREE</h3>
                                                            <div class="body">
                                                                <div class="price free-prix">

                                                                </div>
                                                            </div>
                                                            <div class="features">
                                                                <ul>
                                                                    <li class="free-espace"></li>
                                                                    <li class="free-bandepassante"></li>
                                                                    <li class="free-android"></li>
                                                                    <li class="free-desktop"></li>
                                                                </ul>
                                                            </div>
                                                            <div class="footer">
                                                                <sec:authorize access="hasAnyRole('ROLE_PRO','ROLE_PREMIUM','ROLE_FREE')">
                                                                    <a type="button" disabled="disabled" class="btn btn-default" href="#"><i class="fa fa-thumbs-up"></i></a>
                                                                </sec:authorize>
                                                                <sec:authorize access="!hasAnyRole('ROLE_PREMIUM','ROLE_PRO','ROLE_FREE')">
                                                                    <a type="button" class="btn btn-info" href="/inscription.jsp"><i class="fa fa-circle-o"></i> Souscrire</a>
                                                                </sec:authorize>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="col-md-4 active">
                                                        <div class="innerAll">
                                                            <h3>PREMIUM</h3>
                                                            <div class="body">
                                                                <div class="price">
                                                                    <span class="figure premium-prix"></span>
                                                                    <span class="term">/ mois</span>
                                                                </div>
                                                            </div>
                                                            <div class="features">
                                                                <ul>
                                                                    <li class="premium-espace"></li>
                                                                    <li class="premium-bandepassante"></li>
                                                                    <li class="premium-android"></li>
                                                                    <li class="premium-desktop"></li>
                                                                </ul>
                                                            </div>
                                                            <div class="footer">
                                                                <sec:authorize access="hasAnyRole('ROLE_PRO','ROLE_PREMIUM')">
                                                                    <a type="button" disabled="disabled" class="btn btn-default" href="#"><i class="fa fa-thumbs-up"></i></a>
                                                                </sec:authorize>
                                                                <sec:authorize access="!hasAnyRole('ROLE_PREMIUM','ROLE_PRO')">
                                                                    <a type="button" class="btn btn-info" href="#"><i class="fa fa-circle-o"></i> Souscrire</a>
                                                                </sec:authorize>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="col-md-4">
                                                        <div class="innerAll">
                                                            <h3>PRO</h3>
                                                            <div class="body">
                                                                <div class="price">
                                                                    <span class="figure pro-prix"></span>
                                                                    <span class="term">/ mois</span>
                                                                </div>
                                                            </div>
                                                            <div class="features">
                                                                <ul>
                                                                    <li class="pro-espace"></li>
                                                                    <li class="pro-bandepassante"></li>
                                                                    <li class="pro-android"></li>
                                                                    <li class="pro-desktop"></li>
                                                                </ul>
                                                            </div>
                                                            <div class="footer">
                                                                <sec:authorize access="hasRole('ROLE_PRO')">
                                                                    <a type="button" disabled="disabled" class="btn btn-default" href="#"><i class="fa fa-thumbs-up"></i></a>
                                                                </sec:authorize>
                                                                <sec:authorize access="!hasRole('ROLE_PRO')">
                                                                    <a type="button" class="btn btn-info" href="#"><i class="fa fa-circle-o"></i> Souscrire</a>
                                                                </sec:authorize>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <div class="clearfix"></div>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="text-center">
                                                <sec:authorize access="!hasAnyRole('ROLE_PREMIUM','ROLE_PRO','ROLE_FREE','ROLE_ADMIN')">
                                                    <a href="<%=request.getContextPath()%>/" class="btn btn-primary">Retour</a>
                                                </sec:authorize>
                                                <sec:authorize access="hasAnyRole('ROLE_PREMIUM','ROLE_PRO','ROLE_FREE','ROLE_ADMIN')">
                                                    <a href="<%=request.getContextPath()%>/documents" class="btn btn-primary">Retour</a>
                                                </sec:authorize>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Global -->
    <script data-id="App.Config">
    var App = {};
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
    </script>
    <script src="<%=request.getContextPath()%>/assets/components/library/bootstrap/js/bootstrap.min.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/plugins/nicescroll/jquery.nicescroll.min.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/plugins/breakpoints/breakpoints.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/plugins/preload/pace/pace.min.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/plugins/preload/pace/preload.pace.init.js?v=v1.0.3-rc2&sv=v0.0.1.1"></script>
    <script src="<%=request.getContextPath()%>/assets/components/core/js/animations.init.js?v=v1.0.3-rc2"></script>
    <script src="<%=request.getContextPath()%>/assets/components/core/js/core.init.js?v=v1.0.3-rc2"></script>


    <script type="text/javascript" src="<%=request.getContextPath()%>/js/utils.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/model/plan.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/collection/plans.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/offres.js" ></script>

    <script>
        var plans = new Plans();
        window.lizbox = {
            plans : plans,
            offres : new Offres({collection : plans})
        }
    </script>
</body>
</html>