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
package org.allbinary.business.user.commerce.money.payment.gateway;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.commerce.money.payment.PaymentData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.control.crypt.SuperCrypt;
import org.allbinary.logic.string.StringUtil;

class PaymentGateway implements PaymentGatewayInterface {
    private var storeName : String = null;
    private var name : String = null;
    private var enable : String = null;
    private var paymentMethod : String = null;
    private var mode : String = null;
    private var testProtocol : String = null;
    private var testServer : String = null;
    private var testPort : String = null;
    private var testPath : String = null;
    private var serverProtocol : String = null;
    private var server : String = null;
    private var serverPort : String = null;
    private var serverPath : String = null;
    private var timeout : String = null;
    private var userName : String = null;
    private var password : String = null;
    private var proxyProtocol : String = null;
    private var proxyServer : String = null;
    private var proxyPort : String = null;
    private var proxyPath : String = null;
    private var proxyUserName : String = null;
    private var proxyPassword : String = null;
    private var proxyTimeout : String = null;
    private var special1 : String = null;
    private var special2 : String = null;
    private var special3 : String = null;
    private var special4 : String = null;
    private var special5 : String = null;
    private var special6 : String = null;
    private var special7 : String = null;
    private var special8 : String = null;
    private var special9 : String = null;
    private var lastModified : String = null;
    private var timeEntered : String = null;
    public function new(hashMap : HashMap) {
        this.getFormData(hashMap);
    }

