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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.address.ShippingAddressData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class TaxValidationView extends ShippingAddressView implements ValidationComponentInterface {
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        var billingAddressesEntity : ShippingAddressesEntity = new ShippingAddressesEntity(this.getWeblisketSession().getUserName());
        var streetAddressList : BasicArrayList = billingAddressesEntity.get();
        if (streetAddressList == null) {
            return false;
        }
        final size : Int = streetAddressList.size();
        for (index in 0...size) {
            var aStreetAddress : StreetAddress = (cast streetAddressList.get(index) : StreetAddress);
            if (aStreetAddress.getName().compareTo(ShippingAddressData.TAX) == 0) {
                this.streetAddress = aStreetAddress;
                return true;
            }
        }
        return false;
    }

    public function validationInfo() : String {
        return StringUtil.getInstance().EMPTY_STRING;
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

