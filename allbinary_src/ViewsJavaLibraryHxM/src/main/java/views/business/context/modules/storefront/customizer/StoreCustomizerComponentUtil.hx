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
package views.business.context.modules.storefront.customizer;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.generator.TransformGeneratorUtil;
import org.allbinary.logic.visual.transform.info.TransformInfo;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;

class StoreCustomizerComponentUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : StoreCustomizerComponentUtil = new StoreCustomizerComponentUtil();
    public static function getInstance() : StoreCustomizerComponentUtil {
        return StoreCustomizerComponentUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function generate(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface) : String {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Generating Modified Views For: " + transformInfoInterface.getName(), this, "generateModifiedViews()");
        }
        final customizerUtil : CustomizerUtil = CustomizerUtil.getInstance();
        var allCustomizedViews : BasicArrayList = customizerUtil.getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface);
        final size : Int = allCustomizedViews.size();
        for (index in 0...size) {
            var nextTransformInfoInterface : TransformInfo = (cast allCustomizedViews.get(index) : TransformInfo);
            var allViewsToBeModified : BasicArrayList = customizerUtil.getTransformInfoObjectConfigComponentNodesToCustomize(transformInfoInterface, nextTransformInfoInterface);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("View or component that was modified by a Customizer: " + nextTransformInfoInterface.getName(), this, "generateModifiedViews()");
            }
            this.generate(abeClientInformation, transformInfoInterface, allViewsToBeModified);
        }
        return StringUtil.getInstance().EMPTY_STRING;
    }

    // throws Exception
    private function generate(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, allViewsToBeModifiedVector : BasicArrayList) : Void {
        final customizerUtil : CustomizerUtil = CustomizerUtil.getInstance();
        final size : Int = allViewsToBeModifiedVector.size();
        for (index in 0...size) {
            var nextTransformInfoInterface : TransformInfo = (cast allViewsToBeModifiedVector.get(index) : TransformInfo);
            var specifiedTransformInfoInterface : TransformInfoInterface = customizerUtil.getTransformInfoInterfaceToCustomize(transformInfoInterface, nextTransformInfoInterface);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Retrieved: " + specifiedTransformInfoInterface.getName(), this, "generateModifiedViews()");
            }
            TransformGeneratorUtil.getInstance().generate(abeClientInformation, nextTransformInfoInterface, specifiedTransformInfoInterface);
        }
    }

}

