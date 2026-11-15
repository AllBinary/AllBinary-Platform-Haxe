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
package org.allbinary.business.user.commerce.inventory.item;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.commerce.money.MoneyException;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.communication.http.request.RequestParams;

class ItemFactoryUnused {
    public function new() {
    }

    // throws MoneyException
    public static function getInstance(hashMap : HashMap) : TableMappingInterface {
        return (cast new Item(hashMap) : TableMappingInterface);
    }

    // throws Exception, MoneyException
    public static function getInstance(request : HttpServletRequest) : TableMappingInterface {
        return (cast new Item(new RequestParams(request).toHashMap()) : TableMappingInterface);
    }

}

