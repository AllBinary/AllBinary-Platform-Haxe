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
package org.allbinary.logic.visual.dhtml.style.css.property.font;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationInterface;
import org.allbinary.logic.string.StringMaker;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class FontFamilyValidation extends FontFamilyView implements ValidationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(node : Node) {
        super(node);
    }

    // throws Exception
    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("FontFamilyValidation", this, this.commonStrings.IS_VALID);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("CssValidation: " + valid, this, this.commonStrings.IS_VALID);
            }
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate data", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    // throws Exception
    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Css Font Family Property Validation Error");
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

