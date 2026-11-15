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
import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterface;
import org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionKeysFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlBean;
import org.allbinary.logic.string.StringMaker;

class TransactionEntity extends AbSqlBean implements TransactionEntityInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final tableName : String = "vtrans";
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

    public function add(userName : String, orderNumber : String, paymentTransactionInterface : PaymentTransactionInterface) : Void {
        try {
            var values : BasicArrayList = new BasicArrayListD();
            values.add(orderNumber);
            values.add(userName);
            values.addAllList(paymentTransactionInterface.toVector());
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

    public function createTableStatement() : String {
        var paymentTransactionKeysFactory : PaymentTransactionKeysFactory = PaymentTransactionKeysFactory.getInstance();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.sqlStrings.CREATE_TABLE);
        stringBuffer.append(this.tableName);
        stringBuffer.append(this.sqlStrings.START);
        stringBuffer.append(OrderData.ID).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(UserData.USERNAME).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.TRXTYPE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.TENDER)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.ACCT)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EXPDATE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.AMT)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.AUTHCODE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.MICR)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.CHECKNUM)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.NAME)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.STREET)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.CITY)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.STATE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.ZIP)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.DL)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.EMAIL)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.COMMENT1)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.COMMENT2)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.ORIGID)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.PONUM)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.DESC)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.DESC1TO4)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.INVNUM)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SHIPTOZIP)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SWIPE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.TAXAMT)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.COMMCARD)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.DUTYAMT)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.FREIGHTAMT)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.ORDERDATE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.TAXEXEMPT)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.COUNTRYCODE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.CUSTCODE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.CVV2)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.ABA)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.ACCTTYPE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.DISCOUNT)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.FIRSTNAME)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.LASTNAME)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SHIPFROMZIP)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.PRENOTE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.CHKTYPE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.DOB)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.PHONENUM)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SS)).append(" VARCHAR(30) NOT NULL,").append(Std.string(paymentTransactionKeysFactory.COMPANYNAME)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.COUNTRY)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SHIPTOCITY)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SHIPTOFIRSTNAME)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SHIPTOLASTNAME)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SHIPTOSTATE)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SHIPTOSTREET)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SPECIAL1)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SPECIAL2)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(Std.string(paymentTransactionKeysFactory.SPECIAL3)).append(this.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL).append(EntryData.getInstance().LASTMODIFIED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(EntryData.getInstance().TIMECREATED).append(this.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL).append(this.sqlStrings.PRIMARY_KEY).append(OrderData.ID).append(this.sqlStrings.END);
        return Std.string(stringBuffer);
    }

    public function createTable() : String {
        return super.createTable(this.createTableStatement());
    }

    public function dropTable() : String {
        return super.dropTable();
    }

}

