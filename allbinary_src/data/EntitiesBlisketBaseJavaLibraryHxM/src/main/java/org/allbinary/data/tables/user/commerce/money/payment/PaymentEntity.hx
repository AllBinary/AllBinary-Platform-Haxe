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
package org.allbinary.data.tables.user.commerce.money.payment;

//import java.util.Calendar;
//import java.util.HashMap;
//import java.util.Random;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.commerce.money.payment.Payment;
import org.allbinary.business.user.commerce.money.payment.PaymentData;
import org.allbinary.business.user.commerce.money.payment.PaymentInterface;
import org.allbinary.data.generator.PaymentIdGenerator;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.control.crypt.SuperCrypt;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class PaymentEntity extends AbSqlBean implements PaymentEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tableName : String = "payment";
    public function new() {
        super(new UserDbInitInfo());
        this.setTableName(this.tableName);
    }

    public function getLastId(userName : String) : String {
        return super.getLargestIntegerInColumnWhere(PaymentData.ID, UserData.USERNAME, userName);
    }

    public function setDefault(userName : String, index : Null<Int>) : Void {
        try {
            var updateKeyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            var whereKeyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            whereKeyAndValue.put(UserData.USERNAME, userName);
            var paymentInterface : PaymentInterface = this.getDefault(userName);
            if (paymentInterface != null) {
                updateKeyAndValue.put(EntryData.getInstance().DEFAULT, StringUtil.getInstance().EMPTY_STRING);
                whereKeyAndValue.put(PaymentData.ID, paymentInterface.getId());
                super.updateWhere(whereKeyAndValue, updateKeyAndValue);
            }
            updateKeyAndValue.put(EntryData.getInstance().DEFAULT, EntryData.getInstance().DEFAULT);
            whereKeyAndValue.put(PaymentData.ID, index.toString());
            super.updateWhere(whereKeyAndValue, updateKeyAndValue);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "setDefault");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "setDefault", e);
            }
        }
    }

    public function get(userName : String) : BasicArrayList {
        try {
            var paymentVector : BasicArrayList = new BasicArrayListD();
            var keyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            keyAndValue.put(UserData.USERNAME, userName);
            var paymentList : BasicArrayList = super.getRows(keyAndValue);
            final size : Int = paymentList.size();
            for (index in 0...size) {
                var paymentHashMap : HashMap = (cast paymentList.get(index) : HashMap);
                var payment : Payment = new Payment(paymentHashMap);
                if (payment != null) {
                    paymentVector.add(payment);
                }
            }
            return paymentVector;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, this.commonStrings.GET, e);
            }
            return null;
        }
    }

    public function getDefault(userName : String) : PaymentInterface {
        try {
            var paymentHashMap : HashMap = StdUtil.getInstance().createHashMap();
            var updateKeyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            updateKeyAndValue.put(EntryData.getInstance().DEFAULT, EntryData.getInstance().DEFAULT);
            updateKeyAndValue.put(UserData.USERNAME, userName);
            paymentHashMap = super.getRow(updateKeyAndValue);
            if (paymentHashMap != null) {
                var payment : Payment = new Payment(paymentHashMap);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.commonStrings.SUCCESS, this, "getDefault");
                }
                return (cast payment : PaymentInterface);
            } else {
                return null;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "getDefault", e);
            }
            return null;
        }
    }

    public function remove(userName : String, index : Null<Int>) : Void {
        try {
            var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
            whereHashMap.put(UserData.USERNAME, userName);
            whereHashMap.put(PaymentData.ID, (cast index.toString() : String));
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

    public function add(userName : String, paymentInterface : PaymentInterface) : Void {
        try {
            var vector : BasicArrayList = new BasicArrayListD();
            vector.add(new PaymentIdGenerator().getNext());
            vector.add(userName);
            vector.add(StringUtil.getInstance().EMPTY_STRING);
            vector.add(paymentInterface.getName());
            vector.add(paymentInterface.getType());
            vector.add(paymentInterface.getExpiration());
            var random : Int = new Random().nextInt(SuperCrypt.KEYMAX);
            vector.add(new SuperCrypt(random).encrypt(paymentInterface.getNumber()));
            vector.add(random.toString());
            var calendar : Calendar = Calendar.getInstance();
            var time : String = calendar.getTimeInMillis().toString();
            vector.add(time);
            super.insert(vector);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "add");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "add", e);
            }
        }
    }

    public function createTableStatement() : String {
        var entryData : EntryData = EntryData.getInstance();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE).append(tableName).append(this.sqlStrings.START).append(PaymentData.ID).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_AUTO_INCREMENT_NOT_NULL).append(UserData.USERNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(entryData.DEFAULT).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(PaymentData.NAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(PaymentData.TYPE).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(PaymentData.EXPIRATION).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(PaymentData.NUMBER).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(entryData.ENCRYPTION).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(entryData.TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(PaymentData.ID).append(this.sqlStrings.END);
        return stringBuffer.toString();
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function drop() : String {
        return super.dropTable();
    }

}

