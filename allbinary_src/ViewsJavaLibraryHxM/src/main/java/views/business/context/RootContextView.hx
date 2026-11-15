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
package views.business.context;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.TransformFactory;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.info.TransformInfo;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.template.TransformTemplateInterface;
import views.business.context.modules.storefront.HttpStoreComponentView;
import views.business.context.modules.storefront.customizer.template.objectConfig.NoTemplateTransformInfoObjectConfig;

class RootContextView extends HttpStoreComponentView implements TransformTemplateInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, "RootContextView()");
        }
    }

    // throws Exception
    public function view() : String {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("View Name: " + this.getTransformInfoInterface().getName(), this, "view()");
            }
            var viewName : String = this.getName();
            var componentInterface : TransformInterface = TransformFactory.getInstance().getInstance(this.abeClientInformation, viewName, this.getTransformInfoInterface());
            return componentInterface.view();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function getName() : String {
        try {
            var objectConfig : NoTemplateTransformInfoObjectConfig = new NoTemplateTransformInfoObjectConfig(this.getTransformInfoInterface(), this.getTransformInfoInterface().getObjectConfigInterface().toXmlDoc());
            var componentsVector : BasicArrayList = objectConfig.getTransforms();
            if (componentsVector.size() == 0) {
                throw new haxe.Exception("Template View Not Set - No Components");
            }
            if (componentsVector.size() > 1) {
                throw new haxe.Exception("To Many Root Template Views: " + componentsVector.size());
            }
            var transformInfoInterface : TransformInfo = (cast componentsVector.get(0) : TransformInfo);
            var viewName : String = transformInfoInterface.getName();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Root Template With View Name: " + viewName, this, "getName()");
            }
            if (StringValidationUtil.getInstance().isEmpty(viewName)) {
                throw new haxe.Exception("Template View Not Set - No View Name");
            }
            return viewName;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getName()", e);
            }
            throw e;
        }
    }

}

