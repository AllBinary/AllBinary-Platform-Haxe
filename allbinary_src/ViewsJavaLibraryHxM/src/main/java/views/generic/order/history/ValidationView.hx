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
package views.generic.order.history;

import org.allbinary.globals.MESSAGES;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;

class ValidationView extends OrderHistoryView implements ValidationComponentInterface {
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        return true;
    }

    public function toValidationInfoDoc() : org.w3c.dom.Document {
        return null;
    }

    public function toValidationInfoNode(document : org.w3c.dom.Document) : org.w3c.dom.Node {
        return null;
    }

    public function validationInfo() : String {
        return MESSAGES.CONTACTADMIN;
    }

}

