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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.system.loader.WebappClassLoaderInfo;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class Globals {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : Globals = new Globals();
    public static function getInstance() : Globals {
        return Globals.instance;
    }

    public function new() {
    }

    public function init(classLoader : ClassLoader, pathString : String) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final appUrlGlobals : AppUrlGlobals = new AppUrlGlobals();
        appUrlGlobals.setWebappPath(pathString);
        URLGLOBALS.init(appUrlGlobals);
        WebappClassLoaderInfo.setLoader(classLoader);
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Setting Up AllBinary System Configuration Args: ");
        stringBuffer.append(pathString);
        stringBuffer.append(" ClassLoader: ");
        stringBuffer.append(Type.getClassName(Type.getClass(classLoader)));
        this.logUtil.putF(Std.string(stringBuffer), this, commonStrings.INIT);
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (stringValidationUtil.isEmpty(pathString)) {
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append("No Path Provided. Using Process Path: ");
            stringBuffer.append(pathString);
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.append(CommonSeps.getInstance().EQUALS);
            stringBuffer.append(CommonSeps.getInstance().SPACE);
            stringBuffer.append(URLGLOBALS.getWebappPath());
            this.logUtil.putF(Std.string(stringBuffer), this, commonStrings.INIT);
        }
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append("Webapp Path Set To: ");
        stringBuffer.append(URLGLOBALS.getWebappPath());
        this.logUtil.putF(Std.string(stringBuffer), this, commonStrings.INIT);
    }

}

