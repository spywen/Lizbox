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
        <title>Inscription - Lizbox</title>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">

        <!--[if lt IE 9]><link rel="stylesheet" href="<%=request.getContextPath()%>/assets/components/library/bootstrap/css/bootstrap.min.css" /><![endif]-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin/module.admin.stylesheet-complete.sidebar_type.collapse.min.css"/>
        <style>
            /*inscription*/
            body.inscriptionWrapper label.error, body.inscriptionWrapper input.error {
                padding-top: 0;
            }
            body.inscriptionWrapper label.error{
                color: #b21b1e;
            }
            /*inscription*/
        </style>
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
        <script type="text/javascript" src="<%=request.getContextPath()%>/lib/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>

    </head>
    <body class="inscriptionWrapper">
        <!-- Main Container Fluid -->
        <div class="container-fluid menu-hidden">
            <!-- Content -->
            <div id="content">
            <div class="container">
                <!-- row-app -->
                <div class="row row-app">
                    <!-- col -->
                    <!-- col-separator.box -->
                    <div class="col-separator col-unscrollable box">
                        <!-- col-table -->
                        <div class="col-table">
                            <h4 class="innerAll margin-none border-bottom text-center"><i class="fa fa-lock"></i> Inscription</h4>
                            <!-- col-table-row -->
                            <div class="col-table-row">
                                <!-- col-app -->
                                <div class="col-app col-unscrollable">
                                    <!-- col-app -->
                                    <div class="col-app">
                                        <div class="inscription">
                                        </div>
                                            <div class="panel panel-default col-md-4 col-sm-6 col-sm-offset-3 col-md-offset-4">
                                                <div class="panel-body">

                                                    <form role="form" id="contenerInscription" method="post">
                                                        <div class="form-group">
                                                            <label for="male">
                                                                <input type="radio" name="gender" id="male" value="1"> Madame
                                                            </label>
                                                            &nbsp;
                                                            <label for="female">
                                                                <input type="radio" name="gender" id="female" value="0"> Monsieur
                                                            </label>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" autofocus="autofocus">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Prénom" >
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" id="pseudo" name="pseudo" placeholder="Pseudo">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" id="email" name="email" placeholder="Email">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="password" class="form-control" name="password" id="password" placeholder="Mot de passe">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirmation du mot de passe">
                                                        </div>
                                                        <div class="text-center"><button type="submit" id="submitInscription" class="btn btn-primary btn-lg">S'inscrire</button></div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 col-sm-offset-4 text-center">
                                                <div class="innerAll">
                                                    <a href="<%=request.getContextPath()%>" class="btn btn-info">Retour à l'accueil <i class="fa fa-home"></i> </a>
                                                    <div class="separator"></div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <!-- // END col-app -->
                                </div>
                                <!-- // END col-app.col-unscrollable -->
                            </div>
                            <!-- // END col-table-row -->
                        </div>
                        <!-- // END col-table -->
                    </div>
                    <!-- // END col-separator.box -->
            </div>
                <!-- // END row-app -->
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

                <script type="text/javascript" src="<%=request.getContextPath()%>/js/model/utilisateur.js" ></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/inscription.js" ></script>

                <script>
                    var utilisateur = new Utilisateur();
                    window.lizbox = {
                        utilisateur : utilisateur,
                        inscription : new Inscription({model : utilisateur})
                    }
                </script>
            </div>
        </div>
    </body>
</html>