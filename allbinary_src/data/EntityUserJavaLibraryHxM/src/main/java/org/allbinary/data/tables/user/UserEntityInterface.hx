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
package org.allbinary.data.tables.user;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.UserInterface;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.data.tables.BasicDataTableInterface;

interface UserEntityInterface extends BasicDataTableInterface {
    // throws Exception
    function getAdministrators() : BasicArrayList;

    // throws Exception
    function getStoreManagers(storeFrontInterface : StoreFrontInterface) : BasicArrayList;

    // throws Exception
    function getCustomers() : BasicArrayList;

    // throws Exception
    function getUsersWithRole(userRole : UserRole) : BasicArrayList;

    // throws Exception
    function getUsers(storeFrontInterface : StoreFrontInterface) : BasicArrayList;

    // throws Exception
    function getUser(userName : String) : UserInterface;

    function login(userName : String, password : String) : String;

    function deleteWhere(key : String, value : String) : Void;

    function insert(values : BasicArrayList) : Void;

    function update(userName : String, updatedValues : HashMap) : Void;

}

