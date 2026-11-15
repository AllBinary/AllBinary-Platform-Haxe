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
package tags;

//import java.lang.reflect.Method;
//import javax.servlet.jsp.JspTagException;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class XmlValidationTransformTag extends TransformTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
    }

    // throws Exception
    private function isValid() : Bool {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.getHelper());
            var method : Method = helperClass.getMethod(commonStrings.IS_VALID, null);
            var result : Null<Bool> = (cast method.invoke(this.getHelper(), null) : Null<Bool>);
            return result;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.IS_VALID, e);
            }
            throw e;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            this.setHelper();
            if (this.isValid()) {
                super.doStartTag();
                return this.EVAL_BODY_INCLUDE;
            } else {
                super.doStartTag();
                return this.SKIP_BODY;
            }
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

