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
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewaysData;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class PaymentTypeUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : PaymentTypeUtil = new PaymentTypeUtil();
    static function __init__() {
    }
    public static function getInstance() : PaymentTypeUtil {
        return PaymentTypeUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final PAYMENTGATEWAYFILEPATHSTRING : String;
    private final SHIPPINGMETHODSFILENAME : String = "paymentGatewayTypes.xml";
    private var defaultName : String = null;
    private var paymentTypeVector : BasicArrayList = new BasicArrayListD();
    public function new() {
        final stringBuffer : StringMaker = new StringMaker();
        final sep : String = AbPathData.getInstance().SEPARATOR;
        stringBuffer.append(sep);
        stringBuffer.append("generic");
        stringBuffer.append(sep);
        stringBuffer.append("user");
        stringBuffer.append(sep);
        stringBuffer.append("commerce");
        stringBuffer.append(sep);
        stringBuffer.append("money");
        stringBuffer.append(sep);
        stringBuffer.append("payment");
        stringBuffer.append(sep);
        stringBuffer.append("gateway");
        stringBuffer.append(sep);
        this.PAYMENTGATEWAYFILEPATHSTRING = Std.string(stringBuffer);
    }

    public function add(paymentType : PaymentType) : Void {
        this.paymentTypeVector.add(paymentType);
    }

    // throws Exception
    public function get(paymentTypeString : String) : PaymentType {
        var size : Int = this.paymentTypeVector.size();
        for (i in 0...size) {
            var paymentType : PaymentType = (cast this.paymentTypeVector.get(i) : PaymentType);
            if (paymentType.getBasicPaymentType().getName().compareTo(paymentTypeString) == 0) {
                return paymentType;
            }
        }
        throw new haxe.Exception("Unknown PaymentType: " + paymentTypeString);
    }

    // throws Exception
    public function initDefault(storeName : String) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENT)) {
            this.logUtil.putF("initDefault Payment: " + this.defaultName, this, "initDefault");
        }
        if (StringValidationUtil.getInstance().isEmpty(this.defaultName)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(URLGLOBALS.getMainPath());
            stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
            stringBuffer.append(storeName);
            stringBuffer.append(AbPathData.getInstance().SEPARATOR);
            stringBuffer.append(this.PAYMENTGATEWAYFILEPATHSTRING);
            var abPath : AbPath = (cast new AbPath(Std.string(stringBuffer), this.SHIPPINGMETHODSFILENAME) : AbPath);
            var data : String = new CryptFileReader(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION).get(abPath);
            var document : Document = DomDocumentHelper.create(data);
            var nodeList : NodeList = document.getElementsByTagName(PaymentGatewaysData.NAME);
            for (index in 0...nodeList.getLength()) {
                var node : Node = nodeList.item(index);
                var defaultPaymentGatewayNode : Node = DomSearchHelper.getNode(EntryData.getInstance().DEFAULT, node.getChildNodes());
                var defaultPaymentGatewayNodeValue : String = DomNodeHelper.getTextNodeValue(defaultPaymentGatewayNode);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENT)) {
                    this.logUtil.putF("DefaultPaymentGatewayNodeValue: " + defaultPaymentGatewayNodeValue, this, "initDefault");
                }
                if (!StringValidationUtil.getInstance().isEmpty(defaultPaymentGatewayNodeValue)) {
                    this.defaultName = defaultPaymentGatewayNodeValue;
                }
            }
        }
    }

    // throws Exception
    public function getDefault(storeName : String) : PaymentType {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENT)) {
            this.logUtil.putF(this.commonStrings.START, this, "getDefault");
        }
        this.initDefault(storeName);
        if (!StringValidationUtil.getInstance().isEmpty(this.defaultName)) {
            return this.get(this.defaultName);
        }
        throw new haxe.Exception("No Default: " + this.defaultName);
    }

    public function isContain(paymentType : PaymentType) : Bool {
        return this.paymentTypeVector.contains(paymentType);
    }

    public function difference(a_PaymentTypeVector : BasicArrayList) : BasicArrayList {
        var diff : BasicArrayList = new BasicArrayListD();
        var size : Int = this.paymentTypeVector.size();
        for (i in 0...size) {
            var paymentType : PaymentType = (cast this.paymentTypeVector.get(i) : PaymentType);
            if (!a_PaymentTypeVector.contains(paymentType)) {
                diff.add(paymentType);
            }
        }
        return diff;
    }

}

