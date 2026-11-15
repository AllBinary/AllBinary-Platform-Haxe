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
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.AbContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlData;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig;

class TransformInfoHttp extends TransformInfo implements TransformInfoHttpInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abContext : AbContext;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext, crud : Bool) {
        super();
        this.abContext = new AbContext(propertiesHashMap, pageContext);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Properties HashMap: " + Std.string(propertiesHashMap), this, "Constructor(HashMap, PageContext, boolean)");
        }
        this.override_(propertiesHashMap);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(request : HttpServletRequest, propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        this.abContext = new AbContext(propertiesHashMap, pageContext);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Properties HashMap: " + Std.string(propertiesHashMap), this, "Constructor(HttpServletRequest, HashMap, PageContext)");
        }
        this.set(new RequestParams((cast request : HttpServletRequest)).toHashMap());
        this.override_(propertiesHashMap);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(databaseHashMap : HashMap, propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        this.abContext = new AbContext(propertiesHashMap, pageContext);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Properties HashMap: " + Std.string(propertiesHashMap), this, "Constructor(HashMap, HashMap, PageContext)");
        }
        this.set(databaseHashMap);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        this.abContext = new AbContext(propertiesHashMap, pageContext);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Properties HashMap: " + Std.string(propertiesHashMap), this, "Constructor(HashMap, PageContext)");
        }
        this.set(propertiesHashMap);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(parentViewOfThisTransformInfoInterface : TransformInfoHttp) {
        super();
        this.abContext = new AbContext(parentViewOfThisTransformInfoInterface.getPropertiesHashMap(), parentViewOfThisTransformInfoInterface.getPageContext());
    }

    // throws Exception
    private function set(hashMap : HashMap) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Properties HashMap: " + Std.string(hashMap), this, "set()");
        }
        var transformInfoData : TransformInfoData = TransformInfoData.getInstance();
        this.setName((cast hashMap.get(transformInfoData.NAME) : String));
        this.setStoreName((cast hashMap.get(StoreFrontData.getInstance().NAME) : String));
        this.setObjectFile((cast hashMap.get(transformInfoData.OBJECTFILENAME) : String));
        this.setObject((cast hashMap.get(transformInfoData.OBJECT) : String));
        var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        var objectConfigString : String = (cast hashMap.get(transformInfoData.OBJECTCONFIG) : String);
        if (stringValidationUtil.isValidRequired(objectConfigString, 10, AbSqlData.MAXBLOB)) {
            this.setObjectConfig(objectConfigString);
        } else {
            this.setObjectConfig(Std.string(new TransformInfoObjectConfig(this)));
        }
        if (!stringValidationUtil.isEmpty((cast hashMap.get(transformInfoData.OBJECTCONFIGFILENAME) : String))) {
            this.setObjectConfigFile((cast hashMap.get(transformInfoData.OBJECTCONFIGFILENAME) : String));
        }
        this.setTemplateFile((cast hashMap.get(transformInfoData.TEMPLATEFILENAME) : String));
        this.setTemplate((cast hashMap.get(transformInfoData.TEMPLATE) : String));
        this.setDataFile((cast hashMap.get(transformInfoData.DATAFILENAME) : String));
        this.setData((cast hashMap.get(transformInfoData.DATA) : String));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERFACTORY)) {
            this.logUtil.putF(this.log(), this, "set()");
        }
    }

    public function getWeblisketSession() : WeblisketSessionInterface {
        return this.abContext.getWeblisketSession();
    }

    public function getPageContext() : PageContext {
        return this.abContext.getPageContext();
    }

    public function getPropertiesHashMap() : HashMap {
        return this.abContext.getPropertiesHashMap();
    }

    // throws Exception
    public function getTemplateFilePath() : AbPath {
        return new AbPath(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH, this.getTemplateFile());
    }

    // throws Exception
    public function getObjectConfigFilePath() : AbPath {
        return new AbPath(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH, this.getObjectConfigFile());
    }

    // throws Exception
    public function getDataFilePath() : AbPath {
        return new AbPath(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH, this.getDataFile());
    }

}

