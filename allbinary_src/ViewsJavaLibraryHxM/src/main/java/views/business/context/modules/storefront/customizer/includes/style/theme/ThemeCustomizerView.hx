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
package views.business.context.modules.storefront.customizer.includes.style.theme;

import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import views.business.context.modules.storefront.HttpStoreComponentView;

class ThemeCustomizerView extends HttpStoreComponentView {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var validationInterface : ValidationInterface = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // throws Exception
    public function addDomNodeInterfaces() : Void {
        this.addDomNodeInterface((cast this.validationInterface : DomNodeInterface));
    }

    // throws Exception
    public function view() : String {
        try {
            this.addDomNodeInterfaces();
            return super.view();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

}

