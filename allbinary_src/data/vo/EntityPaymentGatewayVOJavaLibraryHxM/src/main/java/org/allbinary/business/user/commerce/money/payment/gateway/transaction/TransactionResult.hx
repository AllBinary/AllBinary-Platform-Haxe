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
        verisignResponseKeys.add(paymentTransactionKeysFactory.RESULT.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.PNREF.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.RESPMSG.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.AUTHCODE.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.AVSADDR.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.AVSZIP.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.ORIGRESULT.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.STATUS.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.FRAUDCODE.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.FRAUDMSG.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.ERRCODE.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.SCORE.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.REASON1.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.REASON2.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.REASON3.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.EXCEPTION1.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.EXCEPTION2.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.EXCEPTION3.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.EXCEPTION4.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.EXCEPTION5.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.EXCEPTION6.toString());
        verisignResponseKeys.add(paymentTransactionKeysFactory.EXCEPTION7.toString());
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
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().PNREF.toString()) : String);
    }

    public function getRespMsg() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().RESPMSG.toString()) : String);
    }

    public function getResult() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().RESULT.toString()) : String);
    }

    public function getScore() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().SCORE.toString()) : String);
    }

    public function getStatus() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().STATUS.toString()) : String);
    }

    public function getFraudCode() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().FRAUDCODE.toString()) : String);
    }

    public function getFraudMsg() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().FRAUDMSG.toString()) : String);
    }

    public function getOrigResult() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().ORIGRESULT.toString()) : String);
    }

    public function getAvsAddr() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().AVSADDR.toString()) : String);
    }

    public function getAvsZip() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().AVSZIP.toString()) : String);
    }

    public function getErrCode() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().ERRCODE.toString()) : String);
    }

    public function getException1() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().EXCEPTION1.toString()) : String);
    }

    public function getException2() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().EXCEPTION2.toString()) : String);
    }

    public function getException3() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().EXCEPTION3.toString()) : String);
    }

    public function getException4() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().EXCEPTION4.toString()) : String);
    }

    public function getException5() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().EXCEPTION5.toString()) : String);
    }

    public function getException6() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().EXCEPTION6.toString()) : String);
    }

    public function getException7() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().EXCEPTION7.toString()) : String);
    }

    public function getReason1() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().REASON1.toString()) : String);
    }

    public function getReason2() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().REASON2.toString()) : String);
    }

    public function getReason3() : String {
        return (cast this.keyValuePairs.get(PaymentTransactionKeysFactory.getInstance().REASON3.toString()) : String);
    }

}

