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
package org.allbinary.business.installer;

import org.allbinary.business.init.InitInfoEntity;
import org.allbinary.business.init.db.DatabaseConnectionInfoInterface;
import org.allbinary.business.init.db.DbConnectionInfo;
import org.allbinary.business.init.db.HistoryDbInitInfo;
import org.allbinary.business.init.db.InventoryDbInitInfo;
import org.allbinary.business.init.db.LogDbInitInfo;
import org.allbinary.business.init.db.StaticPagesDbInitInfo;
import org.allbinary.business.init.db.UserDbInitInfo;
import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory;
import org.allbinary.data.tables.log.LogTableEntityFactory;
import org.allbinary.data.tables.staticpages.StaticPagesEntityFactory;
import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder;
import org.allbinary.data.tables.user.UserEntityFactory;
import org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory;
import org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityFactory;
import org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityFactory;
import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory;
import org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionEntityFactory;
import org.allbinary.data.tables.user.commerce.money.payment.transaction.TransactionResultEntityFactory;
import org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbDatabaseManagement;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileFactory;
import org.allbinary.logic.string.StringMaker;

//Warning you must have sql root access
class InitDbCrypted extends AbDatabaseManagement {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var userDbInitInfo : UserDbInitInfo = null;
    private var inventoryDbInitInfo : InventoryDbInitInfo = null;
    private var historyDbInitInfo : HistoryDbInitInfo = null;
    private var staticpagesDbInitInfo : StaticPagesDbInitInfo = null;
    private var logDbInitInfo : LogDbInitInfo = null;
    private final SQL_FILE : String = "initWeblisket.sql";
    public function new(databaseConnectionInfoInterface : DatabaseConnectionInfoInterface) {
        super((cast databaseConnectionInfoInterface : DbConnectionInfo));
    }

