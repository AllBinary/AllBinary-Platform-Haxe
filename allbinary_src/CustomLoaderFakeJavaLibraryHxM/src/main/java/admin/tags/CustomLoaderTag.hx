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

//import javax.servlet.jsp.JspTagException;
import org.allbinary.globals.AppUrlGlobals;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.CustomTagSupport;

class CustomLoaderTag extends CustomTagSupport {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var command : String = null;
    private var webappPath : String = null;
    public function new() {
        super();
    }

    public function setCommand(command : String) : Void {
        this.command = command;
    }

    public function setWebappPath(value : String) : Void {
        this.webappPath = value;
    }

    // throws LicensingException
    private function setCustomLoaderWebappPath() : Void {
        try {
            var urlGlobals : AppUrlGlobals = new AppUrlGlobals();
            urlGlobals.setWebappPath(this.webappPath);
            URLGLOBALS.init(urlGlobals);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setCustomLoaderWebappPath()", e);
            }
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                this.logUtil.putF(this.commonStrings.START, this, tagStrings.DO_START_TAG);
            }
            if (this.command != null) {
                if (Reflect.compare(this.command, GLOBALS2.SET) == 0) {
                    this.setCustomLoaderWebappPath();
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

