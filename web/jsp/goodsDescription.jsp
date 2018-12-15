<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <link href="js/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="js/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
    <script src="js/jquery-validation/dist/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="css/product_content.css"/>
    <link href="css/style.css" rel="stylesheet">
</head>
<div>
    <nav class="navbar navbar-my" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="/image/logo.png" width="150" height="30" alt=""></a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="controller?command=catalog">${catalog}</a></li>
                </ul>
                <form class="navbar-form navbar-left" role="search" action="controller" method="POST" id="find-form">
                    <input type="hidden" name="command" value="find_goods"/>
                    <div class="form-group">
                        <input type="text" class="form-control" name="find" placeholder="${searchGood}">
                    </div>
                    <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>
                        ${search}
                    </button>
                </form>
                <ul class="nav navbar-nav">
                    <li><a href="controller?command=select_language&language=EN&page=path.page.goodsDescription"><span class="bfh-languages" data-language="en_US" data-flags="true"></span>EN</a></li>
                    <li><a href="controller?command=select_language&language=RU&page=path.page.goodsDescription"><span class="bfh-languages" data-language="ru_RU" data-flags="true"></span>RU</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${userType == 'GUEST'}">
                            <li><a href="controller?command=loginpage">${entrance}</a></li>
                            <li><a href="controller?command=registrationpage">${registration}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="controller?command=show_order">
                                <span class="glyphicon glyphicon-shopping-cart"></span>  ${basket} <span
                                    class="badge"> ${goodsOrder}</span></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                                        class="glyphicon glyphicon-user"></span> ${user}<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="controller?command=adminprofilepage">${myProfile}</a></li>
                                    <li><a href="controller?command=editpage">${edit}</a></li>
                                    <c:if test="${userType == 'ADMINISTRATOR'}">
                                        <li><a href="controller?command=show_customers">${users}</a></li>
                                        <li><a href="controller?command=black_list"> ${managingBlackList}</a></li>
                                        <li><a href="controller?command=show_purchase_history">${purchaseHistory} </a></li>
                                        <li><a href="controller?command=shop_management">${shopManagement} </a></li>
                                    </c:if>
                                    <li class="divider"></li>
                                    <li><a href="controller?command=logout">${logout}</a></li>
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="i-main c">
    <div class="left-menu">
        <div class="left-menu-title">
            <div class="left-menu-title-text"><span class="glyphicon glyphicon-list"></span> ${menuLabel}</div>
        </div>
        <div class="left-menu-block">
            <ul>
                <c:forEach var="catalog" items="${categoryList}">
                    <li><a href="controller?command=show_goods&id=${catalog.idCategory}">
                        <c:out value="${ catalog.categoryName }"/>
                    </a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="right right404 right-catalog">
        <div class="i-right-title">
            <div class="i-right-title-label i-right-title-label-10"></div>
            <div class="i-right-title-text">${catalog} - ${notFound}<c:out value="${categoryName}"/></div>
        </div>
        <c:set var="goods" value="${goodsDescription}"/>
        <div class="product content">
            <div class="shs-tocart shk-item">
                <div class="product-img-wrp">
                    <div class="product-img">
                        <div class="product-acii">
                            <div class="prod_new1">${newLabel}</div>
                        </div>
                        <a href="image/goods/<c:out value="${ goods.name }"/>.png" class="fancybox"><img
                                class="shk-image" alt=" <c:out value="${ goods.name }"/>"
                                src="image/goods/<c:out value="${ goods.name }"/>.png"></a>
                    </div>
                </div>
                <div class="product-other">
                    <div class="product-title"><c:out value="${goods.name }"/></div>
                    <div style="margin-top: 20px;">
                        <form action="controller" method="POST">
                            <c:choose>
                                <c:when test="${userType == 'GUEST'}">
                                    <div class="r-cat-other-price">
                                        <div class="r-cat-other-price-cell-wrp">
                                            <div class="r-cat-other-price-cell">
                                    <span class="r-cat-other-price-true shk-price"> ${priceLabel}: <c:out
                                            value="${ goods.unitPrice }"/></span>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <input type="hidden" name="command" value="make_order"/>
                                    <input type="hidden" name="idGoods" value="${goods.idGoods}"/>
                                    <input type="hidden" name="name" value="${goods.name}"/>
                                    <input type="hidden" name="unitPrice" value="${goods.unitPrice}"/>
                                    <div class="col-10" style="width:60px;"><input
                                            style="margin-left:10px; color:#efc400; background-color: #4f4f4f"
                                            class="form-control" name="number" type="number" value="0" min="1"
                                            max="${goods.number}"
                                            id="example-number-input">
                                    </div>
                                    <p>
                                    <div class="r-cat-other-price">
                                        <div class="r-cat-other-price-cell-wrp">
                                            <div class="r-cat-other-price-cell">
                                    <span class="r-cat-other-price-true shk-price" id="stuff_2618_price"> ${priceLabel}: <c:out
                                            value="${ goods.unitPrice }"/></span>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" value="${addBasketLabel}"
                                           style="background-color: #4f4f4f; color:#efc400; font-size: 20px; text-align: center;">
                                    </input>
                                    ${userBlackList}
                                    </p>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-text content">
            <div class="product-text-title">${producerLabel}:</div>
            <p><c:out value="${ goods.producer }"/></p>
            <div class="product-text-title">${descriptionLabel}:</div>
            <p><c:out value="${ goods.description }"/></p>
        </div>
    </div>
</div>
</body>
</html>
