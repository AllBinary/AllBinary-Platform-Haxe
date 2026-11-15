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
import admin.taghelpers.UserHelperFactory;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.role.UserRoleData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;

class UserTag extends TableTag {
    private var role : String = null;
    private var enable : String = null;
    public function new() {
        super();
        this.setTagHelperFactory(new UserHelperFactory());
        this.setTagRequestHelperFactory(new UserHelperFactory());
    }

    public function setRole(value : String) : Void {
        this.role = value;
        this.getPropertiesHashMap().put(UserRoleData.NAME, this.role);
    }

    public function setEnable(value : String) : Void {
        this.enable = value;
        this.getPropertiesHashMap().put(EntryData.getInstance().ENABLE, this.enable);
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                return super.doStartTag();
            }
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

