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
package org.allbinary.logic.communication.smtp.event.modules.log;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.event.EmailEvent;
import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface;

class LogUserEmailEventListenerModule implements UserEmailEventListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function onEmailSendRequest(userEmailInfoEvent : EmailEvent) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            var message : String = "Logging EmailEvent - Temporary Listener for debugging.\n\n" + userEmailInfoEvent.toString();
            this.logUtil.putF(message, this, "onEmailSendRequest");
        }
    }

}

