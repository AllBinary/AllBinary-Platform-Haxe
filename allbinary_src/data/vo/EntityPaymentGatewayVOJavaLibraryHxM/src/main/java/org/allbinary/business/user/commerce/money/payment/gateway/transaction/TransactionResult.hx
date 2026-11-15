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
package org.allbinary.business.user.commerce.money.payment.gateway.transaction;

//import java.util.HashMap;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class TransactionResult implements TransactionResultInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var keyValuePairs : HashMap;
    private var result : String;
    public function new(result : String) {
        try {
            this.result = result;
            var tokenizer : Tokenizer = new Tokenizer(CommonSeps.getInstance().AMPERSAND);
            var tokens : BasicArrayList = tokenizer.getTokensFromString(result, new BasicArrayListD());
            var tokenizer2 : Tokenizer = new Tokenizer(CommonSeps.getInstance().EQUALS);
            var hashtable : ABHashtable<Any, Any> = tokenizer2.getTokens(tokens);
            this.keyValuePairs.putAll(hashtable);
        } catch (e : haxe.Exception) {
            var exceptionMessage : String = "TransactionResult Constructor Failed";
            this.logUtil.putF(exceptionMessage, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(keyValuePairs : HashMap) {
        keyValuePairs = keyValuePairs;
        this.result = "Needs to have the hashmap converted to string for other constructor";
    }

    public function toString() : String {
        return this.result;
    }

    public function toHashMap() : HashMap {
        return this.keyValuePairs;
    }

    private function getAllPossibleKeys() : BasicArrayList {
        var paymentTransactionKeysFactory : PaymentTransactionKeysFactory = PaymentTransactionKeysFactory.getInstance();
        var verisignResponseKeys : BasicArrayList = new BasicArrayListD();
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.RESULT));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.PNREF));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.RESPMSG));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.AUTHCODE));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.AVSADDR));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.AVSZIP));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.ORIGRESULT));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.STATUS));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.FRAUDCODE));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.FRAUDMSG));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.ERRCODE));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.SCORE));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.REASON1));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.REASON2));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.REASON3));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.EXCEPTION1));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.EXCEPTION2));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.EXCEPTION3));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.EXCEPTION4));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.EXCEPTION5));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.EXCEPTION6));
        verisignResponseKeys.add(Std.string(paymentTransactionKeysFactory.EXCEPTION7));
        return verisignResponseKeys;
    }

    public function getValues() : BasicArrayList {
        var keyVector : BasicArrayList = this.getAllPossibleKeys();
        var valueVector : BasicArrayList = new BasicArrayListD();
        var size : Int = keyVector.size();
        for (i in 0...size) {
            var key : String = (cast keyVector.get(i) : String);
            if (this.keyValuePairs.containsKey(key)) {
                valueVector.add(this.keyValuePairs.get(key));
            } else {
                final stringUtil : StringUtil = StringUtil.getInstance();
                valueVector.add(stringUtil.EMPTY_STRING);
            }
        }
        return valueVector;
    }

    public function getPnRef() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().PNREF)) : String);
    }

    public function getRespMsg() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().RESPMSG)) : String);
    }

    public function getResult() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().RESULT)) : String);
    }

    public function getScore() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().SCORE)) : String);
    }

    public function getStatus() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().STATUS)) : String);
    }

    public function getFraudCode() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().FRAUDCODE)) : String);
    }

    public function getFraudMsg() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().FRAUDMSG)) : String);
    }

    public function getOrigResult() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().ORIGRESULT)) : String);
    }

    public function getAvsAddr() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().AVSADDR)) : String);
    }

    public function getAvsZip() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().AVSZIP)) : String);
    }

    public function getErrCode() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().ERRCODE)) : String);
    }

    public function getException1() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().EXCEPTION1)) : String);
    }

    public function getException2() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().EXCEPTION2)) : String);
    }

    public function getException3() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().EXCEPTION3)) : String);
    }

    public function getException4() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().EXCEPTION4)) : String);
    }

    public function getException5() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().EXCEPTION5)) : String);
    }

    public function getException6() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().EXCEPTION6)) : String);
    }

    public function getException7() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().EXCEPTION7)) : String);
    }

    public function getReason1() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().REASON1)) : String);
    }

    public function getReason2() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().REASON2)) : String);
    }

    public function getReason3() : String {
        return (cast this.keyValuePairs.get(Std.string(PaymentTransactionKeysFactory.getInstance().REASON3)) : String);
    }

}

