/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.platform;

import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class ThreedObjResources {
    private static final instance : ThreedObjResources = new ThreedObjResources();
    public static function getInstance() : ThreedObjResources {
        return ThreedObjResources.instance;
    }

    public final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
    public function get(resourceName : String) : String {
        final resourceName2 : String = (cast this.hashtable.get(resourceName) : String);
        if (resourceName2 != null) {
            return resourceName2;
        }
        return resourceName;
    }

    public function new() {
    }
}

