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
import admin.taghelpers.BasicTextEmailHelperFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import tags.CustomTagSupport;

class BasicTextEmailTag extends CustomTagSupport {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var subject : String = null;
    private var body : String = null;
    public function new() {
        super();
    }

    public function setSubject(value : String) : Void {
        this.subject = value;
    }

    public function setBody(value : String) : Void {
        this.body = value;
    }

    public function send() : String {
        try {
            var propertiesHashMap : HashMap = StdUtil.getInstance().createHashMap();
            propertiesHashMap.put("Subject", this.subject);
            propertiesHashMap.put("Body", this.body);
            var anyType : Any = new BasicTextEmailHelperFactory().getInstance(propertiesHashMap, this.pageContext);
            var method : Method = Type.getClass(anyType).getMethod("send", null);
            method.invoke(anyType, null);
            return "Email Sent";
        } catch (e : haxe.Exception) {
            var error : String = "Failed to Send Email.";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "send()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            this.pageContext.getOut().print(this.send());
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

