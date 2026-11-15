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
//import javax.servlet.jsp.tagext.TagSupport;
import admin.taghelpers.OrderHelperFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.CustomTagSupport;

class OrderTag extends CustomTagSupport {
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
    private function process() : String {
        try {
            var anyType : Any = new OrderHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod(commonStrings.PROCESS, null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to Process Order: ";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function setPaymentGateway() : Null<Bool> {
        try {
            var anyType : Any = new OrderHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("setPaymentGateway", null);
            var result : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to setPaymentGateway for Order";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setPaymentGateway()", e);
            }
            return false;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.command != null) {
                this.propertiesHashMap = StdUtil.getInstance().createHashMap();
                this.propertiesHashMap.put(StoreFrontData.getInstance().NAME, this.storeName);
                if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESS) == 0) {
                    this.process();
                } else if (Reflect.compare(this.command, PaymentGatewayData.NAME.toString()) == 0) {
                    if (this.setPaymentGateway() == true) {
                        return TagSupport.EVAL_BODY_INCLUDE;
                    }
                }
            }
            return TagSupport.SKIP_BODY;
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

