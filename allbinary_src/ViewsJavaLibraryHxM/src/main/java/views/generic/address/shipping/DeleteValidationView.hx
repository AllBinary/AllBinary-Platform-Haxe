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

import org.allbinary.business.user.address.StreetAddressData;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class DeleteValidationView extends ShippingAddressView implements ValidationComponentInterface {
    private var value : String;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        var httpTransformInfoInterface : TransformInfoHttpInterface = (cast this.getTransformInfoInterface() : TransformInfoHttpInterface);
        this.value = httpTransformInfoInterface.getPageContext().getRequest().getParameter(StreetAddressData.ID);
    }

    public function isValid() : Null<Bool> {
        if (this.getWeblisketSession().getUserName() != null) {
            return false;
        }
        var billingAddressesEntity : ShippingAddressesEntity = new ShippingAddressesEntity(this.getWeblisketSession().getUserName());
        this.streetAddress = billingAddressesEntity.get(this.value);
        if (this.streetAddress == null) {
            return false;
        }
        return this.streetAddress.isValid();
    }

    public function validationInfo() : String {
        return this.streetAddress.validationInfo();
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

