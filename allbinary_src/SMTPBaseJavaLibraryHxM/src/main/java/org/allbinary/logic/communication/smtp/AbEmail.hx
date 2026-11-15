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
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class AbEmail implements EmailInterface {
    private var email : Email = null;
    public function new(server : String, from : String, to : String, subject : String, textBody : String, htmlAttachment : String, contentBase : String) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
            this.email = new Email(from, to, subject, server, textBody, htmlAttachment, contentBase, true);
        } else {
            this.email = new Email(from, to, subject, server, textBody, htmlAttachment, contentBase);
        }
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

    public function getEmail() : Email {
        return (cast this.email : Email);
    }

    // throws Exception
    public function toXmlDoc() : Document {
        return this.email.toXmlDoc();
    }

}

