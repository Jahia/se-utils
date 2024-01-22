<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<c:set var="linkType" value="${currentNode.properties['seu:linkType'].string}" />

<c:set var="width" value="${not empty currentResource.moduleParams.mediaWidth ? currentResource.moduleParams.mediaWidth : '1028'}"/>
<c:set var="height" value="${currentResource.moduleParams.mediaHeight}"/>
<c:set var="scale" value="${currentResource.moduleParams.mediaScale}"/>
<c:set var="quality" value="${currentResource.moduleParams.mediaQuality}"/>

<c:choose>
    <c:when test="${linkType eq 'internalLink'}">
        <c:set var="linkedNode" value="${currentNode.properties['seu:internalLink'].node}"/>
        <c:if test="${! empty mediaNode}">
            <c:catch var ="getUrlException">
                <c:set var="linkUrl" value="${linkedNode.getUrl(['width:'.concat(width),'height:'.concat(height),'scale:'.concat(scale),'quality:'.concat(quality)])}"/>
            </c:catch>
            <c:if test = "${getUrlException != null}">
                <c:set var="linkUrl" value="${linkedNode.getUrl()}"/>
            </c:if>
        </c:if>
    </c:when>
    <c:when test="${linkType eq 'externalLink'}">
        <c:url var="linkUrl" value="${currentNode.properties['seu:externalLink'].string}"/>
    </c:when>
    <c:when test="${linkType eq 'self'}">
        <c:url var="linkUrl" value="${currentNode.url}"/>
    </c:when>
</c:choose>

<utility:logger level="DEBUG" value="[linkTo.hidden.getLinkToURL] The linkTo url is ${linkUrl}"/>

<template:include view="hidden.getUTM">
    <template:param name="linkUrl" value="${linkUrl}"/>
</template:include>

<%--moduleMap.linkUrl is set by the template getUTM--%>
<utility:logger level="DEBUG" value="[linkTo.hidden.getLinkToURL] The moduleMap.linkUrl url is ${moduleMap.linkUrl}"/>

<c:set target="${moduleMap}" property="linkTarget" value="${currentNode.properties['seu:linkTarget'].string}" />
