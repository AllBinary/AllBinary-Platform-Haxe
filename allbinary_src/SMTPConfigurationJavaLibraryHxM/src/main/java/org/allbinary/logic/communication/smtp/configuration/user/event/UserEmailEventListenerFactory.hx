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

import org.allbinary.business.user.UserInterface;
import org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface;
import org.allbinary.logic.system.loader.AbeFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

class UserEmailEventListenerFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(abeClientInformation : AbeClientInformationInterface, userEmailEventConfigurationInterface : UserEmailEventConfigurationInterface, userInterface : UserInterface) : UserEmailEventListenerInterface {
        var params : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
        var classes : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
        classes[0] = UserInterface;
        params[0] = (cast userInterface : Any);
        return (cast AbeFactory.getInstance().getInstance(abeClientInformation, userEmailEventConfigurationInterface.getEventListenerClassPath(), classes, params) : UserEmailEventListenerInterface);
    }

}

