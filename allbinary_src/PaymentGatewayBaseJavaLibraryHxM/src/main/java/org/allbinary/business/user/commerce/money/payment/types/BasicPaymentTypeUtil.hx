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
package org.allbinary.business.user.commerce.money.payment.types;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;

class BasicPaymentTypeUtil {
    private static final instance : BasicPaymentTypeUtil = new BasicPaymentTypeUtil();
    static function __init__() {
    }
    public static function getInstance() : BasicPaymentTypeUtil {
        return BasicPaymentTypeUtil.instance;
    }

    public function new() {
    }

    private var paymentTypeVector : BasicArrayList = new BasicArrayListD();
    public function add(paymentType : BasicPaymentType) : Void {
        this.paymentTypeVector.add(paymentType);
    }

    // throws Exception
    public function get(paymentTypeString : String) : BasicPaymentType {
        var size : Int = this.paymentTypeVector.size();
        for (i in 0...size) {
            var paymentType : BasicPaymentType = (cast this.paymentTypeVector.get(i) : BasicPaymentType);
            if (paymentType.getName().compareTo(paymentTypeString) == 0) {
                return paymentType;
            }
        }
        throw new haxe.Exception("Unknown PaymentType: " + paymentTypeString);
    }

    public function isContain(paymentType : BasicPaymentType) : Bool {
        return this.paymentTypeVector.contains(paymentType);
    }

    public function difference(a_PaymentTypeVector : BasicArrayList) : BasicArrayList {
        var diff : BasicArrayList = new BasicArrayListD();
        var size : Int = this.paymentTypeVector.size();
        for (i in 0...size) {
            var paymentType : BasicPaymentType = (cast this.paymentTypeVector.get(i) : BasicPaymentType);
            if (!a_PaymentTypeVector.contains(paymentType)) {
                diff.add(paymentType);
            }
        }
        return diff;
    }

}

