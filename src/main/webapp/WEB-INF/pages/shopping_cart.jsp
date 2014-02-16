<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="shoppingCartModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title">Your shopping cart</h3>
            </div>
            <div class="modal-body">
                <c:if test="${empty cart.products}">
                    <p>Your shopping cart is empty&hellip;</p>
                </c:if>
                <c:if test="${not empty cart.products}">
                    <div class="well well-sm">Shopping cart info</div>
                    <table class="table">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                        <c:forEach items="${cart.products}" var="entry">
                            <tr>
                                <td>${entry.key.id}</td>
                                <td>${entry.key.name}</td>
                                <td>${entry.value}</td>
                                <td>${entry.key.price}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <h4>Total : $ ${cart.total}.</h4>

                    <div class="well well-sm">Client info</div>
                    <form:form modelAttribute="cart.client" class="form-horizontal" role="form" id="cart" action="/checkout">
                        <div class="form-group">
                            <label for="name" class="col-md-2 control-label">Name</label>

                            <div class="col-md-10">
                                <form:input type="text" class="form-control" id="name" placeholder="name"
                                            path="name"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-md-2 control-label">Address</label>

                            <div class="col-md-10">
                                <form:input type="text" class="form-control" id="address" placeholder="address"
                                            path="address"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-md-2 control-label">Phone</label>

                            <div class="col-md-10">
                                <form:input type="phone" class="form-control" id="phone" placeholder="phone"
                                            path="phone"/>
                            </div>
                        </div>
                    </form:form>
                </c:if>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <c:if test="${not empty cart.products}">
                    <button type="submit" class="btn btn-primary" form="cart">Checkout</button>
                </c:if>
            </div>
        </div>
    </div>
</div>

