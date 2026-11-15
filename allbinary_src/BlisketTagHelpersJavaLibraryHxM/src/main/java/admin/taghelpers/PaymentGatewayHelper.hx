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
package admin.taghelpers;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.installer.Portion;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface;
import org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactory;
import org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil;
import org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlTableUtil;
import org.allbinary.logic.string.StringMaker;

class PaymentGatewayHelper extends BasicTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var weblisketSession : WeblisketSession = null;
    private final httpServletRequest : HttpServletRequest = null;
    private final portion : Portion = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        try {
            this.weblisketSession = new WeblisketSession(hashMap, pageContext);
            this.httpServletRequest = (cast pageContext.getRequest() : HttpServletRequest);
            this.portion = new Portion(hashMap);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().PAYMENTERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
            }
            throw e;
        }
    }

    public function insert() : String {
        try {
            var paymentGatewayInterface : PaymentGatewayInterface = new PaymentGatewayInterfaceFactory().getInstance(this.httpServletRequest);
            paymentGatewayInterface.setStoreName(this.weblisketSession.getStoreName());
            PaymentGatewayEntityFactory.getInstance().add(paymentGatewayInterface);
            var success : String = "Successfully Added New Payment Gateway";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "insert()");
            }
            return success + "<br/>";
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "add()", e);
            }
            return error + "<br>" + "Exception: " + e + "<br>";
        }
    }

    public function update() : String {
        try {
            var paymentGatewayInterface : PaymentGatewayInterface = new PaymentGatewayInterfaceFactory().getInstance(this.httpServletRequest);
            paymentGatewayInterface.setStoreName(this.weblisketSession.getStoreName());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Gateway Name: ");
                stringBuffer.append(paymentGatewayInterface.getName());
                stringBuffer.append(" HashMap=");
                stringBuffer.append(paymentGatewayInterface.toHashMap(true).toString());
                this.logUtil.putF(stringBuffer.toString(), this, "update()");
            }
            PaymentGatewayEntityFactory.getInstance().update(paymentGatewayInterface);
            var success : String = "Successfully Updated Payment Gateway information";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "update()");
            }
            return success + "<br/>";
        } catch (e : haxe.Exception) {
            var error : String = "Failed to update payment gateway information";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error + "<br/>" + "Exception: " + e + "<br/>";
        }
    }

    public function delete() : String {
        try {
            var paymentGatewayInterface : PaymentGatewayInterface = new PaymentGatewayInterfaceFactory().getInstance(this.httpServletRequest);
            paymentGatewayInterface.setStoreName(this.weblisketSession.getStoreName());
            var storeName : String = paymentGatewayInterface.getStoreName();
            var gatewayName : String = paymentGatewayInterface.getName();
            PaymentGatewayEntityFactory.getInstance().remove(storeName, BasicPaymentTypeUtil.getInstance().get(gatewayName));
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Successfully Removed payment gateway where store name=");
            stringBuffer.append(storeName);
            stringBuffer.append(" and gateway name=");
            stringBuffer.append(gatewayName);
            var success : String = stringBuffer.toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "delete()");
            }
            return success + "<br/>";
        } catch (e : haxe.Exception) {
            var error : String = "Failed to remove payment gateway from table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "remove()", e);
            }
            return error + "<br/>" + "Exception: " + e + "<br>";
        }
    }

    public function drop() : String {
        try {
            var success : String = PaymentGatewayEntityFactory.getInstance().dropTable();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, this.commonStrings.DROP);
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to drop payment transaction result table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.DROP, e);
            }
            return error;
        }
    }

    public function create() : String {
        try {
            var success : String = PaymentGatewayEntityFactory.getInstance().createTable();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "create()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to create payment transaction result table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "create()", e);
            }
            return error;
        }
    }

    public function restore() : String {
        try {
            final success : String = "Restore Successful";
            final result : String = AbSqlTableUtil.getInstance().restoreTable(PaymentGatewayEntityFactory.getInstance(), this.portion);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "restore()");
            }
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to restore backup";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "restore()", e);
            }
            return error;
        }
    }

    public function backup() : String {
        try {
            final success : String = "Restore Successful";
            final result : String = AbSqlTableUtil.getInstance().backupTable(PaymentGatewayEntityFactory.getInstance());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "backup()");
            }
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to make backup";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "backup()", e);
            }
            return error;
        }
    }

}

