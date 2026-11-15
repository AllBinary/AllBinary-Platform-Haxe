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
package org.allbinary.business.category.properties;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.allbinary.logic.string.StringMaker;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class CategoryPropertiesValidationView extends CategoryPropertiesView implements ValidationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(categoryPropertiesInterface : CategoryPropertiesInterface) {
        super(categoryPropertiesInterface);
    }

    // throws Exception
    public function isValid() : Null<Bool> {
        return this.categoryPropertiesInterface.isValid();
    }

    // throws Exception
    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.categoryPropertiesInterface.validationInfo());
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation info error", this, "validationInfo()", e);
            }
            return "Error Validating Data";
        }
    }

    // throws Exception
    public function toValidationInfoDoc() : Document {
        return null;
    }

    // throws Exception
    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

}

