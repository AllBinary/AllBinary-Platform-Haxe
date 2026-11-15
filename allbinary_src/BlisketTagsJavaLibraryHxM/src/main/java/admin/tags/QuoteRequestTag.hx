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
import admin.taghelpers.QuoteHelperFactory;
import admin.taghelpers.QuoteRequestHelperFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class QuoteRequestTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var storeName : String = null;
    public function new() {
        super();
        this.setTagHelperFactory(new QuoteHelperFactory());
        this.setTagRequestHelperFactory(new QuoteRequestHelperFactory());
    }

    public function setStoreName(storeName : String) : Void {
        this.storeName = storeName;
    }

    // throws LicensingException
    private function email() : String {
        try {
            var anyType : Any = new QuoteHelperFactory().getInstance(this.getPropertiesHashMap(), pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod("email", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to send QuoteRequest emails";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "sendEmail()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.getCommand() != null) {
                this.getPropertiesHashMap().put(StoreFrontData.getInstance().NAME, this.storeName);
                if (this.getCommand().compareTo("EMAIL") == 0) {
                    this.email();
                    return this.EVAL_BODY_INCLUDE;
                } else {
                    return super.doStartTag();
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

