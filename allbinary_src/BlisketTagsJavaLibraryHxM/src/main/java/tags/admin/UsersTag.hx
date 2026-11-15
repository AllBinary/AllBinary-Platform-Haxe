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
import org.allbinary.business.user.role.UserRoleData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import tags.StoreValidationTransformTag;

class UsersTag extends StoreValidationTransformTag {
    private var role : String = null;
    public function new() {
        super();
    }

    public function setRole(value : String) : Void {
        this.role = value;
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            this.setName("Admin Users View");
            this.setObjectFile("views.admin.user.UsersValidationView");
            if (this.getCommand() != null) {
                this.getPropertiesHashMap().put(UserRoleData.NAME, this.role);
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

