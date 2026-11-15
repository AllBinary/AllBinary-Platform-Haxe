/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.logic.system;

//import java.io.InputStream;
import org.allbinary.data.resource.ResourceUtil;

class PlatformAssetManager {
    private static final instance : PlatformAssetManager = new PlatformAssetManager();
    public static function getInstance() : PlatformAssetManager {
        return PlatformAssetManager.instance;
    }

    // throws Exception
    public function getResourceAsStream(resource : String) : InputStream {
        final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
        final inputStream : InputStream = resourceUtil.getResourceAsStream(resource);
        return inputStream;
    }

    public function new() {
    }
}

