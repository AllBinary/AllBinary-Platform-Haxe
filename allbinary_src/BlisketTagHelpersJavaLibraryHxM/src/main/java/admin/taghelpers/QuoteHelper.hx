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
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFront;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.installer.Portion;
import org.allbinary.business.user.UserInterface;
import org.allbinary.business.user.quoterequest.QuoteRequest;
import org.allbinary.data.tables.user.UserEntityFactory;
import org.allbinary.data.tables.user.quoterequest.QuoteRequestEntity;
import org.allbinary.data.tables.user.quoterequest.QuoteRequestEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler;
import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons;
import org.allbinary.logic.communication.smtp.event.handler.factory.StoreAdminUserEmailEventHandlerSingletons;
import org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons;
import org.allbinary.logic.communication.smtp.info.BasicEmailInfo;
import org.allbinary.logic.communication.smtp.info.EmailInfo;
import org.allbinary.logic.communication.smtp.info.StoreEmailInfo;
import org.allbinary.logic.communication.sql.AbSqlTableUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;

class QuoteHelper extends BasicTable {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private final weblisketSession : WeblisketSession;
    private final storeFrontInterface : StoreFrontInterface = null;
    private final portion : Portion;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        var storeName : String = (cast hashMap.get(StoreFrontData.getInstance().NAME) : String);
        if (storeName != null) {
            this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
        } else {
            this.storeFrontInterface = new StoreFront();
        }
        this.weblisketSession = new WeblisketSession(hashMap, pageContext);
        this.portion = new Portion(hashMap);
    }

    // throws Exception
    private function emailUser(quoteRequest : QuoteRequest) : Void {
        var user : UserInterface = UserEntityFactory.getInstance().getUser(quoteRequest.getUserName());
        var userEmailSubject : String = "Quote Request Receipt";
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("This is just a verification email. ");
        stringBuffer.append("We usually respond to quote request within 24 hours.");
        stringBuffer.append("\n\nThank You For Your Business.");
        var userEmailTextBody : String = Std.string(stringBuffer);
        var basicEmailInfo : BasicEmailInfo = (cast new StoreEmailInfo(this.storeFrontInterface, userEmailSubject, userEmailTextBody) : BasicEmailInfo);
        var emailInfo : EmailInfo = new EmailInfo(basicEmailInfo);
        var userEmailEventHandler : UserEmailEventHandler = UserEmailEventHandlerSingletons.getInstance().getInstance(this.abeClientInformation, UserEmailEventNameData.QUOTEREQUEST, user);
        userEmailEventHandler.receiveEmailInfo(UserEmailEventNameData.QUOTEREQUEST, emailInfo);
    }

    // throws Exception
    private function emailAdmins(quoteRequest : QuoteRequest) : Void {
        var adminEmailSubject : String = "Quote Request";
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("\nUserName: ");
        stringBuffer.append(quoteRequest.getUserName());
        stringBuffer.append("\nProject Info: \n");
        stringBuffer.append(quoteRequest.getProjectInfo());
        stringBuffer.append("\nUser Comments: \n");
        stringBuffer.append(quoteRequest.getUserComments());
        stringBuffer.append("\nBudget: \n");
        stringBuffer.append(quoteRequest.getBudget());
        stringBuffer.append("\nTime Frame: \n");
        stringBuffer.append(quoteRequest.getTimeFrame());
        stringBuffer.append("\nComments: \n");
        stringBuffer.append(quoteRequest.getComments());
        var adminEmailTextBody : String = Std.string(stringBuffer);
        var basicEmailInfo : BasicEmailInfo = (cast new StoreEmailInfo(this.storeFrontInterface, adminEmailSubject, adminEmailTextBody) : BasicEmailInfo);
        var emailInfo : EmailInfo = new EmailInfo(basicEmailInfo);
        var storeAdminUserEmailEventHandler : UserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance().getInstance(this.abeClientInformation, UserEmailEventNameData.QUOTEREQUEST);
        var adminUserEmailEventHandler : UserEmailEventHandler = StoreAdminUserEmailEventHandlerSingletons.getInstance().getInstance(UserEmailEventNameData.QUOTEREQUEST, this.abeClientInformation, this.storeFrontInterface);
        storeAdminUserEmailEventHandler.receiveEmailInfo(UserEmailEventNameData.QUOTEREQUEST, emailInfo);
        adminUserEmailEventHandler.receiveEmailInfo(UserEmailEventNameData.QUOTEREQUEST, emailInfo);
    }

    // throws Exception
    public function email() : String {
        try {
            final quoteRequestEntity : QuoteRequestEntity = QuoteRequestEntityFactory.getInstance().getQuoteRequestEntityInstance();
            final userName : String = this.weblisketSession.getUserName();
            final vector : BasicArrayList = quoteRequestEntity.getIds(userName);
            var id : Int = 0;
            final size : Int = vector.size();
            for (index in 0...size) {
                var nextId : Int = Std.int(((cast vector.get(index) : Null<Int>)));
                if (id < nextId) {
                    id = nextId;
                }
            }
            var quoteRequest : QuoteRequest = quoteRequestEntity.get(userName, id);
            if (quoteRequest != null) {
                this.emailUser(quoteRequest);
                this.emailAdmins(quoteRequest);
                return "Thank You For Your Business.<p/>";
            } else {
                throw new haxe.Exception("No Quote Request");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.FAILURE, this, "email", e);
            }
            return "Thank You For Your Business.<p>";
        }
    }

    public function drop() : String {
        try {
            var success : String = QuoteRequestEntityFactory.getInstance().getQuoteRequestEntityInstance().dropTable();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, this.commonStrings.DROP);
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to drop QuoteRequest table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.DROP, e);
            }
            return error;
        }
    }

    public function create() : String {
        try {
            var success : String = QuoteRequestEntityFactory.getInstance().getQuoteRequestEntityInstance().createTable();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF(success, this, "create()");
            }
            return success;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to create new QuoteRequest table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "create()", e);
            }
            return error;
        }
    }

    public function restore() : String {
        try {
            final success : String = "Restore Successful";
            final result : String = AbSqlTableUtil.getInstance().restoreTable(QuoteRequestEntityFactory.getInstance().getQuoteRequestEntityInstance(), portion);
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
            final result : String = AbSqlTableUtil.getInstance().backupTable(QuoteRequestEntityFactory.getInstance().getQuoteRequestEntityInstance());
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

