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
package org.allbinary.logic.visual.transform.info.objectConfig.generator;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.InputOutputTypeData;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;

class TransformInfoObjectConfigGeneratorFactory implements TransformInfoObjectConfigGeneratorFactoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformInfoObjectConfigGeneratorFactory = new TransformInfoObjectConfigGeneratorFactory();
    public static function getInstance() : TransformInfoObjectConfigGeneratorFactory {
        return TransformInfoObjectConfigGeneratorFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getInstance(transformInfoInterface : TransformInfoInterface) : TransformInfoObjectConfigGenerator {
        var type : String = (cast transformInfoInterface.getObjectConfigInterface().getOutputTypeName() : String);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF("Generating Instance for type: " + type, this, commonStrings.GET_INSTANCE);
        }
        if (type == null || Reflect.compare(type, InputOutputTypeData.getInstance().RESPONSE) == 0 || transformInfoInterface.isChild()) {
            return new BasicGenerator();
        } else if (Reflect.compare(type, InputOutputTypeData.getInstance().FILE) == 0) {
            return new StoreFileGenerator(transformInfoInterface);
        } else {
            throw new haxe.Exception("No Such TransformInfoObjectConfigGenerator Type");
        }
    }

}

