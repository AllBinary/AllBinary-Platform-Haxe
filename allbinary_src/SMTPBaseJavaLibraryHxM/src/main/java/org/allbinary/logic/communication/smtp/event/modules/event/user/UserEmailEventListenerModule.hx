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
package org.allbinary.logic.communication.smtp.event.modules.event.user;

import org.allbinary.business.user.UserInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.BasicEmail;
import org.allbinary.logic.communication.smtp.EmailInterface;
import org.allbinary.logic.communication.smtp.event.EmailEvent;
import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface;
import org.allbinary.logic.communication.smtp.queue.EmailQueueFactory;

class UserEmailEventListenerModule implements UserEmailEventListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var userInterface : UserInterface;
    public function new(userInterface : UserInterface) {
        this.userInterface = userInterface;
    }

    // throws Exception
    public function onEmailSendFailure(emailEvent : EmailEvent) : Void {
        var to : String = this.userInterface.getSecondaryEmail();
        var email : BasicEmail = new BasicEmail(emailEvent.getEmailInfo(), to);
        EmailQueueFactory.getInstance().offer((cast email.getEmail() : EmailInterface));
    }

    // throws Exception
    public function onEmailSendRequest(emailEvent : EmailEvent) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF("Add Email To Que For Sending: " + Std.string(emailEvent), this, "onEmailSendRequest");
        }
        var to : String = this.userInterface.getMainEmail();
        var email : BasicEmail = new BasicEmail(emailEvent.getEmailInfo(), to);
        EmailQueueFactory.getInstance().offer((cast email.getEmail() : EmailInterface));
    }

}

