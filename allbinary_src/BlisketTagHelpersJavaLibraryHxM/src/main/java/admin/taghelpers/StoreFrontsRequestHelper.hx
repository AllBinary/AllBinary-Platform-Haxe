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
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFront;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.installer.Portion;
import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler;
import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons;
import org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons;
import org.allbinary.logic.communication.smtp.info.AdminEmailInfo;
import org.allbinary.logic.communication.smtp.info.BasicEmailInfo;
import org.allbinary.logic.communication.smtp.info.EmailInfo;
import org.allbinary.logic.communication.smtp.info.StoreEmailInfo;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;

class StoreFrontsRequestHelper extends ModifyTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private final pageContext : PageContext;
    private final request : HttpServletRequest;
    private final weblisketSession : WeblisketSession;
    private var storeName : String = null;
    private var modifyingStoreFrontInterface : StoreFrontInterface = null;
    private final portion : Portion;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.pageContext = pageContext;
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        this.weblisketSession = new WeblisketSession(hashMap, pageContext);
        this.portion = new Portion(hashMap);
        this.getFormData();
    }

    // throws Exception
    private function getFormData() : Void {
        this.storeName = this.weblisketSession.getStoreName();
        this.modifyingStoreFrontInterface = (cast new StoreFront(this.request) : StoreFrontInterface);
    }

    public function update() : String {
        try {
            var success : String = "Updated Successfully";
            var hashMapData : HashMap = this.modifyingStoreFrontInterface.toHashMap();
            StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance().update(hashMapData);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "update()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to update storefronts table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

    // throws Exception
    public function sendStoreCreatedEmails() : Void {
        var storeManagerEmailSubject : String = "Store Manager Nofification For Store: " + this.modifyingStoreFrontInterface.getName();
        var adminEmailSubject : String = "Admin Notification For Store: " + this.modifyingStoreFrontInterface.getName();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Store Created: ");
        stringBuffer.append(this.modifyingStoreFrontInterface.getName());
        stringBuffer.append("\n\n");
        stringBuffer.append("Click here for the Admin Interface:\n");
        stringBuffer.append(this.modifyingStoreFrontInterface.getCurrentHomeHostName());
        stringBuffer.append("/admin/login.jsp\n\n");
        stringBuffer.append("Goto Your Store:\n");
        stringBuffer.append(this.modifyingStoreFrontInterface.getCurrentHomeHostName());
        stringBuffer.append(this.modifyingStoreFrontInterface.getName());
        stringBuffer.append("/index.jsp");
        stringBuffer.append("\n\n");
        stringBuffer.append("UserName: ");
        stringBuffer.append(this.weblisketSession.getUserName());
        var adminEmailTextBody : String = stringBuffer.toString();
        var adminBasicEmailInfo : BasicEmailInfo = (cast new AdminEmailInfo(adminEmailSubject, adminEmailTextBody) : BasicEmailInfo);
        var storeAdminBasicEmailInfo : BasicEmailInfo = (cast new StoreEmailInfo(this.modifyingStoreFrontInterface, storeManagerEmailSubject, adminEmailTextBody) : BasicEmailInfo);
        var storeAdminEmailInfo : EmailInfo = new EmailInfo(storeAdminBasicEmailInfo);
        var adminEmailInfo : EmailInfo = new EmailInfo(adminBasicEmailInfo);
        var adminUserEmailEventHandler : UserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance().getInstance(this.abeClientInformation, UserEmailEventNameData.STORECREATED);
        var storeAdminUserEmailEventHandler : UserEmailEventHandler = StoreAdminUserEmailEventHandlerSingletons.getInstance().getInstance(UserEmailEventNameData.STORECREATED, this.abeClientInformation, this.modifyingStoreFrontInterface);
        storeAdminUserEmailEventHandler.receiveEmailInfo(UserEmailEventNameData.STORECREATED, storeAdminEmailInfo);
        adminUserEmailEventHandler.receiveEmailInfo(UserEmailEventNameData.STORECREATED, adminEmailInfo);
    }

    // synchronized
    public function install() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Intall StoreFront Successfully: ");
            stringBuffer.appendint(Std.int(Std.int(this.portion.getCurrent())));
            stringBuffer.append(" of ");
            stringBuffer.appendint(Std.int(Std.int(this.portion.getTotal())));
            var success : String = stringBuffer.toString();
            this.modifyingStoreFrontInterface.install(Std.int(this.portion.getCurrent()), Std.int(this.portion.getTotal()));
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "install()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to Install storefront";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "install()", e);
            }
            return error;
        }
    }

    // synchronized
    public function insert() : String {
        try {
            var success : String = "Added Successfully";
            var values : BasicArrayList = this.modifyingStoreFrontInterface.toVector();
            StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance().insert(values);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "insert()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add storefront";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "insert()", e);
            }
            return error;
        }
    }

    public function delete() : String {
        try {
            var success : String = "Delete Successfully";
            StoreFrontsEntityFactory.getInstance().getStoreFrontsEntityInstance().delete(this.storeName);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "delete()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to delete storefronts table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "delete()", e);
            }
            return error;
        }
    }

}

