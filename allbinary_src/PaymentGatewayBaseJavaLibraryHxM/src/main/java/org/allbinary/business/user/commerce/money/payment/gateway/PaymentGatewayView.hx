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
package org.allbinary.business.user.commerce.money.payment.gateway;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class PaymentGatewayView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var paymentGatewayInterface : PaymentGatewayInterface;
    public function new(paymentGatewayInterface : PaymentGatewayInterface) {
        this.paymentGatewayInterface = paymentGatewayInterface;
    }

    public function getPaymentGatewayInterface() : PaymentGatewayInterface {
        return this.paymentGatewayInterface;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        final hashMap : HashMap = StdUtil.getInstance().createHashMap();
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF(this.commonStrings.START, this, "toXmlNode");
            }
            final hashMap : HashMap = new PaymentGatewayMapping(this.paymentGatewayInterface).toHashMap();
            hashMap.putAll(this.toHashMap());
            final paymentGatewayNode : Node = ModDomHelper.createNodeWithValueNodes(document, Std.string(PaymentGatewayData.NAME), hashMap);
            return paymentGatewayNode;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XSLLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "toXmlNode", e);
            }
            throw e;
        }
    }

}

