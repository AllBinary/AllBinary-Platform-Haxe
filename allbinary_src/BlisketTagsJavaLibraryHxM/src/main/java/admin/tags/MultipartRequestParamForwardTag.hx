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

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.jsp.JspTagException;
//import javax.servlet.jsp.tagext.Tag;
import admin.taghelpers.MultipartRequestParamForwardHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.CustomTagSupport;
import tags.HelperTag;

class MultipartRequestParamForwardTag extends CustomTagSupport {
    private var page : String = null;
    private var command : String = null;
    private var paramVector : BasicArrayList = null;
    public function setPage(page : String) : Void {
        this.page = page;
    }

    public function setCommand(command : String) : Void {
        this.command = command;
    }

    public function setParamVector(paramVector : BasicArrayList) : Void {
        this.paramVector = paramVector;
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            var parentTag : HelperTag = (cast this.getParent() : HelperTag);
            ParentInventoryTagHelper.getInstance().isValid(this, parentTag);
            var hashMap : HashMap = StdUtil.getInstance().createHashMap();
            hashMap.put(AbTagData.PARENT, parentTag);
            var multipartRequestParamForwardHelper : MultipartRequestParamForwardHelper = new MultipartRequestParamForwardHelper(parentTag, this.page, this.command, this.paramVector, this.pageContext);
            multipartRequestParamForwardHelper.forward();
            return Tag.SKIP_BODY;
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return Tag.SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return Tag.SKIP_BODY;
        }
    }

    public function new() {
        super();
    }
}

