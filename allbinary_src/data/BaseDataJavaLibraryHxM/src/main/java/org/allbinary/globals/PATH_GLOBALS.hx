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
package org.allbinary.globals;

import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class PATH_GLOBALS {
    private static final instance : PATH_GLOBALS = new PATH_GLOBALS();
    public static function getInstance() : PATH_GLOBALS {
        return PATH_GLOBALS.instance;
    }

    public function new() {
        final stringBuffer : StringMaker = new StringMaker();
        final abPathData : AbPathData = AbPathData.getInstance();
        stringBuffer.append("data");
        stringBuffer.append(abPathData.SEPARATOR);
        this.DATA_PATH = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(this.DATA_PATH);
        stringBuffer.append(CommonStrings.getInstance().INIT);
        stringBuffer.append(abPathData.SEPARATOR);
        this.INIT_PATH = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(this.DATA_PATH);
        stringBuffer.append("log");
        stringBuffer.append(abPathData.SEPARATOR);
        this.LOG_PATH = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(this.DATA_PATH);
        stringBuffer.append("backup");
        stringBuffer.append(abPathData.SEPARATOR);
        this.BACKUP_PATH = stringBuffer.toString();
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(this.INIT_PATH);
        stringBuffer.append("views");
        stringBuffer.append(abPathData.SEPARATOR);
        this.VIEWS_PATH = stringBuffer.toString();
    }

    public final DATA_PATH : String;
    public final INIT_PATH : String;
    public final VIEWS_PATH : String;
    public final LOG_PATH : String;
    public final BACKUP_PATH : String;
}

