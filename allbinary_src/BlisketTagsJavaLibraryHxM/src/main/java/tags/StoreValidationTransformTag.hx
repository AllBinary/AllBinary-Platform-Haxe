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

//import javax.servlet.jsp.JspTagException;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;

class StoreValidationTransformTag extends ValidationTransformTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var storeName : String = null;
    public function new() {
        super();
    }

    public function setStoreName(value : String) : Void {
        this.storeName = value;
        this.getPropertiesHashMap().put(StoreFrontData.getInstance().NAME, this.storeName);
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                this.logUtil.putF("Tag Start", this, tagStrings.DO_START_TAG);
            }
            return super.doStartTag();
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

