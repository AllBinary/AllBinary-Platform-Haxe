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
import admin.taghelpers.PaymentHelperFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.user.commerce.money.payment.PaymentData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class PaymentTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var storeName : String = null;
    private var propertiesHashMap : HashMap = null;
    public function new() {
        super();
        this.setTagHelperFactory(new PaymentHelperFactory());
        this.setTagRequestHelperFactory(new PaymentHelperFactory());
    }

    public function setStoreName(value : String) : Void {
        this.storeName = value;
    }

    // throws LicensingException
    private function select() : String {
        try {
            var anyType : Any = new PaymentHelperFactory().getInstance(this.getPropertiesHashMap(), pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("select", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to select Payment";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "selectPayment()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                this.propertiesHashMap = StdUtil.getInstance().createHashMap();
                this.propertiesHashMap.put(StoreFrontData.getInstance().NAME, this.storeName);
                if (this.getCommand() != null) {
                    if (this.getCommand().compareTo(PaymentData.SELECT) == 0) {
                        var output : String = this.select();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output + "<br />");
                        }
                        return this.EVAL_BODY_INCLUDE;
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

