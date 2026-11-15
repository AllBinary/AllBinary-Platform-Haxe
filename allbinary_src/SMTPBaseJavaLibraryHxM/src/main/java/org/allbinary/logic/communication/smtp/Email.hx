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

//import java.io.ByteArrayOutputStream;
//import java.io.PrintStream;
//import java.util.HashMap;
//import java.util.Properties;
//import javax.mail.Address;
//import javax.mail.Authenticator;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Session;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.InternetHeaders;
//import javax.mail.internet.MimeBodyPart;
//import javax.mail.internet.MimeMessage;
//import javax.mail.internet.MimeMultipart;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class Email implements EmailInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var msg : MimeMessage = null;
    private var properties : Properties = null;
    private var bs : ByteArrayOutputStream = null;
    private var isDebug : Bool;
    private static final DEBUG : String = "mail.debug";
    private static final SMTP_HOST : String = "mail.smtp.host";
    private static final SMTP_PORT : String = "mail.smtp.port";
    private static final SMTP_USER : String = "mail.smtp.user";
    private static final SMTP_RETURN_ADDRESS : String = "mail.from";
    private static final SMTP_LOCAL_HOST : String = "mail.smtp.localhost";
    public function new(from : String, to : String, subject : String, server : String, textBody : String, htmlAttachment : String, contentBase : String) {
        this.isDebug = false;
        this.init(from, to, subject, server, textBody, htmlAttachment, contentBase);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(from : String, to : String, subject : String, server : String, textBody : String, htmlAttachment : String, contentBase : String, isDebug : Bool) {
        this.isDebug = isDebug;
        this.init(from, to, subject, server, textBody, htmlAttachment, contentBase);
    }

    // throws Exception
    public function init(from : String, to : String, subject : String, server : String, textBody : String, htmlAttachment : String, contentBase : String) : Void {
        try {
            var stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            var mimeBodyParts : haxe.ds.Vector<MimeBodyPart> = haxe.ds.Vector.fromArrayCopy([for (index in 0...(!stringValidationUtil.isEmpty(htmlAttachment) ? 2 : 1)) null]);
            mimeBodyParts[0] = new MimeBodyPart();
            mimeBodyParts[0].setText(textBody);
            if (!stringValidationUtil.isEmpty(htmlAttachment)) {
                var internetHeaders : InternetHeaders = new InternetHeaders();
                internetHeaders.addHeader("Content-Type", "text/html");
                if (!stringValidationUtil.isEmpty(contentBase)) {
                    internetHeaders.addHeader("Content-Base", contentBase);
                }
                mimeBodyParts[1] = new MimeBodyPart(internetHeaders, haxe.io.Bytes.ofString(htmlAttachment));
            }
            this.init(server, (cast null : Authenticator), haxe.ds.Vector.fromArrayCopy([new InternetAddress(from)]), haxe.ds.Vector.fromArrayCopy([new InternetAddress(to)]), (cast null : haxe.ds.Vector<InternetAddress>), (cast null : haxe.ds.Vector<InternetAddress>), subject, mimeBodyParts);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "emailConstructor", e);
            }
            throw e;
        }
    }

    // throws MessagingException
    public function init(server : String, authenticator : Authenticator, addresses_from : haxe.ds.Vector<InternetAddress>, addresses_to : haxe.ds.Vector<InternetAddress>, addresses_cc : haxe.ds.Vector<InternetAddress>, addresses_bcc : haxe.ds.Vector<InternetAddress>, subject : String, mimeBodyParts : haxe.ds.Vector<MimeBodyPart>) : Void {
        this.properties = new Properties();
        this.properties.put(Email.SMTP_HOST, server);
        try {
            var hostName : String = StringUtil.getInstance().EMPTY_STRING;
            if (StringValidationUtil.getInstance().isEmpty(hostName)) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
                    this.logUtil.putF("Unable to get HostName so using fake", this, "init()");
                }
                this.properties.put(Email.SMTP_LOCAL_HOST, "FakeHostName");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
                this.logUtil.put("Continuing on Exception: Unable to get HostName", this, "init()", e);
            }
            this.properties.put(Email.SMTP_LOCAL_HOST, "FakeHostName");
        }
        if (this.isDebug) {
            this.properties.put(Email.DEBUG, "true");
        }
        var session : Session = Session.getInstance(this.properties, authenticator);
        if (this.isDebug) {
            session.setDebug(true);
            this.bs = new ByteArrayOutputStream();
            var printStream : PrintStream = new PrintStream(this.bs);
            session.setDebugOut(printStream);
        }
        this.msg = new MimeMessage(session);
        this.msg.addFrom(addresses_from);
        this.msg.setRecipients(Message.RecipientType.TO, addresses_to);
        this.msg.setRecipients(Message.RecipientType.CC, addresses_cc);
        this.msg.setRecipients(Message.RecipientType.BCC, addresses_bcc);
        this.msg.setSubject(subject);
        var mimeMultipart : MimeMultipart = new MimeMultipart();
        for (i in 0...mimeBodyParts.length) {
            mimeMultipart.addBodyPart(mimeBodyParts[i]);
        }
        this.msg.setContent(mimeMultipart);
    }

    public function getMimeMessage() : MimeMessage {
        return this.msg;
    }

    public function getDebugInfo() : String {
        if (this.isDebug) {
            return "More Logging Before This To Standard Out: " + Std.string(this.bs);
        } else {
            return "Debugging Is Off";
        }
    }

    // throws Exception
    public function log() : String {
        return "\nHashMap: " + Std.string(this.toHashMap());
    }

    // throws Exception
    public function toHashMap() : HashMap {
        try {
            var hashMap : HashMap = StdUtil.getInstance().createHashMap();
            hashMap.put(EmailData.SERVER, (cast this.properties.get(Email.SMTP_HOST) : String));
            var addresses : haxe.ds.Vector<Address> = this.msg.getFrom();
            if (addresses != null) {
                for (index in 0...addresses.length) {
                    hashMap.put(EmailData.FROM, Std.string(addresses[index]));
                }
            }
            addresses = this.msg.getRecipients(Message.RecipientType.TO);
            if (addresses != null) {
                for (index in 0...addresses.length) {
                    hashMap.put(EmailData.TO, Std.string(addresses[index]));
                }
            }
            addresses = this.msg.getRecipients(Message.RecipientType.CC);
            if (addresses != null) {
                for (index in 0...addresses.length) {
                    hashMap.put(EmailData.CC, Std.string(addresses[index]));
                }
            }
            addresses = this.msg.getRecipients(Message.RecipientType.BCC);
            if (addresses != null) {
                for (index in 0...addresses.length) {
                    hashMap.put(EmailData.BCC, Std.string(addresses[index]));
                }
            }
            hashMap.put(EmailData.SUBJECT, this.msg.getSubject());
            var mimeMultipart : MimeMultipart = (cast msg.getContent() : MimeMultipart);
            if (mimeMultipart != null) {
                for (index in 0...mimeMultipart.getCount()) {
                    var content : String = (cast mimeMultipart.getBodyPart(index).getContent() : String);
                    hashMap.put(EmailData.CONTENT, content);
                }
            }
            return hashMap;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "toHashMap()", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        final node : Node = ModDomHelper.createNameValueNodes(document, EmailData.NAME, this.toHashMap());
        return node;
    }

    // throws Exception
    public function toXmlDoc() : Document {
        throw new haxe.Exception(CommonStrings.getInstance().NOT_IMPLEMENTED);
    }

}

