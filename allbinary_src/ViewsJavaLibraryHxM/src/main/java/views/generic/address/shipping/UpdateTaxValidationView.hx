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
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.address.ShippingAddressData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.business.user.commerce.money.tax.TaxFactory;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class UpdateTaxValidationView extends ShippingAddressView implements ValidationComponentInterface {
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // throws Exception
    public function isValid() : Null<Bool> {
        this.streetAddress = new StreetAddress(this.getRequest());
        var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getTransformInfoInterface().getStoreName());
        if (TaxFactory.getInstance().getInstance(this.abeClientInformation, storeFrontInterface).isValid(this.streetAddress, storeFrontInterface) == false) {
            return false;
        }
        var billingAddressesEntity : ShippingAddressesEntity = new ShippingAddressesEntity(this.getWeblisketSession().getUserName());
        var streetAddressList : BasicArrayList = billingAddressesEntity.get();
        if (streetAddressList == null) {
            return false;
        }
        var count : Int = 0;
        final size : Int = streetAddressList.size();
        for (index in 0...size) {
            var aStreetAddress : StreetAddress = (cast streetAddressList.get(index) : StreetAddress);
            if (aStreetAddress.getName().compareTo(ShippingAddressData.TAX) == 0) {
                count++;
            }
        }
        if (count != 1) {
            return false;
        }
        return true;
    }

    public function validationInfo() : String {
        return "Unable to update tax location.";
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

