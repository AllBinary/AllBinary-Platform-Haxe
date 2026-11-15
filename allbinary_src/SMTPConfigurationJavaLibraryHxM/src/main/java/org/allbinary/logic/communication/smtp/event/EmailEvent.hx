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
package org.allbinary.logic.communication.smtp.event;

//import java.util.EventObject;
import org.allbinary.logic.communication.smtp.info.EmailInfo;
import org.allbinary.logic.string.StringMaker;

class EmailEvent extends EventObject {
    private var emailInfo : EmailInfo;
    private var userEmailEventNameData : UserEmailEventNameData;
    private var attempts : Int = 0;
    public function new(emailEventHandler : Any, userEmailEventNameData : UserEmailEventNameData, emailInfo : EmailInfo, attempts : Int) {
        super(emailEventHandler);
        this.userEmailEventNameData = userEmailEventNameData;
        this.emailInfo = emailInfo;
    }

    public function getEmailInfo() : EmailInfo {
        return this.emailInfo;
    }

    public function getAttempts() : Int {
        return this.attempts;
    }

    public function setAttempts(attempts : Int) : Void {
        this.attempts = attempts;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("EmailEvent Log: \n");
        stringBuffer.append("Event Name: ");
        stringBuffer.append(this.userEmailEventNameData.toString());
        stringBuffer.append(this.getEmailInfo().toString());
        stringBuffer.append("\nNumber of Attempts: ");
        stringBuffer.appendint(this.getAttempts());
        return stringBuffer.toString();
    }

}

