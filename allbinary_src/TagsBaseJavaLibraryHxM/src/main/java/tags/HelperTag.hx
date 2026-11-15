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

import admin.taghelpers.TagHelperFactoryInterface;
import org.allbinary.logic.communication.log.LogUtil;

class HelperTag extends PropertiesTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tagHelperFactoryInterface : TagHelperFactoryInterface;
    private var anyType : Any = null;
    public function new(tagHelperFactoryInterface : TagHelperFactoryInterface) {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        }
        this.tagHelperFactoryInterface = tagHelperFactoryInterface;
    }

    // throws Exception
    public function setHelper() : Void {
        if (this.anyType == null) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                this.logUtil.putF("Creating TagHelper with: \n" + this.getPropertiesHashMap().toString(), this, "doStartTag");
            }
            this.anyType = this.tagHelperFactoryInterface.getInstance(this.getPropertiesHashMap(), this.pageContext);
        }
    }

    public function getHelper() : Any {
        return this.anyType;
    }

    public function doEndTag() : Int {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF("Tag Ended", this, "doEndTag");
        }
        this.anyType = null;
        return super.doEndTag();
    }

}

