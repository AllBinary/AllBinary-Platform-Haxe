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
package admin.tags;

//import java.lang.reflect.Method;
//import java.util.HashMap;
//import javax.servlet.jsp.JspTagException;
import admin.taghelpers.StoreFrontHelperFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.CustomTagSupport;

class StoreFrontTag extends CustomTagSupport {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var command : String = null;
    private var storeName : String = null;
    private var propertiesHashMap : HashMap = null;
    public function new() {
        super();
    }

    public function setCommand(command : String) : Void {
        this.command = command;
    }

    public function setStoreName(value : String) : Void {
        this.storeName = value;
    }

    // throws LicensingException
    private function getCurrentLocation() : String {
        try {
            var anyType : Any = new StoreFrontHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var method : Method = Type.getClass(anyType).getMethod("getCurrentLocation", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to retrieve current location";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getCurrentLocation()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function getCurrentHomeLocation() : String {
        try {
            var anyType : Any = new StoreFrontHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var method : Method = Type.getClass(anyType).getMethod("getCurrentHomeLocation", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to retrieve current home location";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getCurrentHomeLocation()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.command != null) {
                this.propertiesHashMap = StdUtil.getInstance().createHashMap();
                this.propertiesHashMap.put(StoreFrontData.getInstance().NAME, this.storeName);
                if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.GETCURRENTLOCATION) == 0) {
                    pageContext.getOut().print(this.getCurrentLocation());
                } else if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.GETCURRENTHOMELOCATION) == 0) {
                    pageContext.getOut().print(this.getCurrentHomeLocation());
                }
            }
            return SKIP_BODY;
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

