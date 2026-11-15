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
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil;
import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;

class GatewayView extends PaymentGatewayViewAbstract {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function getFormData(request : HttpServletRequest) : Void {
        super.getFormData(request);
        if (StringValidationUtil.getInstance().isEmpty(this.getPaymentGatewayPrimaryKey().getName())) {
            this.getPaymentGatewayPrimaryKey().setName(this.getWeblisketSession().getPaymentMethod());
        }
    }

    // throws Exception
    public function view() : String {
        try {
            var paymentGatewayInterface : PaymentGatewayInterface = PaymentGatewayEntityFactory.getInstance().getPaymentGatewayInterface(this.getPaymentGatewayPrimaryKey().getStoreName(), BasicPaymentTypeUtil.getInstance().get(this.getPaymentGatewayPrimaryKey().getName()));
            return new PaymentGatewayComponent(this.getTransformInfoInterface(), paymentGatewayInterface).view();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "edit()", e);
            }
            throw e;
        }
    }

}

