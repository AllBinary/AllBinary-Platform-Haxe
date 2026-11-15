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
package org.allbinary.logic.communication.smtp.event.handler;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.smtp.event.EmailEvent;
import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.communication.smtp.info.EmailInfo;

class UserEmailEventHandler {
    private var emailVector : BasicArrayList;
    private var emailInfo : EmailInfo = null;
    private var userEmailEventNameData : UserEmailEventNameData = null;
    public function new() {
        this.emailVector = new BasicArrayListD();
    }

    // throws Exception
    // synchronized
    public function receiveEmailInfo(userEmailEventNameData : UserEmailEventNameData, emailInfo : EmailInfo) : Void {
        this.userEmailEventNameData = userEmailEventNameData;
        this.emailInfo = emailInfo;
        this.fireEmailEvent();
    }

    // synchronized
    public function addListener(vector : BasicArrayList) : Void {
        final size : Int = vector.size();
        for (index in 0...size) {
            var userEmailEventListenerInterface : UserEmailEventListenerInterface = (cast vector.get(index) : UserEmailEventListenerInterface);
            this.addListener(userEmailEventListenerInterface);
        }
    }

    // synchronized
    public function addListener(emailEventListenerInterface : UserEmailEventListenerInterface) : Void {
        this.emailVector.add(emailEventListenerInterface);
    }

    // synchronized
    public function removeListener(emailEventListenerInterface : UserEmailEventListenerInterface) : Void {
        this.emailVector.remove(emailEventListenerInterface);
    }

    // throws Exception
    // synchronized
    public function fireEmailEvent() : Void {
        var emailEvent : EmailEvent = new EmailEvent(this, this.userEmailEventNameData, this.emailInfo, 0);
        final size : Int = this.emailVector.size();
        for (index in 0...size) {
            var emailEventListenerInterface : UserEmailEventListenerInterface = (cast this.emailVector.get(index) : UserEmailEventListenerInterface);
            emailEventListenerInterface.onEmailSendRequest(emailEvent);
        }
    }

}

