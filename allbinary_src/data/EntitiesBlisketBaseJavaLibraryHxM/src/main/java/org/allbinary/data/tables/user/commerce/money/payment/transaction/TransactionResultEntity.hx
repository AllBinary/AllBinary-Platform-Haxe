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
package org.allbinary.data.tables.user.commerce.money.payment.transaction;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.commerce.inventory.order.OrderData;
import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionKeysFactory;
import org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResult;
import org.allbinary.business.user.commerce.money.payment.gateway.transaction.TransactionResultInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;

class TransactionResultEntity extends AbSqlBean implements TransactionResultEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tableName : String = "vresults";
    public function new() {
        super(new UserDbInitInfo());
        this.setTableName(this.tableName);
    }

    public function remove(userName : String, orderNumber : String) : Void {
        try {
            var whereHashMap : HashMap = StdUtil.getInstance().createHashMap();
            whereHashMap.put(OrderData.ID, (cast orderNumber : String));
            whereHashMap.put(UserData.USERNAME, userName);
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

    public function add(userName : String, orderNumber : String, transactionResultInterface : TransactionResultInterface) : Void {
        try {
            var values : BasicArrayList = new BasicArrayListD();
            values.add(orderNumber);
            values.add(userName);
            values.addAllList(transactionResultInterface.getValues());
            var calendar : Calendar = Calendar.getInstance();
            var time : String = Std.string(calendar.getTimeInMillis());
            values.add(time);
            values.add(time);
            super.insert(values);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.putF(this.commonStrings.SUCCESS, this, "add");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "add", e);
            }
        }
    }

    public function getTransactionResultInterface(orderNumber : String) : TransactionResultInterface {
        try {
            var resultHashMap : HashMap = StdUtil.getInstance().createHashMap();
            var updateKeyAndValue : HashMap = StdUtil.getInstance().createHashMap();
            updateKeyAndValue.put(OrderData.ID, orderNumber);
            resultHashMap = super.getRow(updateKeyAndValue);
            if (resultHashMap != null) {
                var transactionResult : TransactionResult = new TransactionResult(resultHashMap);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                    this.logUtil.putF(this.commonStrings.SUCCESS, this, "getTransactionResultInterface");
                }
                return (cast transactionResult : TransactionResultInterface);
            } else {
                return null;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLLOGGING)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "getTransactionResultInterface", e);
            }
            return null;
        }
    }

    public function createTableStatement() : String {
        final paymentTransactionKeysFactory : PaymentTransactionKeysFactory = PaymentTransactionKeysFactory.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE).append(tableName).append(this.sqlStrings.START).append(OrderData.ID).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(UserData.USERNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(paymentTransactionKeysFactory.RESULT)).append(this.sqlTypeStrings.MAX_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.PNREF)).append(this.sqlTypeStrings.TWELVE_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(paymentTransactionKeysFactory.RESPMSG)).append(this.sqlTypeStrings.BLOB_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.AUTHCODE)).append(this.sqlTypeStrings.SIX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.AVSADDR)).append(this.sqlTypeStrings.ONE_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(paymentTransactionKeysFactory.AVSZIP)).append(this.sqlTypeStrings.ONE_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.ORIGRESULT)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.STATUS)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(Std.string(paymentTransactionKeysFactory.FRAUDCODE)).append(this.sqlTypeStrings.TWO_INT_NOT_NULL);
        stringBuffer.append(Std.string(paymentTransactionKeysFactory.FRAUDMSG)).append(this.sqlTypeStrings.MAX_INT_NOT_NULL);
        stringBuffer.append(Std.string(paymentTransactionKeysFactory.ERRCODE)).append(this.sqlTypeStrings.MAX_INT_NOT_NULL);
        stringBuffer.append(Std.string(paymentTransactionKeysFactory.SCORE)).append(this.sqlTypeStrings.THREE_INT_NOT_NULL);
        stringBuffer.append(Std.string(paymentTransactionKeysFactory.REASON1)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.REASON2)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.REASON3));
        stringBuffer.append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EXCEPTION1)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EXCEPTION2)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EXCEPTION3)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EXCEPTION4)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EXCEPTION5)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EXCEPTION6)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EXCEPTION7)).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(EntryData.getInstance().LASTMODIFIED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(EntryData.getInstance().TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(OrderData.ID).append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

