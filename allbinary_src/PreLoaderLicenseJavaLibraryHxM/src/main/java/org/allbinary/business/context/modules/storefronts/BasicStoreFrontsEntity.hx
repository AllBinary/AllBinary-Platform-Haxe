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
package org.allbinary.business.context.modules.storefronts;

//import java.util.HashMap;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.init.InitSql;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;

class BasicStoreFrontsEntity extends InitSql {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final tableName : String = "storefronts";
    public function new() {
        super(new UserDbInitInfo());
        this.setTable(this.tableName);
    }

    // throws Exception
    public function getStoreFrontInterface(name : String) : BasicStoreFrontInterface {
        var keysAndValues : HashMap = StdUtil.getInstance().createHashMap();
        keysAndValues.put(StoreFrontData.getInstance().NAME, name);
        var storeHashMap : HashMap = super.getRow(keysAndValues);
        if (storeHashMap == null) {
            throw new haxe.Exception("No Such Store: " + name);
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().FACTORYERROR)) {
            this.logUtil.putF("StoreFront: " + storeHashMap.toString(), this, "getStore()");
        }
        return (cast new BasicStoreFront(storeHashMap) : BasicStoreFrontInterface);
    }

}

