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
package org.allbinary.logic.communication.ftp.configuration;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.StdUtil;

class FtpConfigurationMapping implements TableMappingInterface {
    private var ftpConfigurationInterface : FtpConfigurationInterface;
    public function new(ftpConfigurationInterface : FtpConfigurationInterface) {
        this.ftpConfigurationInterface = ftpConfigurationInterface;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(FtpConfigurationData.SERVER, this.ftpConfigurationInterface.getServer());
        hashMap.put(FtpConfigurationData.USERNAME, this.ftpConfigurationInterface.getUserName());
        hashMap.put(FtpConfigurationData.PASSWORD, this.ftpConfigurationInterface.getPassword());
        hashMap.put(FtpConfigurationData.PATH, this.ftpConfigurationInterface.getPath());
        return hashMap;
    }

    // throws Exception
    public function getKey() : Any {
        return FtpConfigurationData.NAME;
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        var vector : BasicArrayList = new BasicArrayListD();
        vector.add(this.ftpConfigurationInterface.getServer());
        vector.add(this.ftpConfigurationInterface.getUserName());
        vector.add(this.ftpConfigurationInterface.getPassword());
        vector.add(this.ftpConfigurationInterface.getPath());
        return vector;
    }

}

