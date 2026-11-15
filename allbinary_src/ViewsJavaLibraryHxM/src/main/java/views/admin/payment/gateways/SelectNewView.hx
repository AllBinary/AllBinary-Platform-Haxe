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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil;
import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory;
import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import views.admin.payment.gateway.PaymentGatewayViewAbstract;

class SelectNewView extends PaymentGatewayViewAbstract {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // throws Exception
    public function view() : String {
        try {
            var paymentGatewayEntityInterface : PaymentGatewayEntityInterface = PaymentGatewayEntityFactory.getInstance();
            var existingGateways : BasicArrayList = paymentGatewayEntityInterface.findPaymentTypeVectorByStore(this.getPaymentGatewayPrimaryKey().getStoreName());
            var allGatewaysLessExisting : BasicArrayList = BasicPaymentTypeUtil.getInstance().difference(existingGateways);
            return new PaymentGatewaysView(this.getTransformInfoInterface(), allGatewaysLessExisting).view();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view", e);
            }
            throw e;
        }
    }

}

