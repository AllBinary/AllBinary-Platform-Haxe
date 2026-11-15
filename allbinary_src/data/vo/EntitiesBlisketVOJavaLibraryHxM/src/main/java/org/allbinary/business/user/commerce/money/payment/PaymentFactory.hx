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
package org.allbinary.business.user.commerce.money.payment;

//import javax.servlet.ServletRequest;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class PaymentFactory {
    public function new() {
    }

    public static function getInstance(request : ServletRequest) : PaymentInterface {
        final logUtil : LogUtil = LogUtil.getInstance();
        try {
            return (cast new org.allbinary.business.user.commerce.money.payment.Payment(request) : PaymentInterface);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().FACTORYERROR)) {
                logUtil.put(commonStrings.EXCEPTION, "PaymentFactory", commonStrings.GET_INSTANCE, e);
            }
            return null;
        }
    }

}

