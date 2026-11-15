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
package org.allbinary.logic.communication.smtp.email;

import org.allbinary.business.user.UserInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler;
import org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons;
import org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons;
import org.allbinary.logic.communication.smtp.info.AdminEmailInfo;
import org.allbinary.logic.communication.smtp.info.BasicEmailInfo;
import org.allbinary.logic.communication.smtp.info.EmailInfo;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;

class NewPasswordEmail {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final abeClientInformation : AbeClientInformationInterface;
    private var userInterface : UserInterface;
    private var newPassword : String;
    public function new(abeClientInformation : AbeClientInformationInterface, userInterface : UserInterface, newPassword : String) {
        this.abeClientInformation = abeClientInformation;
        this.userInterface = userInterface;
        this.newPassword = newPassword;
    }

    // throws Exception
    public function process() : Void {
        this.notifyStoreAdmin();
        this.notifyUser();
    }

    // throws Exception
    private function notifyStoreAdmin() : Void {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
                this.logUtil.putF("notifyStoreAdmin", this, "notifyStoreAdmin");
            }
            var emailSubject : String = "New Password For User: " + this.userInterface.getUserName();
            var emailBody : String = "New Password: " + this.newPassword;
            var basicEmailInfo : BasicEmailInfo = (cast new AdminEmailInfo(emailSubject, emailBody) : BasicEmailInfo);
            var emailInfo : EmailInfo = new EmailInfo(basicEmailInfo);
            var adminUserEmailEventHandler : UserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance().getInstance(this.abeClientInformation, UserEmailEventNameData.NEWPASSWORD);
            adminUserEmailEventHandler.receiveEmailInfo(UserEmailEventNameData.NEWPASSWORD, emailInfo);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "emailAdmin", e);
            }
        }
    }

    // throws Exception
    private function notifyUser() : Void {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
                this.logUtil.putF("Email User", this, "notifyUser()");
            }
            var subject : String = "New Password";
            var body : String = "New Password: " + this.newPassword;
            var basicEmailInfo : BasicEmailInfo = (cast new AdminEmailInfo(subject, body) : BasicEmailInfo);
            var emailInfo : EmailInfo = new EmailInfo(basicEmailInfo);
            var userEmailEventHandler : UserEmailEventHandler = UserEmailEventHandlerSingletons.getInstance().getInstance(this.abeClientInformation, UserEmailEventNameData.NEWPASSWORD, this.userInterface);
            userEmailEventHandler.receiveEmailInfo(UserEmailEventNameData.NEWPASSWORD, emailInfo);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "notifyUser", e);
            }
            throw e;
        }
    }

}

