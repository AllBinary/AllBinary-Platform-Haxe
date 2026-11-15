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
package views.admin.payment.gateway;

//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayPrimaryKey;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpComposite;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;

class PaymentGatewayViewAbstract extends TransformInfoHttpComposite {
    private var paymentGatewayPrimaryKey : PaymentGatewayPrimaryKey = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.getFormData((cast this.getPageContext().getRequest() : HttpServletRequest));
    }

    public function getFormData(request : HttpServletRequest) : Void {
        var storeName : String = this.getWeblisketSession().getStoreName();
        var gatewayName : String = request.getParameter(PaymentGatewayData.NAME.toString());
        this.setPaymentGatewayPrimaryKey(new PaymentGatewayPrimaryKey(storeName, gatewayName));
    }

    public function getPaymentGatewayPrimaryKey() : PaymentGatewayPrimaryKey {
        return this.paymentGatewayPrimaryKey;
    }

    public function setPaymentGatewayPrimaryKey(paymentGatewayPrimaryKey : PaymentGatewayPrimaryKey) : Void {
        this.paymentGatewayPrimaryKey = paymentGatewayPrimaryKey;
    }

}

