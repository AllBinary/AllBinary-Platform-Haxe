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
import org.allbinary.business.user.commerce.money.payment.PaymentFactory;
import org.allbinary.business.user.commerce.money.payment.PaymentInterface;
import org.allbinary.data.tables.user.commerce.money.payment.PaymentEntity;
import org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlTableUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class PaymentHelper extends Table {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var weblisketSession : WeblisketSession;
    private var request : HttpServletRequest;
    private var value : String = null;
    private final portion : Portion;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        this.weblisketSession = new WeblisketSession(hashMap, pageContext);
        this.portion = new Portion(hashMap);
        this.getFormData();
    }

    private function getFormData() : Void {
        this.value = this.request.getParameter("VALUE");
    }

    public function insert() : String {
        try {
            var success : String = "Successfully Added Payment";
            var paymentEntity : PaymentEntity = PaymentEntityFactory.getInstance().getPaymentEntityInstance();
            var paymentInterface : PaymentInterface = PaymentFactory.getInstance(this.request);
            paymentEntity.add(this.weblisketSession.getUserName(), paymentInterface);
            paymentEntity.setDefault(this.weblisketSession.getUserName(), paymentEntity.getLastId(this.weblisketSession.getUserName()));
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "addPayment()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add Payment";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "addPayment()", e);
            }
            return error;
        }
    }

    public function select() : String {
        try {
            var success : String = "Successfully Selected Payment";
            var paymentEntity : PaymentEntity = PaymentEntityFactory.getInstance().getPaymentEntityInstance();
            paymentEntity.setDefault(this.weblisketSession.getUserName(), this.value);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "selectPayment()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to select Payment";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "selectPayment()", e);
            }
            return error;
        }
    }

    public function delete() : String {
        try {
            var success : String = "Successfully Removed Payment";
            var paymentEntity : PaymentEntity = PaymentEntityFactory.getInstance().getPaymentEntityInstance();
            paymentEntity.remove(this.weblisketSession.getUserName(), this.value);
            var paymentInterface : PaymentInterface = paymentEntity.getDefault(this.weblisketSession.getUserName());
            if (paymentInterface == null) {
                paymentEntity.setDefault(this.weblisketSession.getUserName(), paymentEntity.getLastId(this.weblisketSession.getUserName()));
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "removePayment()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to remove Payment";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "removePayment()", e);
            }
            return error;
        }
    }

    public function drop() : String {
        try {
            var paymentEntity : PaymentEntity = PaymentEntityFactory.getInstance().getPaymentEntityInstance();
            var success : String = paymentEntity.dropTable();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, this.commonStrings.DROP);
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to drop Admin table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.DROP, e);
            }
            return error;
        }
    }

    public function create() : String {
        try {
            var paymentEntity : PaymentEntity = PaymentEntityFactory.getInstance().getPaymentEntityInstance();
            var success : String = paymentEntity.createTable();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "create()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to create user table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "create()", e);
            }
            return error;
        }
    }

    public function restore() : String {
        try {
            final success : String = "Restore Successful";
            final result : String = AbSqlTableUtil.getInstance().restoreTable(PaymentEntityFactory.getInstance().getPaymentEntityInstance(), portion);
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
            final success : String = "Backup Successful";
            final result : String = AbSqlTableUtil.getInstance().backupTable(PaymentEntityFactory.getInstance().getPaymentEntityInstance());
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

    // throws LicensingException
    public function update() : String {
        return commonStrings.NOT_IMPLEMENTED;
    }

}

