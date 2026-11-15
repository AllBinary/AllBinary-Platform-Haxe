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
package org.allbinary.data.tables.user.commerce.money.payment.gateway;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.commerce.money.payment.PaymentData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayEncryptedMapping;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactory;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil;
import org.allbinary.data.generator.PaymentGatewayIdGenerator;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.control.crypt.SuperCrypt;
import org.allbinary.logic.string.StringMaker;

class PaymentGatewayEntity extends AbSqlBean implements PaymentGatewayEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tableName : String = "paymentgateways";
    public function new() {
        super(new UserDbInitInfo());
        this.setTableName(this.tableName);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
            this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    public function add(paymentGatewayInterface : PaymentGatewayInterface) : Void {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.START, this, "add");
            }
            var vector : BasicArrayList = new BasicArrayListD();
            vector.add(new PaymentGatewayIdGenerator().getNext());
            vector.addAllList(new PaymentGatewayEncryptedMapping(paymentGatewayInterface).toVector());
            var calendar : Calendar = Calendar.getInstance();
            var time : String = calendar.getTimeInMillis().toString();
            vector.add(time);
            vector.add(time);
            super.insert(vector);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.END, this, "add");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "add", e);
            }
        }
    }

    public function update(paymentGatewayInterface : PaymentGatewayInterface) : Void {
        try {
            var calendar : Calendar = Calendar.getInstance();
            var time : String = calendar.getTimeInMillis().toString();
            paymentGatewayInterface.setLastModified(time);
            var whereKeyValuePairs : HashMap = StdUtil.getInstance().createHashMap();
            whereKeyValuePairs.put(StoreFrontData.getInstance().NAME.toString(), paymentGatewayInterface.getStoreName());
            whereKeyValuePairs.put(PaymentGatewayData.NAME.toString(), paymentGatewayInterface.getName());
            if (whereKeyValuePairs.get(EntryData.getInstance().TIMECREATED) != null) {
                throw new haxe.Exception("Don't update TimeCreated for update");
            }
            var updateHashMap : HashMap = new PaymentGatewayEncryptedMapping(paymentGatewayInterface).toHashMap();
            super.updateWhere(whereKeyValuePairs, updateHashMap);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "update");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "update", e);
            }
        }
    }

    public function getPaymentGatewayInterface(storeName : String, paymentType : BasicPaymentType) : PaymentGatewayInterface {
        try {
            var paymentGatewayHashMap : HashMap = StdUtil.getInstance().createHashMap();
            var whereKeyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            whereKeyAndValue.put(StoreFrontData.getInstance().NAME.toString(), storeName);
            whereKeyAndValue.put(PaymentGatewayData.NAME.toString(), paymentType.getName());
            paymentGatewayHashMap = super.getRow(whereKeyAndValue);
            if (paymentGatewayHashMap != null) {
                var userName : String = (cast paymentGatewayHashMap.get(UserData.USERNAME.toString()) : String);
                var password : String = (cast paymentGatewayHashMap.get(UserData.PASSWORD.toString()) : String);
                var special1 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL1.toString()) : String);
                var special2 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL2.toString()) : String);
                var special3 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL3.toString()) : String);
                var special4 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL4.toString()) : String);
                var special5 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL5.toString()) : String);
                var special6 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL6.toString()) : String);
                var special7 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL7.toString()) : String);
                var special8 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL8.toString()) : String);
                var special9 : String = (cast paymentGatewayHashMap.get(PaymentGatewayData.SPECIAL9.toString()) : String);
                var superCrypt : SuperCrypt = new SuperCrypt(PaymentGatewayData.CRYPTNUM);
                paymentGatewayHashMap.put(UserData.USERNAME.toString(), superCrypt.decrypt(userName));
                paymentGatewayHashMap.put(UserData.PASSWORD.toString(), superCrypt.decrypt(password));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL1.toString(), superCrypt.decrypt(special1));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL2.toString(), superCrypt.decrypt(special2));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL3.toString(), superCrypt.decrypt(special3));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL4.toString(), superCrypt.decrypt(special4));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL5.toString(), superCrypt.decrypt(special5));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL6.toString(), superCrypt.decrypt(special6));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL7.toString(), superCrypt.decrypt(special7));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL8.toString(), superCrypt.decrypt(special8));
                paymentGatewayHashMap.put(PaymentGatewayData.SPECIAL9.toString(), superCrypt.decrypt(special9));
                var paymentGatewayInterface : PaymentGatewayInterface = new PaymentGatewayInterfaceFactory().getInstance(paymentGatewayHashMap);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.commonStrings.SUCCESS, this, "getPaymentGatewayInterface()");
                }
                return paymentGatewayInterface;
            } else {
                return new PaymentGatewayInterfaceFactory().getInstance(paymentType);
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put("Command Failed for paymentType: " + paymentType.getName(), this, "getPaymentGatewayInterface", e);
            }
            return null;
        }
    }

    public function findPaymentTypeVectorByStore(storeName : String) : BasicArrayList {
        try {
            var paymentGatewayNameVector : BasicArrayList = new BasicArrayListD();
            paymentGatewayNameVector = super.getColumnWhere(PaymentGatewayData.NAME.toString(), StoreFrontData.getInstance().NAME.toString(), storeName);
            if (paymentGatewayNameVector != null) {
                var paymentGatewayVector : BasicArrayList = new BasicArrayListD();
                var size : Int = paymentGatewayNameVector.size();
                for (i in 0...size) {
                    var paymentTypeString : String = (cast paymentGatewayNameVector.get(i) : String);
                    var paymentType : BasicPaymentType = BasicPaymentTypeUtil.getInstance().get(paymentTypeString);
                    paymentGatewayVector.add(paymentType);
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.commonStrings.SUCCESS, this, "findPaymentTypeVectorByStore()");
                }
                return paymentGatewayVector;
            } else {
                return new BasicArrayListD();
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "findPaymentTypeVectorByStore", e);
            }
            return null;
        }
    }

    public function remove(storeName : String, paymentType : BasicPaymentType) : Void {
        try {
            var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
            whereHashMap.put(StoreFrontData.getInstance().NAME.toString(), storeName);
            whereHashMap.put(PaymentGatewayData.NAME.toString(), paymentType.getName());
            super.deleteWhere(whereHashMap);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "remove");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "remove", e);
            }
        }
    }

    public function createTableStatement() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE);
        stringBuffer.append(this.tableName);
        stringBuffer.append(this.sqlStrings.START);
        stringBuffer.append(PaymentGatewayData.ID.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().ENABLE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(StoreFrontData.getInstance().NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.NAME.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentData.METHOD);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.MODE.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.TESTPROTOCOL.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.TESTSERVER.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.TESTPORT.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.TESTPATH.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SERVERPROTOCOL.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SERVER.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SERVERPORT.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SERVERPATH.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(UserData.USERNAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(UserData.PASSWORD);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.TIMEOUT.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.PROXYPROTOCOL.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.PROXYSERVER.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.PROXYPORT.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.PROXYPATH.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.PROXYUSERNAME.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.PROXYPASSWORD.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.PROXYTIMEOUT.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL1.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL2.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL3.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL4.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL5.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL6.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL7.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL8.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentGatewayData.SPECIAL9.toString());
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().LASTMODIFIED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().TIMECREATED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(this.sqlStrings.PRIMARY_KEY);
        stringBuffer.append(PaymentGatewayData.ID.toString());
        stringBuffer.append(this.sqlStrings.END);
        return stringBuffer.toString();
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

