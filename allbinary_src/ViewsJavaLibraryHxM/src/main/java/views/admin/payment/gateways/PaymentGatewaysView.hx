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
package views.admin.payment.gateways;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewaysData;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType;
import org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class PaymentGatewaysView extends HttpStoreComponentView implements DomNodeInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var paymentGatewayVector : BasicArrayList;
    public function new(transformInfoInterface : TransformInfoInterface, gatewayVector : BasicArrayList) {
        super(transformInfoInterface);
        this.paymentGatewayVector = gatewayVector;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        try {
            var storeName : String = this.getTransformInfoInterface().getStoreName();
            var paymentGatewaysNode : Node = document.createElement(PaymentGatewaysData.NAME);
            var size : Int = this.paymentGatewayVector.size();
            for (index in 0...size) {
                var paymentType : BasicPaymentType = (cast this.paymentGatewayVector.get(index) : BasicPaymentType);
                var hashMap : HashMap = paymentType.toHashMap();
                hashMap.put(EntryData.getInstance().DEFAULT, PaymentTypeUtil.getInstance().getDefault(storeName).getBasicPaymentType().getName());
                var paymentGatewayNode : Node = ModDomHelper.createNodeWithValueNodes(document, PaymentGatewayData.NAME.toString(), hashMap);
                paymentGatewaysNode.appendChild(paymentGatewayNode);
            }
            return paymentGatewaysNode;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XSLLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "toXmlNode", e);
            }
            throw e;
        }
    }

    public function addDomNodeInterfaces() : Void {
        this.addDomNodeInterface((cast this : DomNodeInterface));
    }

    public function view() : String {
        try {
            this.addDomNodeInterfaces();
            return super.view();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view payment gateways";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            return error;
        }
    }

}

