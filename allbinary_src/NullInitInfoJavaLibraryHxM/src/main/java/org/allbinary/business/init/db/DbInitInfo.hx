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
package org.allbinary.business.init.db;

import org.allbinary.logic.communication.log.PreLogUtil;

//import org.allbinary.logic.communication.log.config.type.LogConfigTypes;
class DbInitInfo extends DbConnectionInfo {
    public function new(initFileName : String, read : Bool) {
        super();
    }

    public override function getUrl() : String {
        var url : String = super.getUrl();
        PreLogUtil.put("Url: " + url, this, "getUrl");
        return url;
    }

    // throws Exception
    // synchronized
    public function write() : Void {
    }

    // throws Exception
    // synchronized
    private function load() : Void {
    }

    // synchronized
    public function setHasRead(value : Bool) : Void {
    }

}

