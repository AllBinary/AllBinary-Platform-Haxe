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

//import java.util.HashMap;
//import javax.servlet.ServletRequest;
import org.allbinary.business.entry.EntryData;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.control.crypt.SuperCrypt;
import org.allbinary.logic.string.StringUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class Payment implements PaymentInterface implements DomNodeInterface {
    private var name : String;
    private var expiration : String;
    private var encryption : String;
    private var number : String;
    private var id : String;
    private var type : String;
    private var tenderType : String;
    private var transactionType : String;
    private var aba : String;
    private var account : String;
    private var accountType : String;
    private var authorizationCode : String;
    private var checkNumber : String;
    private var checkType : String;
    private var driversLicense : String;
    private var magneticInkCheckReader : String;
    private var isDefault : Bool = false;
    public function new(payment : HashMap) {
        this.name = (cast payment.get(PaymentData.NAME) : String);
        this.type = (cast payment.get(PaymentData.TYPE) : String);
        this.expiration = (cast payment.get(PaymentData.EXPIRATION) : String);
        this.encryption = (cast payment.get(EntryData.getInstance().ENCRYPTION) : String);
        this.number = (cast new SuperCrypt(Std.int(this.encryption)).decrypt((cast payment.get(PaymentData.NUMBER) : String)) : String);
        this.id = (cast payment.get(PaymentData.ID) : String);
        var def : String = (cast payment.get(EntryData.getInstance().DEFAULT) : String);
        if (def != null && Reflect.compare(def, EntryData.getInstance().DEFAULT) == 0) {
            this.isDefault = true;
        } else {
            this.isDefault = false;
        }
        this.tenderType = (cast payment.get(PaymentData.TENDERTYPE) : String);
        this.transactionType = (cast payment.get(PaymentData.TRANSACTIONTYPE) : String);
        this.aba = (cast payment.get(PaymentData.ABA) : String);
        this.account = (cast payment.get(PaymentData.ACCOUNT) : String);
        this.accountType = (cast payment.get(PaymentData.ACCOUNTTYPE) : String);
        this.authorizationCode = (cast payment.get(PaymentData.AUTHORIZATIONCODE) : String);
        this.checkNumber = (cast payment.get(PaymentData.CHECKNUMBER) : String);
        this.checkType = (cast payment.get(PaymentData.CHECKTYPE) : String);
        this.driversLicense = (cast payment.get(PaymentData.DRIVERSLICENSE) : String);
        this.magneticInkCheckReader = (cast payment.get(PaymentData.MAGNETICINKCHECKREADER) : String);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(request : ServletRequest) {
        this.name = request.getParameter(PaymentData.NAME);
        this.type = request.getParameter(PaymentData.TYPE);
        this.expiration = request.getParameter(PaymentData.EXPIRATION);
        this.number = request.getParameter(PaymentData.NUMBER);
        this.tenderType = request.getParameter(PaymentData.TENDERTYPE);
        this.transactionType = request.getParameter(PaymentData.TRANSACTIONTYPE);
        this.aba = request.getParameter(PaymentData.ABA);
        this.account = request.getParameter(PaymentData.ACCOUNT);
        this.accountType = request.getParameter(PaymentData.ACCOUNTTYPE);
        this.authorizationCode = request.getParameter(PaymentData.AUTHORIZATIONCODE);
        this.checkNumber = request.getParameter(PaymentData.CHECKNUMBER);
        this.checkType = request.getParameter(PaymentData.CHECKTYPE);
        this.driversLicense = request.getParameter(PaymentData.DRIVERSLICENSE);
        this.magneticInkCheckReader = request.getParameter(PaymentData.MAGNETICINKCHECKREADER);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new() {
    }

    public function isValid() : Null<Bool> {
        final stringUtil : StringUtil = StringUtil.getInstance();
        var aFalse : Null<Bool> = false;
        if (this.name == null || Reflect.compare(this.name, stringUtil.EMPTY_STRING) == 0) {
            return aFalse;
        }
        if (this.type == null || Reflect.compare(this.type, stringUtil.EMPTY_STRING) == 0) {
            return aFalse;
        }
        if (this.expiration == null || Reflect.compare(this.expiration, stringUtil.EMPTY_STRING) == 0) {
            return aFalse;
        }
        if (this.number == null || Reflect.compare(this.number, stringUtil.EMPTY_STRING) == 0) {
            return aFalse;
        }
        if (this.number.length > org.allbinary.business.user.commerce.money.payment.types.CreditCardType.MAXLEN) {
            return aFalse;
        }
        return true;
    }

    public function setTenderType(value : String) : Void {
        this.tenderType = value;
    }

    public function setTransactionType(value : String) : Void {
        this.transactionType = value;
    }

    public function setAuthorizationCode(value : String) : Void {
        this.authorizationCode = value;
    }

    public function setCheckType(value : String) : Void {
        this.checkType = value;
    }

    public function setCheckNumber(value : String) : Void {
        this.checkNumber = value;
    }

    public function setDriversLicense(value : String) : Void {
        this.driversLicense = value;
    }

    public function setMagneticInkCheckReader(value : String) : Void {
        this.magneticInkCheckReader = value;
    }

    public function setAba(value : String) : Void {
        this.aba = value;
    }

    public function setAccountType(value : String) : Void {
        this.accountType = value;
    }

    public function setName(value : String) : Void {
        this.name = value;
    }

    public function setType(value : String) : Void {
        this.type = value;
    }

    public function setExpiration(value : String) : Void {
        this.expiration = value;
    }

    public function setNumber(value : String) : Void {
        this.number = value;
    }

    public function getId() : String {
        return this.id;
    }

    public function getName() : String {
        return this.name;
    }

    public function getType() : String {
        return this.type;
    }

    public function getExpiration() : String {
        return this.expiration;
    }

    public function getEncryption() : String {
        return this.encryption;
    }

    public function getNumber() : String {
        return this.number;
    }

    public function getTenderType() : String {
        return this.tenderType;
    }

    public function getTransactionType() : String {
        return this.transactionType;
    }

    public function getAba() : String {
        return this.aba;
    }

    public function getAccount() : String {
        return this.account;
    }

    public function getAccountType() : String {
        return this.accountType;
    }

    public function getAuthorizationCode() : String {
        return this.authorizationCode;
    }

    public function getCheckNumber() : String {
        return this.checkNumber;
    }

    public function getCheckType() : String {
        return this.checkType;
    }

    public function getDriversLicense() : String {
        return this.driversLicense;
    }

    public function getMagneticInkCheckReader() : String {
        return this.magneticInkCheckReader;
    }

    public function getLastFour() : String {
        if (this.number.length > PaymentData.MIN && this.number.length <= PaymentData.MAX) {
            return this.number.substring(this.number.length - 4);
        } else {
            return "Invalid #";
        }
    }

    public function isDefault() : Bool {
        return this.isDefault;
    }

    public function toHashMap() : HashMap {
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(PaymentData.NAME, this.name);
        hashMap.put(PaymentData.TYPE, this.type);
        hashMap.put(PaymentData.EXPIRATION, this.expiration);
        hashMap.put(PaymentData.NUMBER, this.getLastFour());
        hashMap.put(PaymentData.TENDERTYPE, this.tenderType);
        hashMap.put(PaymentData.TRANSACTIONTYPE, this.transactionType);
        hashMap.put(PaymentData.ABA, this.aba);
        hashMap.put(PaymentData.ACCOUNT, this.account);
        hashMap.put(PaymentData.ACCOUNTTYPE, this.accountType);
        hashMap.put(PaymentData.AUTHORIZATIONCODE, this.authorizationCode);
        hashMap.put(PaymentData.CHECKNUMBER, this.checkNumber);
        hashMap.put(PaymentData.DRIVERSLICENSE, this.driversLicense);
        hashMap.put(PaymentData.MAGNETICINKCHECKREADER, this.magneticInkCheckReader);
        if (this.isDefault) {
            hashMap.put(EntryData.getInstance().DEFAULT, EntryData.getInstance().DEFAULT);
        } else {
            hashMap.put(EntryData.getInstance().DEFAULT, StringUtil.getInstance().EMPTY_STRING);
        }
        return hashMap;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var hashMap : HashMap = this.toHashMap();
        var node : Node = ModDomHelper.createNameValueNodes(document, PaymentData.PAYMENT, hashMap);
        return node;
    }

    public function toXmlDoc() : Document {
        return null;
    }

    public function view() : String {
        return null;
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    public function validationInfo() : String {
        return null;
    }

}

