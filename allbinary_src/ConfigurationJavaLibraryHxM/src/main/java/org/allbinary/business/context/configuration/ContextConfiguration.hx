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
package org.allbinary.business.context.configuration;

//import java.util.HashMap;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfiguration;
import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface;
import org.allbinary.string.CommonStrings;

class ContextConfiguration implements ContextConfigurationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var emailServerConfigurationInterface : EmailServerConfigurationInterface = null;
    public function new() {
        this.logUtil.putF(this.commonStrings.START, this, "ContextConfiguration");
        this.setEmailServerConfigurationInterface((cast new EmailServerConfiguration() : EmailServerConfigurationInterface));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.logUtil.putF(this.commonStrings.START, this, "ContextConfiguration(HashMap)");
        this.setEmailServerConfigurationInterface((cast new EmailServerConfiguration(hashMap) : EmailServerConfigurationInterface));
    }

    public function getEmailServerConfigurationInterface() : EmailServerConfigurationInterface {
        return this.emailServerConfigurationInterface;
    }

    public function setEmailServerConfigurationInterface(emailServerConfigurationInterface : EmailServerConfigurationInterface) : Void {
        this.emailServerConfigurationInterface = emailServerConfigurationInterface;
    }

}

