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
package admin.taghelpers;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.globals.AppUrlGlobals;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class CustomLoaderHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new(hashMap : HashMap, pageContext : PageContext) {
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
    }

    // throws Exception
    public function getWebappPath() : String {
        try {
            return org.allbinary.globals.URLGLOBALS.getWebappPath();
        } catch (e : haxe.Exception) {
            return null;
        }
    }

    // throws Exception
    public function setWebappPath(path : String) : Void {
        try {
            var urlGlobals : AppUrlGlobals = new AppUrlGlobals();
            urlGlobals.setWebappPath(path);
            URLGLOBALS.init(urlGlobals);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setWebappPath()", e);
            }
        }
    }

}

