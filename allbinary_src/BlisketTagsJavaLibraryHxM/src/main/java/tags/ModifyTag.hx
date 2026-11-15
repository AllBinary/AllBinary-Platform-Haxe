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
import admin.taghelpers.TagHelperFactoryInterface;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.string.CommonStrings;

class ModifyTag extends HelperTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(tagHelperFactoryInterface : TagHelperFactoryInterface) {
        super(tagHelperFactoryInterface);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // throws LicensingException
    public function insert() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.getHelper());
            var method : Method = helperClass.getMethod("insert", null);
            var result : String = (cast method.invoke(this.getHelper(), null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to insert";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "insert()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function delete() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.getHelper());
            var method : Method = helperClass.getMethod(commonStrings.delete, null);
            var result : String = (cast method.invoke(this.getHelper(), null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to delete";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "delete()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function update() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.getHelper());
            var method : Method = helperClass.getMethod("update", null);
            var result : String = (cast method.invoke(this.getHelper(), null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to update";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                var request : HttpServletRequest = (cast this.pageContext.getRequest() : HttpServletRequest);
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Command: ");
                stringBuffer.append(this.getCommand());
                stringBuffer.append(" Request URI: ");
                stringBuffer.append(request.getRequestURI());
                this.logUtil.putF(stringBuffer.toString(), this, tagStrings.DO_START_TAG);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            }
            if (this.getCommand() != null) {
                this.setHelper();
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                if (this.getCommand().compareTo(commonStrings.INSERT) == 0) {
                    var output : String = this.insert();
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                        this.pageContext.getOut().print(output + "<br />");
                    }
                } else if (this.getCommand().compareTo(commonStrings.DELETE) == 0) {
                    var output : String = this.delete();
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                        this.pageContext.getOut().print(output + "<br />");
                    }
                } else if (this.getCommand().compareTo(commonStrings.UPDATE) == 0) {
                    var output : String = this.update();
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                        this.pageContext.getOut().print(output + "<br />");
                    }
                }
            }
            return this.EVAL_BODY_INCLUDE;
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

