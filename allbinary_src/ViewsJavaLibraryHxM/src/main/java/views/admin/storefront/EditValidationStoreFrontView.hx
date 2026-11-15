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
package views.admin.storefront;

import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class EditValidationStoreFrontView extends StoreFrontComponent implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            if (this.newStoreFrontInterface.isNameValid() == false) {
                valid = false;
            }
            if (StoreFrontFactory.getInstance(this.newStoreFrontInterface.getName()) == null) {
                valid = false;
            }
            this.newStoreFrontInterface = StoreFrontFactory.getInstance(this.newStoreFrontInterface.getName());
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate form", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (this.newStoreFrontInterface.isNameValid() == false) {
                stringBuffer.append(this.newStoreFrontInterface.nameValidationInfo());
            }
            if (StoreFrontFactory.getInstance(this.newStoreFrontInterface.getName()) == null) {
                stringBuffer.append(this.newStoreFrontInterface + " does not exist.<br>");
            }
            return "Unkown Error";
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

}

