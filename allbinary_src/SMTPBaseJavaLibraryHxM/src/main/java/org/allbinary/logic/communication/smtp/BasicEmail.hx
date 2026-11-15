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
package org.allbinary.logic.communication.smtp;

//import java.util.HashMap;
//import javax.mail.internet.MimeMessage;
import org.allbinary.logic.communication.smtp.info.BasicEmailInfo;
import org.allbinary.logic.communication.smtp.info.EmailInfo;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicEmail implements EmailInterface {
    private var email : AbEmail;
    public function new(emailInfo : EmailInfo, to : String) {
        var basicEmailInfo : BasicEmailInfo = emailInfo.getBasicEmailInfo();
        this.email = new AbEmail(basicEmailInfo.getEmailServerConfigurationInterface().getSmtpServer(), basicEmailInfo.getEmailServerConfigurationInterface().getAccountName(), to, basicEmailInfo.getSubject(), basicEmailInfo.getTextBody(), emailInfo.getHtmlAttachment(), emailInfo.getContentBase());
    }

    public function getEmail() : Email {
        return (cast this.email.getEmail() : Email);
    }

    public function getMimeMessage() : MimeMessage {
        return this.email.getMimeMessage();
    }

    public function getDebugInfo() : String {
        return this.email.getDebugInfo();
    }

    // throws Exception
    public function log() : String {
        return this.email.log();
    }

    // throws Exception
    public function toHashMap() : HashMap {
        return this.email.toHashMap();
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        return this.email.toXmlNode(document);
    }

    // throws Exception
    public function toXmlDoc() : Document {
        return this.email.toXmlDoc();
    }

}

