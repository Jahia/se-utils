<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>


<%--UTM management--%>
<c:set var="utmSource" value="${currentNode.properties['seu:utmSource'].string}" />
<c:set var="utmMedium" value="${currentNode.properties['seu:utmMedium'].string}" />
<c:set var="utmCampaign" value="${currentNode.properties['seu:utmCampaign'].string}" />
<c:set var="utmTerm" value="${currentNode.properties['seu:utmTerm'].string}" />
<c:set var="utmContent" value="${currentNode.properties['seu:utmContent'].string}" />

<c:url var="linkUrlUTM" value="${currentResource.moduleParams.linkUrl}">
    <c:if test="${! empty utmSource}">
        <c:param name="utm_source" value="${utmSource}"/>
    </c:if>
    <c:if test="${! empty utmMedium}">
        <c:param name="utm_medium" value="${utmMedium}"/>
    </c:if>
    <c:if test="${! empty utmCampaign}">
        <c:param name="utm_campaign" value="${utmCampaign}"/>
    </c:if>
    <c:if test="${! empty utmTerm}">
        <c:param name="utm_term" value="${utmTerm}"/>
    </c:if>
    <c:if test="${! empty utmContent}">
        <c:param name="utm_content" value="${utmContent}"/>
    </c:if>
</c:url>

<utility:logger level="DEBUG" value="[linkTo.hidden.getUTM] The linkUrlUTM is ${linkUrlUTM}"/>

<c:set target="${moduleMap}" property="linkUrl" value="${linkUrlUTM}" />

