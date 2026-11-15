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
import admin.taghelpers.ShippingAddressHelperFactory;
import org.allbinary.business.user.address.ShippingAddressData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class ShippingAddressTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var value : String = null;
    public function new() {
        super();
        this.setTagHelperFactory(new ShippingAddressHelperFactory());
        this.setTagRequestHelperFactory(new ShippingAddressHelperFactory());
    }

    public function setValue(value : String) : Void {
        this.value = value;
    }

    // throws LicensingException
    private function set() : String {
        try {
            var anyType : Any = new ShippingAddressHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("set", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set Shipping Address";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "set()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function setToBillingAddress() : String {
        try {
            var anyType : Any = new ShippingAddressHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("setToBillingAddress", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed Setting Shipping address to Billing Address";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setShippingAddressToBillingAddress()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                if (this.getCommand() != null) {
                    if (this.getCommand().compareTo(ShippingAddressData.SELECT) == 0) {
                        this.set();
                        return this.EVAL_BODY_INCLUDE;
                    } else if (this.getCommand().compareTo(ShippingAddressData.SETTOBILLINGADDRESS) == 0) {
                        this.setToBillingAddress();
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

