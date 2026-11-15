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
package org.allbinary.logic.communication.log.config.type;


class LogConfigTypeFactory {
    private static final instance : LogConfigTypeFactory = new LogConfigTypeFactory();
    public static function getInstance() : LogConfigTypeFactory {
        return LogConfigTypeFactory.instance;
    }

    private final NO_DESCRIPTION : String = "No Description";
    public final OS : LogConfigType = new LogConfigType("Operating System", this.NO_DESCRIPTION);
    public final FACTORYERROR : LogConfigType = new LogConfigType("Factory Error", this.NO_DESCRIPTION);
    public final FILE : LogConfigType = new LogConfigType("File", this.NO_DESCRIPTION);
    public final FILEERROR : LogConfigType = new LogConfigType("File Error", this.NO_DESCRIPTION);
    public final IDLOGGING : LogConfigType = new LogConfigType("ID Logging", this.NO_DESCRIPTION);
    public final REPLACE : LogConfigType = new LogConfigType("Replace", this.NO_DESCRIPTION);
    public final REPLACE_INFO : LogConfigType = new LogConfigType("Replace Info", this.NO_DESCRIPTION);
    public final REPLACEERROR : LogConfigType = new LogConfigType("Replace Error", this.NO_DESCRIPTION);
    public function new() {
        LogConfigTypes.LOGGING.add(OS);
        LogConfigTypes.LOGGING.add(this.FACTORYERROR);
    }

}