    public function getFormData(hashMap : HashMap) : Void {
        var stringUtil : StringUtil = StringUtil.getInstance();
        final empty : String = stringUtil.EMPTY_STRING;
        this.storeName = (cast hashMap.get(StoreFrontData.getInstance().NAME.toString()) : String);
        this.name = (cast hashMap.get(PaymentGatewayData.NAME.toString()) : String);
        this.enable = stringUtil.getNonNull((cast hashMap.get(EntryData.getInstance().ENABLE.toString()) : String));
        this.paymentMethod = stringUtil.getNonNull((cast hashMap.get(PaymentData.METHOD.toString()) : String));
        this.mode = stringUtil.getNonNull((cast hashMap.get(PaymentGatewayData.MODE.toString()) : String));
        this.testProtocol = stringUtil.getNonNull((cast hashMap.get(PaymentGatewayData.TESTPROTOCOL.toString()) : String));
        this.testServer = stringUtil.getNonNull((cast hashMap.get(PaymentGatewayData.TESTSERVER.toString()) : String));
        this.testPort = stringUtil.getNonNull((cast hashMap.get(PaymentGatewayData.TESTPORT.toString()) : String));
        this.testPath = (cast hashMap.get(PaymentGatewayData.TESTPATH.toString()) : String);
        if (this.testPath == null) {
            this.testPath = empty;
        }
        this.serverProtocol = (cast hashMap.get(PaymentGatewayData.SERVERPROTOCOL.toString()) : String);
        if (this.serverProtocol == null) {
            this.serverProtocol = empty;
        }
        this.server = (cast hashMap.get(PaymentGatewayData.SERVER.toString()) : String);
        if (this.server == null) {
            this.server = empty;
        }
        this.serverPort = (cast hashMap.get(PaymentGatewayData.SERVERPORT.toString()) : String);
        if (this.serverPort == null) {
            this.serverPort = empty;
        }
        this.serverPath = (cast hashMap.get(PaymentGatewayData.SERVERPATH.toString()) : String);
        if (this.serverPath == null) {
            this.serverPath = empty;
        }
        this.userName = (cast hashMap.get(UserData.USERNAME.toString()) : String);
        if (this.userName == null) {
            this.userName = empty;
        }
        this.password = (cast hashMap.get(UserData.PASSWORD.toString()) : String);
        if (this.password == null) {
            this.password = empty;
        }
        this.timeout = (cast hashMap.get(PaymentGatewayData.TIMEOUT.toString()) : String);
        if (this.timeout == null) {
            this.timeout = empty;
        }
        this.proxyProtocol = (cast hashMap.get(PaymentGatewayData.PROXYPROTOCOL.toString()) : String);
        if (this.proxyProtocol == null) {
            this.proxyProtocol = empty;
        }
        this.proxyServer = (cast hashMap.get(PaymentGatewayData.PROXYSERVER.toString()) : String);
        if (this.proxyServer == null) {
            this.proxyServer = empty;
        }
        this.proxyPort = (cast hashMap.get(PaymentGatewayData.PROXYPORT.toString()) : String);
        if (this.proxyPort == null) {
            this.proxyPort = empty;
        }
        this.proxyPath = (cast hashMap.get(PaymentGatewayData.PROXYPATH.toString()) : String);
        if (this.proxyPath == null) {
            this.proxyPath = empty;
        }
        this.proxyUserName = (cast hashMap.get(PaymentGatewayData.PROXYUSERNAME.toString()) : String);
        if (this.proxyUserName == null) {
            this.proxyUserName = empty;
        }
        this.proxyPassword = (cast hashMap.get(PaymentGatewayData.PROXYPASSWORD.toString()) : String);
        if (this.proxyPassword == null) {
            this.proxyPassword = empty;
        }
        this.proxyTimeout = (cast hashMap.get(PaymentGatewayData.PROXYTIMEOUT.toString()) : String);
        if (this.proxyTimeout == null) {
            this.proxyTimeout = empty;
        }
        this.special1 = (cast hashMap.get(PaymentGatewayData.SPECIAL1.toString()) : String);
        if (this.special1 == null) {
            this.special1 = empty;
        }
        this.special2 = (cast hashMap.get(PaymentGatewayData.SPECIAL2.toString()) : String);
        if (this.special2 == null) {
            this.special2 = empty;
        }
        this.special3 = (cast hashMap.get(PaymentGatewayData.SPECIAL3.toString()) : String);
        if (this.special3 == null) {
            this.special3 = empty;
        }
        this.special4 = (cast hashMap.get(PaymentGatewayData.SPECIAL4.toString()) : String);
        if (this.special4 == null) {
            this.special4 = empty;
        }
        this.special5 = (cast hashMap.get(PaymentGatewayData.SPECIAL5.toString()) : String);
        if (this.special5 == null) {
            this.special5 = empty;
        }
        this.special6 = (cast hashMap.get(PaymentGatewayData.SPECIAL6.toString()) : String);
        if (this.special6 == null) {
            this.special6 = empty;
        }
        this.special7 = (cast hashMap.get(PaymentGatewayData.SPECIAL7.toString()) : String);
        if (this.special7 == null) {
            this.special7 = empty;
        }
        this.special8 = (cast hashMap.get(PaymentGatewayData.SPECIAL8.toString()) : String);
        if (this.special8 == null) {
            this.special8 = empty;
        }
        this.special9 = (cast hashMap.get(PaymentGatewayData.SPECIAL9.toString()) : String);
        if (this.special9 == null) {
            this.special9 = empty;
        }
        this.lastModified = (cast hashMap.get(EntryData.getInstance().LASTMODIFIED.toString()) : String);
        if (this.lastModified == null) {
            this.lastModified = empty;
        }
        this.timeEntered = (cast hashMap.get(EntryData.getInstance().TIMECREATED.toString()) : String);
        if (this.timeEntered == null) {
            this.timeEntered = empty;
        }
    }

    public function getStoreName() : String {
        return this.storeName;
    }

    public function getName() : String {
        return this.name;
    }

    public function getEnable() : String {
        return this.enable;
    }

    public function getPaymentMethod() : String {
        return this.paymentMethod;
    }

    public function getMode() : String {
        return this.mode;
    }

    public function getTestProtocol() : String {
        return this.testProtocol;
    }

