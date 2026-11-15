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
package org.allbinary.logic.communication.log.config;


class LogConfigData {
    private static final instance : LogConfigData = new LogConfigData();
    public static function getInstance() : LogConfigData {
        return LogConfigData.instance;
    }

    public function new() {
    }

    public final NAME : String = "LOG_CONFIG_NAME";
    public final DESCRIPTION : String = "LOG_CONFIG_DESCRIPTION";
    public final FILE : String = "LOG_CONFIG_FILE";
}

