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
package tags.generic;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.InputOutputTypeData;
import tags.TransformTag;

class GenericViewTag extends TransformTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var output : String = null;
    private var file : String = null;
    public function new() {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    public function setOutput(value : String) : Void {
        this.output = value;
        this.getPropertiesHashMap().put(InputOutputTypeData.getInstance().NAME, this.output);
    }

    public function setFile(value : String) : Void {
        this.file = value;
        this.getPropertiesHashMap().put(InputOutputTypeData.getInstance().FILE, this.file);
    }

}

