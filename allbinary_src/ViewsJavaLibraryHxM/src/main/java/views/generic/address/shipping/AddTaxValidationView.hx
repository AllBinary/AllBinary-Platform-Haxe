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
import org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class AddTaxValidationView extends ShippingAddressView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // throws Exception
    public function isValid() : Null<Bool> {
        try {
            this.streetAddress = new StreetAddress(this.getRequest());
            var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getTransformInfoInterface().getStoreName());
            var taxInterface : TaxModuleInterface = TaxFactory.getInstance().getInstance(this.abeClientInformation, storeFrontInterface);
            if (taxInterface == null) {
                return false;
            }
            if (taxInterface.isValid(this.streetAddress, storeFrontInterface) == false) {
                return false;
            }
            var billingAddressesEntity : ShippingAddressesEntity = new ShippingAddressesEntity(this.getWeblisketSession().getUserName());
            var streetAddressList : BasicArrayList = billingAddressesEntity.get();
            if (streetAddressList == null) {
                return false;
            }
            final size : Int = streetAddressList.size();
            for (index in 0...size) {
                var aStreetAddress : StreetAddress = (cast streetAddressList.get(index) : StreetAddress);
                if (aStreetAddress.getName().compareTo(ShippingAddressData.TAX) == 0) {
                    return false;
                }
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    // throws Exception
    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getTransformInfoInterface().getStoreName());
            var taxInterface : TaxModuleInterface = TaxFactory.getInstance().getInstance(this.abeClientInformation, storeFrontInterface);
            if (taxInterface == null) {
                stringBuffer.append("Unable to Load Tax Component<br/>");
            } else {
                if (taxInterface.isValid(this.streetAddress, storeFrontInterface) == false) {
                    stringBuffer.append("Unable to validate address with Tax Component<br/>");
                }
            }
            var billingAddressesEntity : ShippingAddressesEntity = new ShippingAddressesEntity(this.getWeblisketSession().getUserName());
            var streetAddressList : BasicArrayList = billingAddressesEntity.get();
            final size : Int = streetAddressList.size();
            for (index in 0...size) {
                var aStreetAddress : StreetAddress = (cast streetAddressList.get(index) : StreetAddress);
                if (aStreetAddress.getName().compareTo(ShippingAddressData.TAX) == 0) {
                    stringBuffer.append("Not a valid tax location<br/>");
                }
            }
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to create validateInfo", this, "validationInfo()", e);
            }
            return "Error Creating ValidationInfo";
        }
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

