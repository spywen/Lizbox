<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="ie lt-ie9 lt-ie8 lt-ie7 "> <![endif]-->
<!--[if IE 7]>    <html class="ie lt-ie9 lt-ie8 "> <![endif]-->
<!--[if IE 8]>    <html class="ie lt-ie9 "> <![endif]-->
<!--[if gt IE 8]> <html class="ie "> <![endif]-->
<!--[if !IE]><!-->
<html class="">
<!-- <![endif]-->
<head>
    <title>Login - Lizbox</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">

    <!--[if lt IE 9]><link rel="stylesheet" href="<%=request.getContextPath()%>/assets/components/library/bootstrap/css/bootstrap.min.css" /><![endif]-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/module.admin.stylesheet-complete.sidebar_type.collapse.min.css"/>

    <!--Notyfy-->
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
<body class=" loginWrapper">
<div class="container-fluid menu-hidden">
    <div id="content">
        <div class="container">
            <div class="row row-app">
                <div class="col-separator col-unscrollable box">
                    <div class="col-table">
                        <h4 class="innerAll margin-none border-bottom text-center"><i class="fa fa-lock"></i> Connexion &agrave; votre compte</h4>
                        <div class="col-table-row">
                            <div class="col-app col-unscrollable">
                                <div class="col-app">
                                    <div class="login">
                                        <div class="placeholder text-center"><i class="fa fa-lock"></i>
                                        </div>
                                        <div class="panel panel-default col-md-4 col-sm-6 col-sm-offset-3 col-md-offset-4">
                                            <div class="panel-body">
                                                <form role="form" action="j_spring_security_check" method="post">
                                                    <div class="form-group">
                                                        <label for="j_username">Pseudo</label>
                                                        <input type="text" class="form-control" tabindex="0" autofocus id="j_username" name="j_username" placeholder="Votre pseudo">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="j_password">Mot de passe</label>
                                                        <input type="password" class="form-control" name="j_password" id="j_password" placeholder="Votre mot de passe">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary btn-block">Me connecter</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-sm-offset-4 text-center">
                                            <div class="innerAll">
                                                <a href="<%=request.getContextPath()%>/inscription" class="btn btn-info">M'inscrire <i class="fa fa-pencil"></i> </a>
                                                <div class="separator"></div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
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
            <%
                if (request.getParameter("errorlogin") != null) {
            %>
            <script>
                var notyfy = notyfy({
                    text: '<strong>Identifiants incorrects.</strong> Réessayez ou inscrivez-vous sur ...',
                    type: 'error',
                    theme: null
                });
            </script>
            <%
                }
            %>

            <%
                if (request.getParameter("inscriptionSuccess") != null) {
            %>
            <script>
                var notyfy = notyfy({
                    text: '<strong>Votre inscription est un succès !</strong> Connectez-vous sur Lizbox dès à présent à l\'aide de vos identifiants.',
                    type: 'success',
                    theme: null
                });
            </script>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>