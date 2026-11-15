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
package org.allbinary.business.user.commerce.shipping;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.shipping.modules.ShippingInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;

class ShippingMethods implements ShippingMethodsInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var shippingVector : BasicArrayList;
    private var defaultShippingMethodInterface : ShippingInterface;
    public function new(abeClientInformation : AbeClientInformationInterface, storeFrontInterface : StoreFrontInterface) {
        this.defaultShippingMethodInterface = new ShippingMethodsFactory(abeClientInformation, storeFrontInterface).getDefaultInstance();
        this.shippingVector = new ShippingMethodsFactory(abeClientInformation, storeFrontInterface).getInstance();
    }

    public function get() : BasicArrayList {
        return this.shippingVector;
    }

    // throws Exception
    public function getShippingInterface(name : String) : ShippingInterface {
        var shipping : ShippingInterface = null;
        final size : Int = this.shippingVector.size();
        for (index in 0...size) {
            shipping = (cast this.shippingVector.get(index) : ShippingInterface);
            if (Reflect.compare(name, shipping.getName()) == 0) {
                return shipping;
            }
        }
        var error : String = "Error Finding Shipping: " + name;
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SHIPPINGERROR)) {
            this.logUtil.putF(this.commonStrings.EXCEPTION, this, "getShippingInterface(String name)");
        }
        throw new haxe.Exception(error);
    }

    // throws Exception
    public function getDefault() : ShippingInterface {
        return this.defaultShippingMethodInterface;
    }

}

