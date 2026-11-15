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
//import javax.servlet.jsp.PageContext;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler;
import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons;
import org.allbinary.logic.communication.smtp.info.AdminEmailInfo;
import org.allbinary.logic.communication.smtp.info.BasicEmailInfo;
import org.allbinary.logic.communication.smtp.info.EmailInfo;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;

class BasicTextEmailHelper extends TagHelper {
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var hashMap : HashMap;
    private var pageContext : PageContext;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.pageContext = pageContext;
        this.hashMap = hashMap;
    }

    // throws Exception
    public function send() : Void {
        var adminEmailSubject : String = (cast this.hashMap.get("Subject") : String);
        var adminEmailTextBody : String = (cast this.hashMap.get("Body") : String);
        var adminBasicEmailInfo : BasicEmailInfo = (cast new AdminEmailInfo(adminEmailSubject, adminEmailTextBody) : BasicEmailInfo);
        var adminEmailInfo : EmailInfo = new EmailInfo(adminBasicEmailInfo);
        var adminUserEmailEventHandler : UserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance().getInstance(this.abeClientInformation, UserEmailEventNameData.INSTALLER);
        adminUserEmailEventHandler.receiveEmailInfo(UserEmailEventNameData.INSTALLER, adminEmailInfo);
    }

}

