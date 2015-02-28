<%--
  Created by IntelliJ IDEA.
  User: laurent
  Date: 26/03/2014
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize ifAnyGranted="ROLE_FREE,ROLE_PREMIUM,ROLE_PRO,ROLE_ADMIN">

<div id="menu" class="hidden-print hidden-xs  sidebar-white">
    <div id="sidebar-collapse-wrapper">
        <div id="brandWrapper">
            <a href="<%=request.getContextPath()%>/documents" class="display-block-inline pull-left logo no-ajaxify">
                <img src="<%=request.getContextPath()%>/images/lizbox_logo_64x64.png" alt="">
            </a>
            <a href="<%=request.getContextPath()%>/documents" class="no-ajaxify">
                <span class="text">Lizbox</span>
            </a>
        </div>
        <div id="logoWrapper">
            <div id="logo">
                <a href="<%=request.getContextPath()%>/" class="btn btn-sm btn-inverse no-ajaxify" data-toggle="tooltip" data-placement="right" title="Retour à l'accueil"><i class="fa fa-fw icon-home-fill-1"></i></a>
                <a href="<%=request.getContextPath()%>/j_spring_security_logout" class="btn btn-sm btn-inverse pull-right no-ajaxify" data-toggle="tooltip" data-placement="left" title="Déconnexion"><i class="fa fa-fw fa-sign-out"></i></a>
            </div>
        </div>
        <ul class="menu list-unstyled hide" id="navigation_components">
        </ul>
        <ul class="menu list-unstyled hide" id="navigation_modules">
        </ul>
        <ul class="menu list-unstyled hide" id="navigation_modules_front">
        </ul>
        <ul class="menu list-unstyled" id="navigation_current_page">
            <li>
                <a href="<%=request.getContextPath()%>/documents" class="fa fa-file no-ajaxify"><i></i><span>Mes documents</span></a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/documents/upload" class="fa fa-upload no-ajaxify"><i></i><span>Upload</span></a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/moncompte" class="fa fa-user no-ajaxify"><i></i><span>Mon compte</span></a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/offres" class="fa fa-money no-ajaxify"><i></i><span>Offres</span></a>
            </li>
        </ul>
    </div>
</div>

</sec:authorize>