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
package org.allbinary.logic.communication.smtp.event.handler;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.UserInterface;
import org.allbinary.business.user.modules.configuration.UserConfigurationInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.configuration.user.UserEmailConfigurationInterface;
import org.allbinary.logic.communication.smtp.configuration.user.event.UserEmailEventsConfigurationInterface;
import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.communication.smtp.event.modules.log.LogUserEmailEventListenerModule;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

class EmailEventHandlerUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : EmailEventHandlerUtil = new EmailEventHandlerUtil();
    public static function getInstance() : EmailEventHandlerUtil {
        return EmailEventHandlerUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getEventHandler(abeClientInformation : AbeClientInformationInterface, userEmailEventNameData : UserEmailEventNameData, userVector : BasicArrayList) : UserEmailEventHandler {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Returning UserEmailEventHandler for ");
            stringBuffer.appendint(userVector.size());
            stringBuffer.append(" users.");
            this.logUtil.putF(Std.string(stringBuffer), this, "getEventHandler");
        }
        final userEmailEventHandler : UserEmailEventHandler = new UserEmailEventHandler();
        userEmailEventHandler.addListener(new LogUserEmailEventListenerModule());
        var size : Int = userVector.size();
        for (index in 0...size) {
            final userInterface : UserInterface = (cast userVector.get(index) : UserInterface);
            final vector : BasicArrayList = EmailEventHandlerUtil.getUserEmailEventListenerVector(abeClientInformation, userEmailEventNameData, userInterface);
            userEmailEventHandler.addListener(vector);
        }
        return userEmailEventHandler;
    }

    // throws Exception
    public static function getUserEmailEventListenerVector(abeClientInformation : AbeClientInformationInterface, userEmailEventNameData : UserEmailEventNameData, userInterface : UserInterface) : BasicArrayList {
        final userConfigurationInterface : UserConfigurationInterface = userInterface.getUserConfigurationInterface();
        final userEmailConfigurationInterface : UserEmailConfigurationInterface = userConfigurationInterface.getUserEmailConfigurationInterface();
        final userEmailEventsConfigurationInterface : UserEmailEventsConfigurationInterface = userEmailConfigurationInterface.getUserEmailEventsConfigurationInterface();
        final userEmailEventListenerInterface : UserEmailEventListenerInterface = userEmailEventsConfigurationInterface.getEventListener(abeClientInformation, userEmailEventNameData, userInterface);
        final vector : BasicArrayList = new BasicArrayListD();
        vector.add(userEmailEventListenerInterface);
        return vector;
    }

}

