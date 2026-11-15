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
import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

interface UserEmailEventsConfigurationInterface {
    function getEventConfigurationHashMap() : HashMap;

    function addUserEmailEventConfiguration(userEmailEventConfigurationInterface : UserEmailEventConfigurationInterface) : Void;

    // throws Exception
    function getEventListener(abeClientInformation : AbeClientInformationInterface, userEmailEventNameData : UserEmailEventNameData, userInterface : UserInterface) : UserEmailEventListenerInterface;

}

