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

class FREEBLISKET_PATH_GLOBALS {
    private static final instance : FREEBLISKET_PATH_GLOBALS = new FREEBLISKET_PATH_GLOBALS();
    public static function getInstance() : FREEBLISKET_PATH_GLOBALS {
        return FREEBLISKET_PATH_GLOBALS.instance;
    }

    public final INSTALLPATH : String;
    public final XSLPATH : String;
    public final TEMPLATEPATH : String = "template" + AbPathData.getInstance().SEPARATOR;
    public final STYLEPATH : String;
    public final THEMEPATH : String;
    public final DBINITPATH : String = PATH_GLOBALS.getInstanceFor().INIT_PATH + "db" + AbPathData.getInstance().SEPARATOR;
    public final LINEDATAPATH : String = PATH_GLOBALS.getInstanceFor().INIT_PATH + "lineData" + AbPathData.getInstance().SEPARATOR;
    public final CONFIGURATIONPATH : String;
    public final USERCONFIGURATIONPATH : String;
    public final CONTEXTCONFIGURATIONPATH : String;
    public final LICENSEERRORPAGE : String = "LicensingError.jsp";
    public final ERRORPAGE : String = "Error.jsp";
    public function new() {
        this.STYLEPATH = this.TEMPLATEPATH + "style" + AbPathData.getInstance().SEPARATOR;
        this.THEMEPATH = this.STYLEPATH + "theme" + AbPathData.getInstance().SEPARATOR;
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("install");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        this.INSTALLPATH = Std.string(stringBuffer);
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(PATH_GLOBALS.getInstanceFor().INIT_PATH);
        stringBuffer.append("views");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        this.XSLPATH = Std.string(stringBuffer);
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(this.XSLPATH);
        stringBuffer.append("configuration");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        this.CONFIGURATIONPATH = Std.string(stringBuffer);
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(this.CONFIGURATIONPATH);
        stringBuffer.append("user");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        this.USERCONFIGURATIONPATH = Std.string(stringBuffer);
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(this.CONFIGURATIONPATH);
        stringBuffer.append("context");
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        this.CONTEXTCONFIGURATIONPATH = Std.string(stringBuffer);
        stringBuffer.delete(0, stringBuffer.length());
    }

}