    public function addUsers() : Null<Bool> {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.METHOD_ADD_USERS);
            this.userDbInitInfo = new UserDbInitInfo();
            this.inventoryDbInitInfo = new InventoryDbInitInfo();
            this.historyDbInitInfo = new HistoryDbInitInfo();
            this.staticpagesDbInitInfo = new StaticPagesDbInitInfo();
            this.logDbInitInfo = new LogDbInitInfo();
            var CUSTOMERDB : String = this.userDbInitInfo.getName();
            var CUSTOMERDBUSER : String = this.userDbInitInfo.getUserName();
            var CUSTOMERDBPASSWORD : String = this.userDbInitInfo.getPassword();
            if (!this.addDbUser(CUSTOMERDB, CUSTOMERDBUSER, CUSTOMERDBPASSWORD)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_USER + CUSTOMERDBUSER, this, this.METHOD_ADD_USERS);
                return false;
            }
            var INVENTORYDB : String = this.inventoryDbInitInfo.getName();
            var INVENTORYDBUSER : String = this.inventoryDbInitInfo.getUserName();
            var INVENTORYDBPASSWORD : String = this.inventoryDbInitInfo.getPassword();
            if (!this.addDbUser(INVENTORYDB, INVENTORYDBUSER, INVENTORYDBPASSWORD)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_USER + INVENTORYDBUSER, this, this.METHOD_ADD_USERS);
                return false;
            }
            var HISTORYDB : String = this.historyDbInitInfo.getName();
            var HISTORYDBUSER : String = this.historyDbInitInfo.getUserName();
            var HISTORYDBPASSWORD : String = this.historyDbInitInfo.getPassword();
            if (!this.addDbUser(HISTORYDB, HISTORYDBUSER, HISTORYDBPASSWORD)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_USER + HISTORYDBUSER, this, this.METHOD_ADD_USERS);
                return false;
            }
            var STATICPAGESDB : String = this.staticpagesDbInitInfo.getName();
            var STATICPAGESDBUSER : String = this.staticpagesDbInitInfo.getUserName();
            var STATICPAGESDBPASSWORD : String = this.staticpagesDbInitInfo.getPassword();
            if (!this.addDbUser(STATICPAGESDB, STATICPAGESDBUSER, STATICPAGESDBPASSWORD)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_USER + STATICPAGESDBUSER, this, this.METHOD_ADD_USERS);
                return false;
            }
            var LOGDB : String = this.logDbInitInfo.getName();
            var LOGDBUSER : String = this.logDbInitInfo.getUserName();
            var LOGDBPASSWORD : String = this.logDbInitInfo.getPassword();
            if (!this.addDbUser(LOGDB, LOGDBUSER, LOGDBPASSWORD)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_USER + LOGDBUSER, this, this.METHOD_ADD_USERS);
                return false;
            }
            this.logUtil.putF(this.commonStrings.END, this, this.METHOD_ADD_USERS);
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.METHOD_ADD_USERS, e);
            return true;
        }
    }

    public function addDatabases() : Null<Bool> {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.METHOD_ADD_DATABASES);
            this.userDbInitInfo = new UserDbInitInfo();
            this.inventoryDbInitInfo = new InventoryDbInitInfo();
            this.historyDbInitInfo = new HistoryDbInitInfo();
            this.staticpagesDbInitInfo = new StaticPagesDbInitInfo();
            this.logDbInitInfo = new LogDbInitInfo();
            var CUSTOMERDB : String = this.userDbInitInfo.getName();
            if (!this.addDb(CUSTOMERDB)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_DATABASE + CUSTOMERDB, this, this.METHOD_ADD_DATABASES);
                return false;
            }
            var INVENTORYDB : String = this.inventoryDbInitInfo.getName();
            if (!this.addDb(INVENTORYDB)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_DATABASE + INVENTORYDB, this, this.METHOD_ADD_DATABASES);
                return false;
            }
            var HISTORYDB : String = this.historyDbInitInfo.getName();
            if (!this.addDb(HISTORYDB)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_DATABASE + HISTORYDB, this, this.METHOD_ADD_DATABASES);
                return false;
            }
            var STATICPAGESDB : String = this.staticpagesDbInitInfo.getName();
            if (!this.addDb(STATICPAGESDB)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_DATABASE + STATICPAGESDB, this, this.METHOD_ADD_DATABASES);
                return false;
            }
            var LOGDB : String = this.logDbInitInfo.getName();
            if (!this.addDb(LOGDB)) {
                this.logUtil.putF(this.UNABLE_TO_CREATE_DATABASE + LOGDB, this, this.METHOD_ADD_DATABASES);
                return false;
            }
            var file : AbFile = FileFactory.getInstance().getInstance(this.SQL_FILE);
            file.createNewFile();
            var idOutData : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(file);
            idOutData.writeBytes(this.sqlCommandLog.toString());
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.METHOD_ADD_DATABASES, e);
            return true;
        }
    }

    public function addTables() : Null<Bool> {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            this.logUtil.putF(this.commonStrings.START, this, this.METHOD_ADD_TABLES);
            stringBuffer.append(UserEntityFactory.getInstance().createTable());
            stringBuffer.append(StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance().createTable());
            stringBuffer.append(BillingAddressesEntityFactory.getInstance().getInstance(this.stringUtil.EMPTY_STRING).createTable());
            stringBuffer.append(ShippingAddressesEntityFactory.getInstance().getInstance(this.stringUtil.EMPTY_STRING).createTable());
            stringBuffer.append(PaymentEntityFactory.getInstance().getPaymentEntityInstance().createTable());
            stringBuffer.append(QuoteRequestEntityFactory.getInstance().getQuoteRequestEntityInstance().createTable());
            stringBuffer.append(OrderHistoryEntityFactory.getInstance().createTable());
            stringBuffer.append(OrderItemsEntityFactory.getInstance().createTable());
            stringBuffer.append(TransactionEntityFactory.getInstance().getTransactionEntityInstance().createTable());
            stringBuffer.append(TransactionResultEntityFactory.getInstance().getTransactionResultEntityInstance().createTable());
            stringBuffer.append(PaymentGatewayEntityFactory.getInstance().createTable());
            stringBuffer.append(InventoryEntityFactory.getInstance().getInventoryEntityInstance().createTable());
            stringBuffer.append(new InitInfoEntity().createTable());
            stringBuffer.append(LogTableEntityFactory.getInstance().getLogTableEntityInstance().createTable());
            stringBuffer.append(StaticPagesEntityFactory.getInstance().getStaticPagesEntityInstance().createTable());
            stringBuffer.append(TransformInfoEntityBuilder.getInstance().createTable());
            this.logUtil.putF(ADD_TABLES_RESULTS_LABEL + stringBuffer.toString(), this, this.METHOD_ADD_TABLES);
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.METHOD_ADD_TABLES, e);
            return false;
        }
    }

}

