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
package org.allbinary.logic.communication.smtp.configuration.user;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.StdUtil;

class UserEmailConfigurationMapping implements TableMappingInterface {
    private var userEmailConfigurationInterface : UserEmailConfigurationInterface;
    public function new(userEmailConfigurationInterface : UserEmailConfigurationInterface) {
        this.userEmailConfigurationInterface = userEmailConfigurationInterface;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        return hashMap;
    }

    // throws Exception
    public function getKey() : Any {
        return UserEmailConfigurationData.NAME;
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        return vector;
    }

}

