<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<c:set var="linkType" value="${currentNode.properties['seu:linkType'].string}" />

<c:set var="mediaWidth" value="${not empty currentResource.moduleParams.mediaWidth ? currentResource.moduleParams.mediaWidth : '1028'}" />
<c:set var="mediaHeight" value="${currentResource.moduleParams.mediaHeight}" />
<c:set var="mediaScale" value="${not empty currentResource.moduleParams.mediaScale ? currentResource.moduleParams.mediaScale : 1}" />
<c:set var="mediaQuality" value="${not empty currentResource.moduleParams.mediaQuality ? currentResource.moduleParams.mediaQuality : 72}" />

<c:choose>
    <c:when test="${linkType eq 'internalLink'}">
        <c:set var="mediaNode" value="${currentNode.properties['seu:internalLink'].node}"/>
        <c:if test="${! empty mediaNode}">
            <template:module node="${mediaNode}" view="hidden.getURL" var="linkUrl" editable="false" templateType="txt">
                <template:param name="width" value="${mediaWidth}"/>
                <template:param name="height" value="${mediaHeight}"/>
                <template:param name="scale" value="${mediaScale}"/>
                <template:param name="quality" value="${mediaQuality}"/>
            </template:module>
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