    public function getTestServer() : String {
        return this.testServer;
    }

    public function getTestPort() : String {
        return this.testPort;
    }

    public function getTestPath() : String {
        return this.testPath;
    }

    public function getServerProtocol() : String {
        return this.serverProtocol;
    }

    public function getServer() : String {
        return this.server;
    }

    public function getServerPort() : String {
        return this.serverPort;
    }

    public function getServerPath() : String {
        return this.serverPath;
    }

    public function getUserName() : String {
        return this.userName;
    }

    public function getPassword() : String {
        return this.password;
    }

    public function getProxyProtocol() : String {
        return this.proxyProtocol;
    }

    public function getProxyServer() : String {
        return this.proxyServer;
    }

    public function getProxyPath() : String {
        return this.proxyPath;
    }

    public function getProxyPort() : String {
        return this.proxyPort;
    }

    public function getProxyUserName() : String {
        return this.proxyUserName;
    }

    public function getProxyPassword() : String {
        return this.proxyPassword;
    }

    public function getTimeout() : String {
        return this.timeout;
    }

    public function getProxyTimeout() : String {
        return this.proxyTimeout;
    }

    public function getSpecial1() : String {
        return this.special1;
    }

    public function getSpecial2() : String {
        return this.special2;
    }

    public function getSpecial3() : String {
        return this.special3;
    }

    public function getSpecial4() : String {
        return this.special4;
    }

    public function getSpecial5() : String {
        return this.special5;
    }

    public function getSpecial6() : String {
        return this.special6;
    }

    public function getSpecial7() : String {
        return this.special7;
    }

    public function getSpecial8() : String {
        return this.special8;
    }

    public function getSpecial9() : String {
        return this.special9;
    }

    public function getLastModified() : String {
        return this.lastModified;
    }

    public function getTimeEntered() : String {
        return this.timeEntered;
    }

    public function setEnable(value : String) : Void {
        this.enable = value;
    }

    public function setStoreName(value : String) : Void {
        this.storeName = value;
    }

    public function setName(value : String) : Void {
        this.name = value;
    }

    public function setPaymentMethod(value : String) : Void {
        this.paymentMethod = value;
    }

    public function setMode(value : String) : Void {
        this.mode = value;
    }

    public function setTestProtocol(value : String) : Void {
        this.testProtocol = value;
    }

    public function setTestServer(value : String) : Void {
        this.testServer = value;
    }

    public function setTestPort(value : String) : Void {
        this.testPort = value;
    }

    public function setTestPath(value : String) : Void {
        this.testPath = value;
    }

    public function setServerProtocol(value : String) : Void {
        this.serverProtocol = value;
    }

    public function setServer(value : String) : Void {
        this.server = value;
    }

    public function setServerPort(value : String) : Void {
        this.serverPort = value;
    }

    public function setServerPath(value : String) : Void {
        this.serverPath = value;
    }

    public function setTimeout(value : String) : Void {
        this.timeout = value;
    }

    public function setUserName(value : String) : Void {
        this.userName = value;
    }

    public function setPassword(value : String) : Void {
        this.password = value;
    }

    public function setProxyProtocol(value : String) : Void {
        this.proxyProtocol = value;
    }

    public function setProxyServer(value : String) : Void {
        this.proxyServer = value;
    }

    public function setProxyPort(value : String) : Void {
        this.proxyPort = value;
    }

    public function setProxyPath(value : String) : Void {
        this.proxyPath = value;
    }

    public function setProxyUserName(value : String) : Void {
        this.proxyUserName = value;
    }

    public function setProxyPassword(value : String) : Void {
        this.proxyPassword = value;
    }

    public function setProxyTimeout(value : String) : Void {
        this.proxyTimeout = value;
    }

    public function setSpecial1(value : String) : Void {
        this.special1 = value;
    }

    public function setSpecial2(value : String) : Void {
        this.special2 = value;
    }

