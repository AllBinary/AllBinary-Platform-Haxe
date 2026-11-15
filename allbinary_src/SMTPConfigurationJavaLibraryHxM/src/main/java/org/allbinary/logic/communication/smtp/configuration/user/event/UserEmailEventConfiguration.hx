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
package org.allbinary.logic.communication.smtp.configuration.user.event;

//import java.util.HashMap;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;

class UserEmailEventConfiguration implements UserEmailEventConfigurationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var name : String = null;
    private var eventListenerClassPath : String = null;
    public function new() {
        this.setName(StringUtil.getInstance().EMPTY_STRING);
        this.setEventListenerClassPath(StringUtil.getInstance().EMPTY_STRING);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF("New", this, " Constructor");
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.setName((cast hashMap.get(UserEmailEventConfigurationData.NAME) : String));
        this.setEventListenerClassPath((cast hashMap.get(UserEmailEventConfigurationData.LISTENER_CLASSPATH) : String));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF("Log: " + this.log(), this, " Constructor");
        }
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    public function getEventListenerClassPath() : String {
        return this.eventListenerClassPath;
    }

    public function setEventListenerClassPath(eventListenerClassPath : String) : Void {
        this.eventListenerClassPath = eventListenerClassPath;
    }

    public function log() : String {
        return "\nUser Email Event Log Info:" + "\nName: " + this.getName() + "\nEventListenerClassPath: " + this.getEventListenerClassPath();
    }

}

