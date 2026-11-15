/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.logic.communication.http.request.session;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.commerce.inventory.basket.Basket;
import org.allbinary.business.user.commerce.inventory.order.Order;
import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.business.user.role.UserRoleB;
import org.allbinary.business.user.role.UserRoleData;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.string.StringValidationUtil;

class WeblisketSession implements WeblisketSessionInterface {
    private var session : HttpSession;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        // this(hashMap, (cast pageContext.getRequest() : HttpServletRequest)) - Haxe has one constructor
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap, httpServletRequest : HttpServletRequest) {
        var propertiesHashMap : HashMap = hashMap;
        var request : HttpServletRequest = httpServletRequest;
        this.session = request.getSession(true);
        if (this.getStoreName() == null) {
            this.setStoreName((cast propertiesHashMap.get(StoreFrontData.getInstance().NAME) : String));
        }
    }

    public function getId() : String {
        return this.session.getId();
    }

    public function setPassword(password : String) : Void {
        this.session.setAttribute(UserData.PASSWORD, password);
    }

    public function setUserName(userName : String) : Void {
        this.session.setAttribute(UserData.USERNAME, userName);
    }

    public function setPaymentMethod(value : String) : Void {
        this.session.setAttribute(Std.string(PaymentGatewayData.NAME), value);
    }

    public function setAuthenticated() : Void {
        this.session.setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().TRUE_STRING);
    }

    public function setRole(aRole : UserRole) : Void {
        this.session.setAttribute(Std.string(UserRoleData.NAME), aRole);
    }

    public function setAttempts(value : Null<Int>) : Void {
        this.session.setAttribute(WeblisketSessionData.ATTEMPTS, value);
    }

    public function setTimeout(value : String) : Void {
        this.session.setAttribute(WeblisketSessionData.TIMEOUT, value);
    }

    public function setStoreName(value : String) : Void {
        this.session.setAttribute(StoreFrontData.getInstance().NAME, value);
    }

    public function getWebAppPath() : String {
        return (cast this.session.getAttribute(org.allbinary.globals.GLOBALS2.WEBAPPPATH) : String);
    }

    public function getUserName() : String {
        return (cast this.session.getAttribute(UserData.USERNAME) : String);
    }

    public function getPassword() : String {
        return (cast this.session.getAttribute(UserData.PASSWORD) : String);
    }

    public function getPaymentMethod() : String {
        return (cast this.session.getAttribute(Std.string(PaymentGatewayData.NAME)) : String);
    }

    public function getAuthentication() : String {
        return (cast this.session.getAttribute(WeblisketSessionData.AUTHENTICATED) : String);
    }

    public function getAttempts() : Null<Int> {
        return (cast this.session.getAttribute(WeblisketSessionData.ATTEMPTS) : Null<Int>);
    }

    public function getTimeout() : String {
        return (cast this.session.getAttribute(WeblisketSessionData.TIMEOUT) : String);
    }

    public function getStoreName() : String {
        return (cast this.session.getAttribute(StoreFrontData.getInstance().NAME) : String);
    }

    // throws Exception
    public function getRole() : UserRole {
        var userRole : UserRole = (cast this.session.getAttribute(Std.string(UserRoleData.NAME)) : UserRole);
        if (userRole != null) {
            return UserRoleB.getRole(userRole.getBasicUserRole().getRole());
        } else {
            return null;
        }
    }

    // throws Exception
    public function getOrder() : OrderInterface {
        var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getStoreName());
        var basketName : String = storeFrontInterface.getBasketName();
        if (!StringValidationUtil.getInstance().isEmpty(basketName)) {
            var orderInterface : OrderInterface = (cast this.session.getAttribute(basketName) : OrderInterface);
            if (orderInterface == null) {
                orderInterface = (cast new Order(new Basket()) : OrderInterface);
            }
            this.session.setAttribute(basketName, orderInterface);
            return orderInterface;
        } else {
            throw new haxe.Exception("Basket Name Not Found");
        }
    }

    public function setAuthenticated(value : Bool) : Void {
        this.session.setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().FALSE_STRING);
    }

    public function clear() : Void {
        this.session.removeAttribute(WeblisketSessionData.AUTHENTICATED);
        this.session.removeAttribute(WeblisketSessionData.TIMEOUT);
        this.session.removeAttribute(Std.string(UserRoleData.NAME));
        this.session.removeAttribute(UserData.USERNAME);
    }

    public function getCreationTime() : haxe.Int64 {
        return this.session.getCreationTime();
    }

    public function getLastAccessedTime() : haxe.Int64 {
        return this.session.getLastAccessedTime();
    }

    public function removeBasket() : Void {
        var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getStoreName());
        var basketName : String = storeFrontInterface.getBasketName();
        if (!StringValidationUtil.getInstance().isEmpty(basketName)) {
            this.session.removeAttribute(basketName);
        }
    }

}