    public function setSpecial3(value : String) : Void {
        this.special3 = value;
    }

    public function setSpecial4(value : String) : Void {
        this.special4 = value;
    }

    public function setSpecial5(value : String) : Void {
        this.special5 = value;
    }

    public function setSpecial6(value : String) : Void {
        this.special6 = value;
    }

    public function setSpecial7(value : String) : Void {
        this.special7 = value;
    }

    public function setSpecial8(value : String) : Void {
        this.special8 = value;
    }

    public function setSpecial9(value : String) : Void {
        this.special9 = value;
    }

    public function setLastModified(value : String) : Void {
        this.lastModified = value;
    }

    public function setTimeEntered(value : String) : Void {
        this.timeEntered = value;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        return this.toHashMap(true);
    }

    // throws Exception
    public function toHashMap(isEncrypted : Bool) : HashMap {
        var paymentGatewayHashMap : HashMap = StdUtil.getInstance().createHashMap();
        paymentGatewayHashMap.put(EntryData.getInstance().ENABLE, this.enable);
        paymentGatewayHashMap.put(StoreFrontData.getInstance().NAME.toString(), this.storeName);
        paymentGatewayHashMap.put(PaymentGatewayData.NAME.toString(), this.getName());
        paymentGatewayHashMap.put(PaymentData.METHOD.toString(), this.paymentMethod);
        paymentGatewayHashMap.put(PaymentGatewayData.MODE.toString(), this.mode);
        paymentGatewayHashMap.put(PaymentGatewayData.TESTPROTOCOL.toString(), this.testProtocol);
        paymentGatewayHashMap.put(PaymentGatewayData.TESTSERVER.toString(), this.testServer);
        paymentGatewayHashMap.put(PaymentGatewayData.TESTPORT.toString(), this.testPort);
        paymentGatewayHashMap.put(PaymentGatewayData.TESTPATH.toString(), this.testPath);
        paymentGatewayHashMap.put(PaymentGatewayData.SERVERPROTOCOL.toString(), this.serverProtocol);
        paymentGatewayHashMap.put(PaymentGatewayData.SERVER.toString(), this.server);
        paymentGatewayHashMap.put(PaymentGatewayData.SERVERPORT.toString(), this.serverPort);
        paymentGatewayHashMap.put(PaymentGatewayData.SERVERPATH.toString(), this.serverPath);
        if (isEncrypted) {
            var superCrypt : SuperCrypt = new SuperCrypt(PaymentGatewayData.CRYPTNUM);
            paymentGatewayHashMap.put(UserData.USERNAME.toString(), superCrypt.encrypt(this.userName));
            paymentGatewayHashMap.put(UserData.PASSWORD.toString(), superCrypt.encrypt(this.password));
        } else {
            paymentGatewayHashMap.put(UserData.USERNAME.toString(), this.userName);
            paymentGatewayHashMap.put(UserData.PASSWORD.toString(), this.password);
        }
        paymentGatewayHashMap.put(PaymentGatewayData.TIMEOUT.toString(), this.timeout);
        paymentGatewayHashMap.put(PaymentGatewayData.PROXYPROTOCOL.toString(), this.proxyProtocol);
        paymentGatewayHashMap.put(PaymentGatewayData.PROXYSERVER.toString(), this.proxyServer);
        paymentGatewayHashMap.put(PaymentGatewayData.PROXYPORT.toString(), this.proxyPort);
        paymentGatewayHashMap.put(PaymentGatewayData.PROXYPATH.toString(), this.proxyPath);
        paymentGatewayHashMap.put(PaymentGatewayData.PROXYUSERNAME.toString(), this.proxyUserName);
        paymentGatewayHashMap.put(PaymentGatewayData.PROXYPASSWORD.toString(), this.proxyPassword);
        paymentGatewayHashMap.put(PaymentGatewayData.PROXYTIMEOUT.toString(), this.proxyTimeout);
        if (isEncrypted) {
            var superCrypt : SuperCrypt = new SuperCrypt(PaymentGatewayData.CRYPTNUM);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL1.toString(), superCrypt.encrypt(this.special1));
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL2.toString(), superCrypt.encrypt(this.special2));
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL3.toString(), superCrypt.encrypt(this.special3));
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL4.toString(), superCrypt.encrypt(this.special4));
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL5.toString(), superCrypt.encrypt(this.special5));
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL6.toString(), superCrypt.encrypt(this.special6));
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL7.toString(), superCrypt.encrypt(this.special7));
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL8.toString(), superCrypt.encrypt(this.special8));
        } else {
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL1.toString(), this.special1);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL2.toString(), this.special2);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL3.toString(), this.special3);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL4.toString(), this.special4);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL5.toString(), this.special5);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL6.toString(), this.special6);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL7.toString(), this.special7);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL8.toString(), this.special8);
            paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL9.toString(), this.special9);
        }
        paymentGatewayHashMap.put(EntryData.getInstance().LASTMODIFIED.toString(), this.lastModified);
        return paymentGatewayHashMap;
    }

    public function toVector() : BasicArrayList {
        return this.toVector(true);
    }

    public function toVector(isEncrypted : Bool) : BasicArrayList {
        var updateVector : BasicArrayList = new BasicArrayListD();
        updateVector.add(this.enable);
        updateVector.add(this.storeName);
        updateVector.add(this.getName());
        updateVector.add(this.paymentMethod);
        updateVector.add(this.mode);
        updateVector.add(this.testProtocol);
        updateVector.add(this.testServer);
        updateVector.add(this.testPort);
        updateVector.add(this.testPath);
        updateVector.add(this.serverProtocol);
        updateVector.add(this.server);
        updateVector.add(this.serverPort);
        updateVector.add(this.serverPath);
        if (isEncrypted) {
            var superCrypt : SuperCrypt = new SuperCrypt(PaymentGatewayData.CRYPTNUM);
            updateVector.add(superCrypt.encrypt(this.userName));
            updateVector.add(superCrypt.encrypt(this.password));
        } else {
            updateVector.add(this.userName);
            updateVector.add(this.password);
        }
        updateVector.add(this.timeout);
        updateVector.add(this.proxyProtocol);
        updateVector.add(this.proxyServer);
        updateVector.add(this.proxyPort);
        updateVector.add(this.proxyPath);
        updateVector.add(this.proxyUserName);
        updateVector.add(this.proxyPassword);
        updateVector.add(this.proxyTimeout);
        if (isEncrypted) {
            var superCrypt : SuperCrypt = new SuperCrypt(PaymentGatewayData.CRYPTNUM);
            updateVector.add(superCrypt.encrypt(this.special1));
            updateVector.add(superCrypt.encrypt(this.special2));
            updateVector.add(superCrypt.encrypt(this.special3));
            updateVector.add(superCrypt.encrypt(this.special4));
            updateVector.add(superCrypt.encrypt(this.special5));
            updateVector.add(superCrypt.encrypt(this.special6));
            updateVector.add(superCrypt.encrypt(this.special7));
            updateVector.add(superCrypt.encrypt(this.special8));
            updateVector.add(superCrypt.encrypt(this.special9));
        } else {
            updateVector.add(this.special1);
            updateVector.add(this.special2);
            updateVector.add(this.special3);
            updateVector.add(this.special4);
            updateVector.add(this.special5);
            updateVector.add(this.special6);
            updateVector.add(this.special7);
            updateVector.add(this.special8);
            updateVector.add(this.special9);
        }
        return updateVector;
    }

    // throws Exception
    public function getKey() : Any {
        return (cast new PaymentGatewayPrimaryKey(this.getStoreName(), this.getName()) : Any);
    }

}

