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
package org.allbinary.logic.communication.smtp.event.handler.factory;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.user.UserInterface;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.event.UserEmailEventNameData;
import org.allbinary.logic.communication.smtp.event.handler.EmailEventHandlerUtil;
import org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler;
import org.allbinary.logic.communication.smtp.event.modules.log.LogUserEmailEventListenerModule;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonStrings;

class UserEmailEventHandlerSingletons {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : UserEmailEventHandlerSingletons = new UserEmailEventHandlerSingletons();
    public static function getInstance() : UserEmailEventHandlerSingletons {
        return UserEmailEventHandlerSingletons.instance;
    }

    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final userEmailEventHandlerHashMap : HashMap = StdUtil.getInstance().createHashMap();
    public function new() {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // throws Exception
    public function getInstance(abeClientInformation : AbeClientInformationInterface, userEmailEventNameData : UserEmailEventNameData, userInterface : UserInterface) : UserEmailEventHandler {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.GET_INSTANCE);
        }
        var userEmailEventHandler : UserEmailEventHandler = (cast this.userEmailEventHandlerHashMap.get(userEmailEventNameData) : UserEmailEventHandler);
        if (userEmailEventHandler == null) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
                this.logUtil.putF("Creating New Named UserEmailEventHandler", this, this.commonStrings.GET_INSTANCE);
            }
            var newUserEmailEventHandler : UserEmailEventHandler = new UserEmailEventHandler();
            var vector : BasicArrayList = EmailEventHandlerUtil.getUserEmailEventListenerVector(abeClientInformation, userEmailEventNameData, userInterface);
            newUserEmailEventHandler.addListener(vector);
            newUserEmailEventHandler.addListener(new LogUserEmailEventListenerModule());
            this.userEmailEventHandlerHashMap.put(userEmailEventNameData, newUserEmailEventHandler);
            return newUserEmailEventHandler;
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
                this.logUtil.putF("Returning existing UserEmailEventHandler", this, this.commonStrings.GET_INSTANCE);
            }
            return userEmailEventHandler;
        }
    }

}

