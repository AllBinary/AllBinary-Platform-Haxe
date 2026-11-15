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
import admin.taghelpers.PaymentGatewayHelperFactory;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class PaymentGatewayTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
        this.setTagHelperFactory(new PaymentGatewayHelperFactory());
        this.setTagRequestHelperFactory(new PaymentGatewayHelperFactory());
    }

    // throws LicensingException, Exception
    public function process() : String {
        try {
            var anyType : Any = new PaymentGatewayHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod(commonStrings.PROCESS, null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            this.logUtil.put("LicensingException", this, this.commonStrings.PROCESS, e);
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
            }
            throw e;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDEREVALBODYONERROR) == 0 || this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDERANDEVALBODY) == 0 || this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEFORMEVALBODYONERROR) == 0) {
                    var output : String = this.process();
                    {
                        this.pageContext.getOut().print(output + "<br />");
                    }
                    if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.AUTHORIZEORDEREVALBODYONERROR) == 0) {
                        return this.SKIP_BODY;
                    } else {
                        return this.EVAL_BODY_INCLUDE;
                    }
                } else {
                    return super.doStartTag();
                }
            }
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

