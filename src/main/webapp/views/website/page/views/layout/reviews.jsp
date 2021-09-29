<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="product-details-reviews mt-34">
    <div class="row">
        <div class="col-lg-12">
            <div class="product-review-info">
                <ul class="nav review-tab">
                    <li>
                        <a class="active" data-toggle="tab" href="#tab_one">
                            <fmt:message key="CONTENT.DETAILS.MOTA"/>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#tab_two">
                            <fmt:message key="CONTENT.DETAILS.THONGSO"/>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#tab_three">
                            <fmt:message key="CONTENT.DETAILS.DANHGIA"/>
                        </a>
                    </li>
                </ul>
                <div class="tab-content reviews-tab">
                    <div class="tab-pane fade show active" id="tab_one">
                        <div class="tab-one">
                            <c:out value="${product.description}" escapeXml="false"/>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab_two">
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <td>color</td>
                                <td>black, blue, red</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>L, M, S</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="tab_three">
                        <form action="#" class="review-form">
                            <h5>1 review for Simple product 12</h5>
                            <div class="total-reviews">
                                <div class="rev-avatar">
                                    <img src="assets/img/about/avatar.jpg" alt="">
                                </div>
                                <div class="review-box">
                                    <div class="ratings">
                                        <span class="good"><i class="fa fa-star"></i></span>
                                        <span class="good"><i class="fa fa-star"></i></span>
                                        <span class="good"><i class="fa fa-star"></i></span>
                                        <span class="good"><i class="fa fa-star"></i></span>
                                        <span><i class="fa fa-star"></i></span>
                                    </div>
                                    <div class="post-author">
                                        <p><span>admin -</span> 30 Nov, 2018</p>
                                    </div>
                                    <p>Aliquam fringilla euismod risus ac bibendum. Sed sit amet sem
                                        varius ante feugiat lacinia. Nunc ipsum nulla, vulputate ut
                                        venenatis vitae, malesuada ut mi. Quisque iaculis, dui congue
                                        placerat pretium, augue erat accumsan lacus</p>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label class="col-form-label"><span class="text-danger">*</span>
                                        Your Name</label>
                                    <input type="text" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label class="col-form-label"><span class="text-danger">*</span>
                                        Your Email</label>
                                    <input type="email" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label class="col-form-label"><span class="text-danger">*</span>
                                        Your Review</label>
                                    <textarea class="form-control" required></textarea>
                                    <div class="help-block pt-10"><span class="text-danger">Note:</span>
                                        HTML is not translated!
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col">
                                    <label class="col-form-label"><span class="text-danger">*</span>
                                        Rating</label>
                                    &nbsp;&nbsp;&nbsp; Bad&nbsp;
                                    <input type="radio" value="1" name="rating">
                                    &nbsp;
                                    <input type="radio" value="2" name="rating">
                                    &nbsp;
                                    <input type="radio" value="3" name="rating">
                                    &nbsp;
                                    <input type="radio" value="4" name="rating">
                                    &nbsp;
                                    <input type="radio" value="5" name="rating" checked>
                                    &nbsp;Good
                                </div>
                            </div>
                            <div class="buttons">
                                <button class="sqr-btn" type="submit">Continue</button>
                            </div>
                        </form> <!-- end of review-form -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

