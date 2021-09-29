<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="hero-slider-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="slider-wrapper-area2 mt-30">
                    <div class="hero-slider-active hero__2 slick-dot-style hero-dot">
                        <c:forEach items="${lstShowBanner}" var="banner" varStatus="theCount">
                            <c:if test="${theCount.index < 5}">
                                <div class="single-slider d-flex align-items-center"
                                     style="background-image:
                                             url(<c:url value="${banner.image}"/>);">
                                    <div class="container">
                                        <div class="slider-main-content">
                                            <div class="slider-text text-center">
                                                <h2>${banner.name}</h2>
                                                <h3>${banner.event}</h3>
                                                <p>${banner.description}</p>
                                                <a class="home-btn" href="<c:url value="${banner.link}"/>">click now</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>