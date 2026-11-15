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
package org.allbinary.logic.visual.transform.info;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;

class TransformInfoHttpStore extends TransformInfoHttp implements TransformInfoHttpStoreInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super(propertiesHashMap, pageContext, true);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Properties HashMap: " + Std.string(propertiesHashMap), this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(databaseHashMap : HashMap, propertiesHashMap : HashMap, pageContext : PageContext) {
        super(databaseHashMap, propertiesHashMap, pageContext);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Database HashMap: ");
            stringBuffer.append(Std.string(databaseHashMap));
            stringBuffer.append("\nProperties HashMap: ");
            stringBuffer.append(Std.string(propertiesHashMap));
            this.logUtil.putF(Std.string(stringBuffer), this, "Constructor(HashMap, HashMap , PageContext)");
        }
        this.setStoreName((cast databaseHashMap.get(StoreFrontData.getInstance().NAME) : String));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(storeFrontInterface : StoreFrontInterface, propertiesHashMap : HashMap, pageContext : PageContext) {
        super(propertiesHashMap, pageContext);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Properties HashMap: " + Std.string(propertiesHashMap), this, this.commonStrings.CONSTRUCTOR);
        }
        this.setStoreName(storeFrontInterface.getName());
    }

    // throws Exception
    private function getPath() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getMainPath());
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
        stringBuffer.append(this.getStoreName());
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        return Std.string(stringBuffer);
    }

    // throws Exception
    public function getTemplateFilePath() : AbPath {
        return new AbPath(this.getPath(), this.getTemplateFile());
    }

    // throws Exception
    public function getObjectConfigFilePath() : AbPath {
        return new AbPath(this.getPath(), this.getObjectConfigFile());
    }

    // throws Exception
    public function getDataFilePath() : AbPath {
        return new AbPath(this.getPath(), this.getDataFile());
    }

    public override function setStoreName(value : String) : Void {
        super.setStoreName(value);
    }

    public override function getStoreName() : String {
        return super.getStoreName();
    }

}

