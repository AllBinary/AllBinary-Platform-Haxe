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
package views.generic.address.shipping;

import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class NewValidationView extends ShippingAddressView implements ValidationComponentInterface {
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        this.streetAddress = new StreetAddress();
        return true;
    }

    public function validationInfo() : String {
        return "Please contact the administrator.";
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

