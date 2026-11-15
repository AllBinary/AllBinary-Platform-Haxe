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

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.business.user.role.BasicUserRole;
import org.allbinary.business.user.role.BasicUserRoleData;
import org.allbinary.logic.java.bool.BooleanFactory;

class BasicWeblisketSession {
    private var session : HttpSession;
    private var pageContext : PageContext;
    public function new(pageContext : PageContext) {
        this.pageContext = pageContext;
        var request : HttpServletRequest = (cast pageContext.getRequest() : HttpServletRequest);
        this.session = request.getSession(true);
    }

    public function setRole(aRole : BasicUserRole) : Void {
        this.session.setAttribute(BasicUserRoleData.NAME.toString(), aRole);
    }

    public function getRole() : BasicUserRole {
        return (cast this.session.getAttribute(BasicUserRoleData.NAME.toString()) : BasicUserRole);
    }

    public function setPassword(password : String) : Void {
        this.session.setAttribute(UserData.PASSWORD, password);
    }

    public function setUserName(userName : String) : Void {
        this.session.setAttribute(UserData.USERNAME, userName);
    }

    public function setPaymentMethod(value : String) : Void {
        this.session.setAttribute(PaymentGatewayData.NAME.toString(), value);
    }

    public function setAuthenticated() : Void {
        this.session.setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().TRUE_STRING);
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
        return (cast this.session.getAttribute(PaymentGatewayData.NAME.toString()) : String);
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

    public function setAuthenticated(value : Bool) : Void {
        this.session.setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().FALSE_STRING);
    }

    public function clear() : Void {
        this.session.removeAttribute(WeblisketSessionData.AUTHENTICATED);
        this.session.removeAttribute(WeblisketSessionData.TIMEOUT);
        this.session.removeAttribute(BasicUserRoleData.NAME.toString());
        this.session.removeAttribute(UserData.USERNAME);
    }

    public function getCreationTime() : haxe.Int64 {
        return this.session.getCreationTime();
    }

    public function getLastAccessedTime() : haxe.Int64 {
        var lastAccessedTime : haxe.Int64 = this.session.getLastAccessedTime();
        return lastAccessedTime;
    }

}

