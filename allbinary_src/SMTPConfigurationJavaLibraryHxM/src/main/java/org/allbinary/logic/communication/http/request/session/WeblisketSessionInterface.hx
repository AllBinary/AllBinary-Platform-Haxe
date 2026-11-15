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

import org.allbinary.business.user.commerce.inventory.order.OrderInterface;
import org.allbinary.business.user.role.UserRole;

interface WeblisketSessionInterface {
    function clear() : Void;

    function getAttempts() : Null<Int>;

    function getAuthentication() : String;

    function getCreationTime() : haxe.Int64;

    function getId() : String;

    function getLastAccessedTime() : haxe.Int64;

    // throws Exception
    function getOrder() : OrderInterface;

    function getPassword() : String;

    function getPaymentMethod() : String;

    // throws Exception
    function getRole() : UserRole;

    function getStoreName() : String;

    function getTimeout() : String;

    function getUserName() : String;

    function getWebAppPath() : String;

    function removeBasket() : Void;

    function setAttempts(value : Null<Int>) : Void;

    function setAuthenticated() : Void;

    function setAuthenticated(value : Bool) : Void;

    function setPassword(password : String) : Void;

    function setPaymentMethod(value : String) : Void;

    function setRole(aRole : UserRole) : Void;

    function setStoreName(value : String) : Void;

    function setTimeout(value : String) : Void;

    function setUserName(userName : String) : Void;

}

