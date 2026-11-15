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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoDomNode;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface;

class TransformsGeneratorUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformsGeneratorUtil = new TransformsGeneratorUtil();
    public static function getInstance() : TransformsGeneratorUtil {
        return TransformsGeneratorUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function generateComponentsFromObjectConfig(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, group : String) : String {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Started Group: " + group, this, "generateComponentsFromObjectConfig(2)");
        }
        var transformInfoObjectConfigInterface : TransformInfoObjectConfigInterface = transformInfoInterface.getObjectConfigInterface();
        var result : String = this.generateComponentsFromObjectConfig(abeClientInformation, transformInfoObjectConfigInterface, transformInfoInterface, group);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("End Group: " + group, this, "generateComponentsFromObjectConfig(2)");
        }
        return result;
    }

    // throws Exception
    public function generateComponentsFromObjectConfig(abeClientInformation : AbeClientInformationInterface, transformInfoObjectConfigInterface : TransformInfoObjectConfigInterface, transformInfoInterface : TransformInfoInterface, group : String) : String {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Started Group: " + group, this, "generateComponentsFromObjectConfig()");
        }
        var transformInfoObjectConfigComponentVector : BasicArrayList = transformInfoObjectConfigInterface.getTransformsGroup(group);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Processing ");
            stringBuffer.appendint(transformInfoObjectConfigComponentVector.size());
            stringBuffer.append(" Components Group: ");
            stringBuffer.append(group);
            this.logUtil.putF(stringBuffer.toString(), this, "generateComponentsFromObjectConfig()");
        }
        if (transformInfoObjectConfigComponentVector.size() < 1) {
            throw new haxe.Exception("No Pages Generated For Template.");
        }
        final size : Int = transformInfoObjectConfigComponentVector.size();
        for (index in 0...size) {
            var transformInfoObjectConfigComponent : TransformInfoDomNode = (cast transformInfoObjectConfigComponentVector.get(index) : TransformInfoDomNode);
            TransformGeneratorUtil.getInstance().generate(abeClientInformation, transformInfoObjectConfigComponent, transformInfoInterface);
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Done Group: " + group, this, "generateComponentsFromObjectConfig()");
        }
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("<!-- Generated all template views successfully for View: ");
        stringBuffer.append(transformInfoInterface.getName());
        stringBuffer.append("-->");
        return stringBuffer.toString();
    }

}

