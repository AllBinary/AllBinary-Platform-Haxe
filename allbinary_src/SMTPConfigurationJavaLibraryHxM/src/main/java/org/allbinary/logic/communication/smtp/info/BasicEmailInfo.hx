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
package org.allbinary.logic.communication.smtp.info;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class BasicEmailInfo {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var subject : String;
    private var textBody : String;
    public var emailServerConfigurationInterface : EmailServerConfigurationInterface = null;
    public function new(subject : String, textBody : String) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, commonStrings.CONSTRUCTOR);
        }
        this.subject = subject;
        this.textBody = textBody;
    }

    public function getSubject() : String {
        return this.subject;
    }

    public function getTextBody() : String {
        return this.textBody;
    }

    public function getEmailServerConfigurationInterface() : EmailServerConfigurationInterface {
        return this.emailServerConfigurationInterface;
    }

    public function setEmailServerConfigurationInterface(emailServerConfigurationInterface : EmailServerConfigurationInterface) : Void {
        this.emailServerConfigurationInterface = emailServerConfigurationInterface;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Std.string(this.getEmailServerConfigurationInterface()));
        stringBuffer.append(CommonSeps.getInstance().NEW_LINE);
        stringBuffer.append("Subject: \n");
        stringBuffer.append(this.getSubject());
        stringBuffer.append("\nText Body: \n");
        stringBuffer.append(this.getTextBody());
        return Std.string(stringBuffer);
    }

    // throws Exception
    public function init() : Void {
        throw new haxe.Exception();
    }

}

