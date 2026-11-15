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
package org.allbinary.business.user.modules.configuration;

//import java.util.HashMap;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.time.created.TimeCreated;
import org.allbinary.business.time.modified.TimeLastModified;
import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfiguration;
import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface;

class UserConfiguration implements UserConfigurationInterface {
    private var userEmailConfigurationInterface : UserEmailConfigurationInterface;
    private var timeCreated : TimeCreated;
    private var timeLastModified : TimeLastModified;
    public function new() {
        this.userEmailConfigurationInterface = (cast new UserEmailConfiguration() : UserEmailConfigurationInterface);
        this.timeCreated = new TimeCreated(0);
        this.timeLastModified = new TimeLastModified(0);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.userEmailConfigurationInterface = (cast new UserEmailConfiguration(hashMap) : UserEmailConfigurationInterface);
        this.timeCreated = new TimeCreated((cast hashMap.get(EntryData.getInstance().TIMECREATED) : String));
        this.timeLastModified = new TimeLastModified((cast hashMap.get(EntryData.getInstance().LASTMODIFIED) : String));
    }

    public function getUserEmailConfigurationInterface() : UserEmailConfigurationInterface {
        return this.userEmailConfigurationInterface;
    }

    public function setUserEmailConfigurationInterface(userEmailConfigurationInterface : UserEmailConfigurationInterface) : Void {
        this.userEmailConfigurationInterface = userEmailConfigurationInterface;
    }

    public function getTimeCreated() : TimeCreated {
        return this.timeCreated;
    }

    public function getTimeLastModified() : TimeLastModified {
        return this.timeLastModified;
    }

    public function setTimeCreated(timeCreated : TimeCreated) : Void {
        this.timeCreated = timeCreated;
    }

    public function setTimeLastModified(timeLastModified : TimeLastModified) : Void {
        this.timeLastModified = timeLastModified;
    }

}

