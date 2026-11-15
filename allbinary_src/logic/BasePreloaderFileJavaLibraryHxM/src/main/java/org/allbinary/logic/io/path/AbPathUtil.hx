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
package org.allbinary.logic.io.path;


class AbPathUtil {
    private static final instance : AbPathUtil = new AbPathUtil();
    public static function getInstance() : AbPathUtil {
        return AbPathUtil.instance;
    }

    public final NO_ABPATH : AbPath = AbPath.createAbPath();
    public function new() {
    }
}

