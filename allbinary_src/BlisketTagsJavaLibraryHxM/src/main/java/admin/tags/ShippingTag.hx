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
import admin.taghelpers.ShippingHelperFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.CustomTagSupport;

class ShippingTag extends CustomTagSupport {
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
    private function setShippingType() : String {
        try {
            var anyType : Any = new ShippingHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("setShippingType", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view Shipping Type";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setShippingType()", e);
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
                if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.SETSHIPPINGTYPE) == 0) {
                    this.setShippingType();
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

