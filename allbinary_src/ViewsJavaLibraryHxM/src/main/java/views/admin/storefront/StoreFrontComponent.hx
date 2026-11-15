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
package views.admin.storefront;

//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.context.modules.storefront.StoreFront;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import views.business.context.modules.storefront.HttpStoreComponentView;

class StoreFrontComponent extends HttpStoreComponentView {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var newStoreFrontInterface : StoreFrontInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.newStoreFrontInterface = (cast new StoreFront((cast this.getPageContext().getRequest() : HttpServletRequest)) : StoreFrontInterface);
        if (this.newStoreFrontInterface.getName() == null) {
            this.newStoreFrontInterface.setName(this.getWeblisketSession().getStoreName());
        }
    }

    // throws Exception
    public function view() : String {
        try {
            return super.view();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view", e);
            }
            throw e;
        }
    }

}

