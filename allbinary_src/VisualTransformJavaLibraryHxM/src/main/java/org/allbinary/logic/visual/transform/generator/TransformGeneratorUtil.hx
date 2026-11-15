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
package org.allbinary.logic.visual.transform.generator;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.InputOutputTypeData;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.TransformFactory;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoDomNode;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.generator.StoreFileGenerator;

class TransformGeneratorUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformGeneratorUtil = new TransformGeneratorUtil();
    public static function getInstance() : TransformGeneratorUtil {
        return TransformGeneratorUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function generate(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, ownerTransformInfoInterface : TransformInfoInterface) : Void {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Generating View: " + transformInfoInterface.getName(), this, "generate()");
            }
            var componentInterface : TransformInterface = TransformFactory.getInstance().getInstance(abeClientInformation, transformInfoInterface.getName(), ownerTransformInfoInterface);
            var result : String = componentInterface.view();
            var httpTransformInfoInterface : TransformInfoHttpInterface = (cast componentInterface.getTransformInfoInterface() : TransformInfoHttpInterface);
            var inputOutputTypeData : InputOutputTypeData = InputOutputTypeData.getInstance();
            if (result.indexOf("<HTML>") >= 0) {
                httpTransformInfoInterface.getPropertiesHashMap().put(inputOutputTypeData.NAME, inputOutputTypeData.DEFAULT);
            } else {
                httpTransformInfoInterface.getPropertiesHashMap().put(inputOutputTypeData.NAME, inputOutputTypeData.DEFAULT_FRAGMENT);
            }
            new StoreFileGenerator(componentInterface.getTransformInfoInterface()).process(result);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to generate a view", this, "generate()", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function generate(abeClientInformation : AbeClientInformationInterface, transformInfoDomNode : TransformInfoDomNode, ownerTransformInfoInterface : TransformInfoInterface) : Void {
        this.generate(abeClientInformation, transformInfoDomNode.getTransformInfoInterface(), ownerTransformInfoInterface);
    }

}

