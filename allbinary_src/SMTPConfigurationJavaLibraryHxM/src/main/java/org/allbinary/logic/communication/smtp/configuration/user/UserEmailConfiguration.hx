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
package org.allbinary.logic.communication.smtp.configuration.user;

//import java.util.HashMap;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfiguration;
import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface;
import org.allbinary.string.CommonStrings;

class UserEmailConfiguration implements UserEmailConfigurationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var userEmailEventsConfigurationInterface : UserEmailEventsConfigurationInterface = null;
    public function new() {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, this.commonStrings.CONSTRUCTOR);
        }
        this.setUserEmailEventsConfigurationInterface(new UserEmailEventsConfiguration());
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, this.commonStrings.CONSTRUCTOR);
        }
        this.setUserEmailEventsConfigurationInterface(new UserEmailEventsConfiguration(hashMap));
    }

    public function getUserEmailEventsConfigurationInterface() : UserEmailEventsConfigurationInterface {
        return this.userEmailEventsConfigurationInterface;
    }

    public function setUserEmailEventsConfigurationInterface(userEmailEventsConfigurationInterface : UserEmailEventsConfigurationInterface) : Void {
        this.userEmailEventsConfigurationInterface = userEmailEventsConfigurationInterface;
    }

}

