<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>E-SHOP</title>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <script>
        function showCart(){
            $("#cartPlaceHolder").load("getBasket", function(){
                $("#shoppingCartModal").modal();
            });
        }
    </script>
    <div class="page-header">
        <h1>E-SHOP
            <small>You can buy products there</small>
        </h1>
    </div>
    <c:if test="${param.order == 'saved'}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            Your order has saved successfully...
        </div>
    </c:if>
    <div class="well"> Click there to manage your Shopping Cart and checkout
        <button type="button" class="btn btn-success" onclick="showCart();">
            Shopping Cart
        </button>
    </div>
    <div class="row">
        <c:forEach items="${products}" var="product">
            <div class="col-md-3">
                <div class="thumbnail">
                    <img class="img-thumbnail" alt="200x200" style="width: 200px; height: 200px;">
                    <div class="caption">
                        <h3>${product.name}</h3>
                        <p>${product.description}</p>
                        <p>$ ${product.price}</p>
                        <p>
                            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="$.get('/addProduct/${product.id}')">
                                Add to Cart
                            </button>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div id = "cartPlaceHolder"></div>
</div>
</body>
</html>
