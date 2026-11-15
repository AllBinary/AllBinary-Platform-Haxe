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
package org.allbinary.logic.communication.smtp.configuration.server;

//import java.util.HashMap;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class EmailServerConfiguration implements EmailServerConfigurationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var accountName : String = null;
    private var password : String = null;
    private var smtpServer : String = null;
    public function new() {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, commonStrings.CONSTRUCTOR);
        }
        this.setSmtpServer(StringUtil.getInstance().EMPTY_STRING);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, "EmailServerConfiguration(HashMap)");
        }
        this.setAccountName((cast hashMap.get(EmailServerConfigurationData.ACCOUNT) : String));
        this.setPassword((cast hashMap.get(EmailServerConfigurationData.PASSWORD) : String));
        this.setSmtpServer((cast hashMap.get(EmailServerConfigurationData.SERVER) : String));
        this.log();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(account : String, password : String, server : String) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, "EmailServerConfiguration(HashMap)");
        }
        this.setAccountName(account);
        this.setPassword(password);
        this.setSmtpServer(server);
        this.log();
    }

    public function setSmtpServer(value : String) : Void {
        this.smtpServer = value;
    }

    public function getSmtpServer() : String {
        return this.smtpServer;
    }

    public function getAccountName() : String {
        return this.accountName;
    }

    public function setAccountName(accountName : String) : Void {
        this.accountName = accountName;
    }

    public function getPassword() : String {
        return this.password;
    }

    public function setPassword(password : String) : Void {
        this.password = password;
    }

    public function log() : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF(this.toString(), this, "EmailServerConfiguration");
        }
    }

    public function toString() : String {
        return "Email Server Configuration:\n" + "Smtp Server: \n" + this.getSmtpServer() + "\nAccount Name: " + this.getAccountName() + "\nPassword: " + this.getPassword();
    }

}

