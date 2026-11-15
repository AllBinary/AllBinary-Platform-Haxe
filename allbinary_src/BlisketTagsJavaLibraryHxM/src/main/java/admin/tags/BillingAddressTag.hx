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
//import javax.servlet.jsp.JspTagException;
import admin.taghelpers.BillingAddressHelperFactory;
import org.allbinary.business.user.address.BillingAddressData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class BillingAddressTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var value : String = null;
    public function new() {
        super();
        this.setTagHelperFactory(new BillingAddressHelperFactory());
        this.setTagRequestHelperFactory(new BillingAddressHelperFactory());
    }

    public function setValue(value : String) : Void {
        this.value = value;
    }

    // throws LicensingException
    private function set() : String {
        try {
            var anyType : Any = new BillingAddressHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("set", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set billing Address";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "set()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function setToShippingAddress() : String {
        try {
            var anyType : Any = new BillingAddressHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("setToShippingAddress", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to Set Billing address to Shipping Address";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setToShippingAddress()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                if (this.getCommand() != null) {
                    if (this.getCommand().compareTo(BillingAddressData.SELECT) == 0) {
                        this.set();
                        return this.EVAL_BODY_INCLUDE;
                    } else if (this.getCommand().compareTo(BillingAddressData.SETTOSHIPPINGADDRESS) == 0) {
                        this.setToShippingAddress();
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

