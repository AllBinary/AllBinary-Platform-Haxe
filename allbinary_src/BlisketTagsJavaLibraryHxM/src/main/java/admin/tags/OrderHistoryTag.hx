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
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.JspTagException;
import admin.taghelpers.OrderHistoryHelperFactory;
import admin.taghelpers.OrderHistoryRequestHelperFactory;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class OrderHistoryTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var status : String = null;
    public function new() {
        super();
        this.setTagHelperFactory(new OrderHistoryHelperFactory());
        this.setTagRequestHelperFactory(new OrderHistoryRequestHelperFactory());
    }

    public function setStatus(value : String) : Void {
        this.status = value;
    }

    // throws LicensingException
    private function setOrderStatus() : String {
        try {
            var request : HttpServletRequest = (cast this.pageContext.getRequest() : HttpServletRequest);
            var anyType : Any = new OrderHistoryRequestHelperFactory().getInstance(this.getPropertiesHashMap(), pageContext);
            if (this.status == null) {
                var helperClass : Class<Dynamic> = Type.getClass(anyType);
                var method : Method = helperClass.getMethod("setOrderStatus", null);
                var result : String = (cast method.invoke(anyType, null) : String);
                return result;
            } else {
                var helperClass : Class<Dynamic> = Type.getClass(anyType);
                var methodParams : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([Type.getClass(this.status)]);
                var method : Method = helperClass.getMethod("setOrderStatus", methodParams);
                var methodArgs : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([this.status]);
                var result : String = (cast method.invoke(anyType, methodArgs) : String);
                return result;
            }
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set Order Status";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setOrderStatus()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                if (this.getCommand() != null) {
                    this.getPropertiesHashMap().put(OrderHistoryData.STATUS, this.status);
                    if (this.getCommand().compareTo(OrderHistoryData.SETSTATUS) == 0) {
                        this.setOrderStatus();
                    } else {
                        return super.doStartTag();
                    }
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

