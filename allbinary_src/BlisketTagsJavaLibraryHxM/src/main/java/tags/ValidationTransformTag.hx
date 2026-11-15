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
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.JspTagException;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.LicensingException;
import taghelpers.ValidatedViewHelperFactory;

class ValidationTransformTag extends TransformTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var xslFile : String = null;
    private var logic : Bool;
    public function new() {
        super(new ValidatedViewHelperFactory());
        this.logic = true;
    }

    public function setXsl(value : String) : Void {
        this.xslFile = value;
        this.setTemplateFile(this.xslFile);
    }

    public function setLogic(logic : Bool) : Void {
        this.logic = logic;
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

    // throws Exception
    private function validationInfo() : String {
        try {
            var addressHelperClass : Class<Dynamic> = Type.getClass(this.getHelper());
            var method : Method = addressHelperClass.getMethod("validationInfo", null);
            var result : String = (cast method.invoke(this.getHelper(), null) : String);
            return result;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "validationInfo()", e);
            }
            throw e;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                var stringBuffer : StringMaker = new StringMaker();
                var request : HttpServletRequest = (cast this.pageContext.getRequest() : HttpServletRequest);
                stringBuffer.append("ValidationViewTag Start For: ");
                stringBuffer.append(this.getName());
                stringBuffer.append("\nView FIle: ");
                stringBuffer.append(this.getObjectFile());
                stringBuffer.append("\nRequest URI: ");
                stringBuffer.append(request.getRequestURI());
                this.logUtil.putF(Std.string(stringBuffer), this, tagStrings.DO_START_TAG);
            }
            this.setHelper();
            if (this.isValid()) {
                super.doStartTag();
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("View File: ");
                    stringBuffer.append(this.getObjectFile());
                    stringBuffer.append("\nLogic includes body if true=");
                    stringBuffer.appendboolean(this.logic);
                    this.logUtil.putF(Std.string(stringBuffer), this, tagStrings.DO_START_TAG);
                }
                if (this.logic) {
                    return EVAL_BODY_INCLUDE;
                } else {
                    return SKIP_BODY;
                }
            } else {
                pageContext.getOut().print(this.validationInfo());
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("View File: ");
                    stringBuffer.append(this.getObjectFile());
                    stringBuffer.append("\nisValid()=false");
                    stringBuffer.append("\nLogic skips body if true=");
                    stringBuffer.appendboolean(this.logic);
                    this.logUtil.putF(Std.string(stringBuffer), this, tagStrings.DO_START_TAG);
                }
                if (this.logic) {
                    return SKIP_BODY;
                } else {
                    return EVAL_BODY_INCLUDE;
                }
            }
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

    public function doEndTag() : Int {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF("Tag Ended", this, "doEndTag");
        }
        this.logic = true;
        return super.doEndTag();
    }

}

