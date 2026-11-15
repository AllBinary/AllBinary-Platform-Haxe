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
package org.allbinary.business.context.configuration;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.StdUtil;

class ContextConfigurationTableMapping implements TableMappingInterface {
    private var contextConfigurationInterface : ContextConfigurationInterface;
    public function new(contextConfigurationInterface : ContextConfigurationInterface) {
        this.contextConfigurationInterface = contextConfigurationInterface;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        return hashMap;
    }

    // throws Exception
    public function getKey() : Any {
        return ContextConfigurationData.getInstance().NAME;
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        return vector;
    }

}

