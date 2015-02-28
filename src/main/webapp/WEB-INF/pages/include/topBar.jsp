<%--
  Created by IntelliJ IDEA.
  User: laurent
  Date: 15/02/2014
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize ifAnyGranted="ROLE_FREE,ROLE_PREMIUM,ROLE_PRO,ROLE_ADMIN">
<jsp:include page="../include/js.jsp"/>

<nav class="navbar hidden-print main " role="navigation">
    <div class="navbar-header pull-left">
        <div class="user-action user-action-btn-navbar pull-left border-right">
            <button class="btn btn-sm btn-navbar btn-inverse btn-stroke"><i class="fa fa-bars fa-2x"></i>
            </button>
        </div>
    </div>
    <ul class="main pull-right ">
        <li class="dropdown notif notifications hidden-xs" id="ContainerNotifications">
            <a href="" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-bell-fill"></i> <span class="label label-danger countNotification"></span></a>
            <ul class="dropdown-menu chat media-list pull-right"> </ul>
        </li>

        <li class="dropdown username gravatarTopBar">
            <a href="" class="dropdown-toggle" data-toggle="dropdown">
                <img src="" class="img-circle gravatarImg"
                     width="30" /> <sec:authentication property="principal.username"/>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu pull-right">
                <li><a href="<%=request.getContextPath()%>/documents" class="glyphicons file no-ajaxify"><i></i> Mes documents</a>
                </li>
                <li><a href="<%=request.getContextPath()%>/moncompte" class="glyphicons user no-ajaxify"><i></i>Mon compte</a>
                </li>
                <li><a href="<%=request.getContextPath()%>/offres" class="glyphicons money no-ajaxify"><i></i>Changer d'offre</a>
                </li>
                <li><a href="<%=request.getContextPath()%>/j_spring_security_logout" class="glyphicons lock no-ajaxify"><i></i>Déconnexion</a>
                </li>
            </ul>
        </li>

    </ul>

</nav>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/model/notification.js" ></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/collection/notificationsNoRead.js" ></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/template/notifications/notificationTopBarTemplate.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/template/notifications/linkAllNotificationsTemplate.js" ></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/gravatarTopBar.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/view/notificationTopBarView.js" ></script>



    <script type="text/template" id="notification-template">
        <a class="pull-left" href="#">
            <img src="http://www.gravatar.com/avatar/1612b310295091179cd9bf9759741446" width="30" />
        </a>
        <div class="media-body <@= classLu @>">
            <i class="fa <@= lu @> pull-right <@= toread @>" data-toggle="tooltip" data-placement="top" title="<@= tooltipToread @>"></i>
            <span class="label label-default pull-right"><@= date @></span>

            <h5 class="media-heading"><@= titre @></h5>
            <p class="margin-none"><@= message @></p>
        </div>
    </script>
    <script type="text/template" id="all-notification-link-template">
        <a href="<%=request.getContextPath()%>/moncompte" class="btn btn-primary"><i class="fa fa-list"></i> <span>Voir toutes les notifications</span></a>
        <a href="#" id="readAll" class="btn btn-primary"><i class="fa fa-circle"></i> <span>Tout marquer comme lu</span></a>
    </script>
    <script>
        var gravatar = new GravatarTopBar();
        window.utilisateurBar = {
            notificationView : new NotificationTopBarView({collection : new NotificationsNoRead()})
        }
    </script>
</sec:authorize>


