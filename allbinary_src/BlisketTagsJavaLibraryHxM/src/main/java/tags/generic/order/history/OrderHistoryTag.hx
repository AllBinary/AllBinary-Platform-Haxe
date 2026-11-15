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
package tags.generic.order.history;

//import java.lang.reflect.Method;
//import javax.servlet.jsp.JspTagException;
import org.allbinary.business.user.commerce.inventory.order.OrderHistoryData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import taghelpers.OrderHistoryHelperFactory;
import tags.StoreValidationTransformTag;

class OrderHistoryTag extends StoreValidationTransformTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var status : String = null;
    public function new() {
        super();
    }

    public function setStatus(value : String) : Void {
        this.status = value;
    }

    // throws LicensingException
    private function setOrderStatus() : String {
        try {
            var anyType : Any = new OrderHistoryHelperFactory().getInstance(this.getPropertiesHashMap(), pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod("setOrderStatus", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view order table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setOrderStatus()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            this.setName("Basic Order History View");
            this.setObjectFile("views.generic.order.history.ValidationView");
            if (this.getCommand() != null) {
                if (this.getCommand().compareTo(OrderHistoryData.SETSTATUS) == 0) {
                    this.getPropertiesHashMap().put(OrderHistoryData.STATUS, this.status);
                    pageContext.getOut().print(this.setOrderStatus());
                } else if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.VIEW) == 0) {
                } else {
                    throw new haxe.Exception("No Such View Command: " + this.getCommand());
                }
                return super.doStartTag();
            }
            throw new haxe.Exception("Command Null");
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

