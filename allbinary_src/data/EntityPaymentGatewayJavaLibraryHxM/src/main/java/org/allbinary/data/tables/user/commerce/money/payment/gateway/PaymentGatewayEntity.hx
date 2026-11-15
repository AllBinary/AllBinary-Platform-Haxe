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
            var time : String = Std.string(calendar.getTimeInMillis());
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
            var time : String = Std.string(calendar.getTimeInMillis());
            paymentGatewayInterface.setLastModified(time);
            var whereKeyValuePairs : HashMap = StdUtil.getInstance().createHashMap();
            whereKeyValuePairs.put(Std.string(StoreFrontData.getInstance().NAME), paymentGatewayInterface.getStoreName());
            whereKeyValuePairs.put(Std.string(PaymentGatewayData.NAME), paymentGatewayInterface.getName());
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
            whereKeyAndValue.put(Std.string(StoreFrontData.getInstance().NAME), storeName);
            whereKeyAndValue.put(Std.string(PaymentGatewayData.NAME), paymentType.getName());
            paymentGatewayHashMap = super.getRow(whereKeyAndValue);
            if (paymentGatewayHashMap != null) {
                var userName : String = (cast paymentGatewayHashMap.get(Std.string(UserData.USERNAME)) : String);
                var password : String = (cast paymentGatewayHashMap.get(Std.string(UserData.PASSWORD)) : String);
                var special1 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL1)) : String);
                var special2 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL2)) : String);
                var special3 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL3)) : String);
                var special4 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL4)) : String);
                var special5 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL5)) : String);
                var special6 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL6)) : String);
                var special7 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL7)) : String);
                var special8 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL8)) : String);
                var special9 : String = (cast paymentGatewayHashMap.get(Std.string(PaymentGatewayData.SPECIAL9)) : String);
                var superCrypt : SuperCrypt = new SuperCrypt(PaymentGatewayData.CRYPTNUM);
                paymentGatewayHashMap.put(Std.string(UserData.USERNAME), superCrypt.decrypt(userName));
                paymentGatewayHashMap.put(Std.string(UserData.PASSWORD), superCrypt.decrypt(password));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL1), superCrypt.decrypt(special1));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL2), superCrypt.decrypt(special2));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL3), superCrypt.decrypt(special3));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL4), superCrypt.decrypt(special4));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL5), superCrypt.decrypt(special5));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL6), superCrypt.decrypt(special6));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL7), superCrypt.decrypt(special7));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL8), superCrypt.decrypt(special8));
                paymentGatewayHashMap.put(Std.string(PaymentGatewayData.SPECIAL9), superCrypt.decrypt(special9));
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
            paymentGatewayNameVector = super.getColumnWhere(Std.string(PaymentGatewayData.NAME), Std.string(StoreFrontData.getInstance().NAME), storeName);
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
            whereHashMap.put(Std.string(StoreFrontData.getInstance().NAME), storeName);
            whereHashMap.put(Std.string(PaymentGatewayData.NAME), paymentType.getName());
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
        stringBuffer.append(Std.string(PaymentGatewayData.ID));
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().ENABLE);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(StoreFrontData.getInstance().NAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.NAME));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(PaymentData.METHOD);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.MODE));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.TESTPROTOCOL));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.TESTSERVER));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.TESTPORT));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.TESTPATH));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SERVERPROTOCOL));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SERVER));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SERVERPORT));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SERVERPATH));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(UserData.USERNAME);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(UserData.PASSWORD);
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.TIMEOUT));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.PROXYPROTOCOL));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.PROXYSERVER));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.PROXYPORT));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.PROXYPATH));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.PROXYUSERNAME));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.PROXYPASSWORD));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.PROXYTIMEOUT));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL1));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL2));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL3));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL4));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL5));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL6));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL7));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL8));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(PaymentGatewayData.SPECIAL9));
        stringBuffer.append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().LASTMODIFIED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(EntryData.getInstance().TIMECREATED);
        stringBuffer.append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL);
        stringBuffer.append(this.sqlStrings.PRIMARY_KEY);
        stringBuffer.append(Std.string(PaymentGatewayData.ID));
        stringBuffer.append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

