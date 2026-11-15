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
package tags.admin;

//import javax.servlet.jsp.JspTagException;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import tags.StoreValidationTransformTag;

class DateRangeOrderHistoryTag extends StoreValidationTransformTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var status : String = null;
    public function new() {
        super();
    }

    public function setStatus(value : String) : Void {
        this.status = value;
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                this.logUtil.putF("Tag Start", this, tagStrings.DO_START_TAG);
            }
            this.setName("Range Order History View");
            this.setObjectFile("views.admin.orderhistory.DateRangeOrderHistoryView");
            if (this.getCommand() != null) {
                if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.VIEW) == 0) {
                } else {
                    throw new haxe.Exception("No Such View Command: " + this.getCommand());
                }
                return super.doStartTag();
            }
            throw new haxe.Exception("Command Null");
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

