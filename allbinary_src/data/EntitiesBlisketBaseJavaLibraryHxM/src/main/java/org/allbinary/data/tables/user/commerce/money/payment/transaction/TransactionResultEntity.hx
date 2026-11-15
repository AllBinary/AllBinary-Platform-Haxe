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
            var time : String = calendar.getTimeInMillis().toString();
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
        stringBuffer.append(paymentTransactionKeysFactory.RESULT.toString()).append(this.sqlTypeStrings.MAX_INT_NOT_NULL).append(paymentTransactionKeysFactory.PNREF.toString()).append(this.sqlTypeStrings.TWELVE_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(paymentTransactionKeysFactory.RESPMSG.toString()).append(this.sqlTypeStrings.BLOB_NOT_NULL).append(paymentTransactionKeysFactory.AUTHCODE.toString()).append(this.sqlTypeStrings.SIX_CHAR_COLUMN_NOT_NULL).append(paymentTransactionKeysFactory.AVSADDR.toString()).append(this.sqlTypeStrings.ONE_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(paymentTransactionKeysFactory.AVSZIP.toString()).append(this.sqlTypeStrings.ONE_CHAR_COLUMN_NOT_NULL).append(paymentTransactionKeysFactory.ORIGRESULT.toString()).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(paymentTransactionKeysFactory.STATUS.toString()).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL);
        stringBuffer.append(paymentTransactionKeysFactory.FRAUDCODE.toString()).append(this.sqlTypeStrings.TWO_INT_NOT_NULL);
        stringBuffer.append(paymentTransactionKeysFactory.FRAUDMSG.toString()).append(this.sqlTypeStrings.MAX_INT_NOT_NULL);
        stringBuffer.append(paymentTransactionKeysFactory.ERRCODE.toString()).append(this.sqlTypeStrings.MAX_INT_NOT_NULL);
        stringBuffer.append(paymentTransactionKeysFactory.SCORE.toString()).append(this.sqlTypeStrings.THREE_INT_NOT_NULL);
        stringBuffer.append(paymentTransactionKeysFactory.REASON1.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.REASON2.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.REASON3.toString());
        stringBuffer.append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.EXCEPTION1.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.EXCEPTION2.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.EXCEPTION3.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.EXCEPTION4.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.EXCEPTION5.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.EXCEPTION6.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(paymentTransactionKeysFactory.EXCEPTION7.toString()).append(this.sqlTypeStrings.FOUR_INT_NOT_NULL).append(EntryData.getInstance().LASTMODIFIED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(EntryData.getInstance().TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(OrderData.ID).append(this.sqlStrings.END);
        return stringBuffer.toString();
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

