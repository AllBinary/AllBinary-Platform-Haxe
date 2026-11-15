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

//import java.util.HashMap;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;

class PropertiesTag extends CommandTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var propertiesHashMap : HashMap;
    public function new() {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        }
        this.propertiesHashMap = StdUtil.getInstance().createHashMap();
    }

    public function getPropertiesHashMap() : HashMap {
        return this.propertiesHashMap;
    }

    public function doEndTag() : Int {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF("Tag Ended", this, "doEndTag");
        }
        this.propertiesHashMap = StdUtil.getInstance().createHashMap();
        return EVAL_PAGE;
    }

}

