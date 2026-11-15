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
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.address.StreetAddress;
import org.allbinary.data.tables.user.address.billing.BillingAddressesEntityFactory;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity;
import org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlTableUtil;
import org.allbinary.logic.string.StringUtil;

class ShippingAddressHelper extends BasicTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final stringUtil : StringUtil = StringUtil.getInstance();
    private var weblisketSession : WeblisketSession;
    private var request : HttpServletRequest;
    private var userName : String = null;
    private var streetAddress : StreetAddress = null;
    private final portion : Portion;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        this.weblisketSession = new WeblisketSession(hashMap, pageContext);
        this.portion = new Portion(hashMap);
        this.getAddressForm();
    }

    private function getAddressForm() : Void {
        this.userName = this.request.getParameter(UserData.USERNAME);
        if (this.userName == null) {
            this.userName = this.request.getParameter(WeblisketSessionData.REMOVABLEUSERNAME);
        }
        this.streetAddress = new StreetAddress(this.request);
    }

    public function drop() : String {
        try {
            var success : String = new ShippingAddressesEntity(this.stringUtil.EMPTY_STRING).drop();
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
            var success : String = new ShippingAddressesEntity(this.stringUtil.EMPTY_STRING).createTable();
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
            final result : String = AbSqlTableUtil.getInstance().restoreTable(new ShippingAddressesEntity(StringUtil.getInstance().EMPTY_STRING), portion);
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
            final result : String = AbSqlTableUtil.getInstance().backupTable(new ShippingAddressesEntity(StringUtil.getInstance().EMPTY_STRING));
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

    public function insert() : String {
        try {
            var success : String = "Successfully Added Shipping Address";
            ShippingAddressesEntityFactory.getInstance().getInstance(this.weblisketSession.getUserName()).add(this.streetAddress);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "insert");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add Shipping streetAddress";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "insert", e);
            }
            return error;
        }
    }

    public function update() : String {
        try {
            var success : String = "Successfully Updated Shipping Address";
            ShippingAddressesEntityFactory.getInstance().getInstance(this.weblisketSession.getUserName()).update(this.streetAddress);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("Successfull update of a Users Shipping Address table", this, "update()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed update of a Users Shipping Address Table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update", e);
            }
            return error;
        }
    }

    private function setToBillingAddress() : String {
        try {
            var streetAddress : StreetAddress = BillingAddressesEntityFactory.getInstance().getInstance(this.weblisketSession.getUserName()).getDefault();
            if (streetAddress != null) {
                ShippingAddressesEntityFactory.getInstance().getInstance(this.weblisketSession.getUserName()).add(streetAddress);
            } else {
                return "No Billing Address";
            }
            return StringUtil.getInstance().EMPTY_STRING;
        } catch (e : haxe.Exception) {
            var error : String = "Failed Setting Shipping address to Billing Address";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setToBillingAddress()", e);
            }
            return error;
        }
    }

    public function delete() : String {
        try {
            var success : String = "Successfully Removed Shipping Address";
            ShippingAddressesEntityFactory.getInstance().getInstance(this.weblisketSession.getUserName()).remove(this.streetAddress.getId());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "remove()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to remove Shipping Address";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "remove()", e);
            }
            return error;
        }
    }

    public function set() : String {
        try {
            var success : String = "Successfully Set Shipping Address";
            ShippingAddressesEntityFactory.getInstance().getInstance(this.weblisketSession.getUserName()).setDefault(this.streetAddress.getId());
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "set()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set Shipping Address";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "set()", e);
            }
            return error;
        }
    }

}

