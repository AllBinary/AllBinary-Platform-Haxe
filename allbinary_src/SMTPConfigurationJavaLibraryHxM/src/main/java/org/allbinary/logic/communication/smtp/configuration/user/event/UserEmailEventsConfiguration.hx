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
import org.allbinary.business.user.UserInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;

class UserEmailEventsConfiguration implements UserEmailEventsConfigurationInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var emailEventHashMap : HashMap = null;
    public function new() {
        this.init();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.init();
    }

    private function init() : Void {
        this.emailEventHashMap = StdUtil.getInstance().createHashMap();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF(this.commonStrings.CONSTRUCTOR, this, " Constructor");
        }
    }

    public function getEventConfigurationHashMap() : HashMap {
        return this.emailEventHashMap;
    }

    public function addUserEmailEventConfiguration(userEmailEventConfigurationInterface : UserEmailEventConfigurationInterface) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF("Adding: " + userEmailEventConfigurationInterface.log(), this, "addUserEmailEventConfiguration");
        }
        this.emailEventHashMap.put(userEmailEventConfigurationInterface.getName(), userEmailEventConfigurationInterface);
    }

    // throws Exception
    public function getEventListener(abeClientInformation : AbeClientInformationInterface, userEmailEventNameData : UserEmailEventNameData, userInterface : UserInterface) : UserEmailEventListenerInterface {
        final userEmailEventConfigurationInterface : UserEmailEventConfigurationInterface = (cast this.emailEventHashMap.get(Std.string(userEmailEventNameData)) : UserEmailEventConfigurationInterface);
        return UserEmailEventListenerFactory.getInstance(abeClientInformation, userEmailEventConfigurationInterface, userInterface);
    }

}

