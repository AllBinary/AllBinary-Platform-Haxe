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
package org.allbinary.logic.communication.smtp.info;

import org.allbinary.business.context.configuration.ContextConfigurationInterface;
import org.allbinary.business.user.modules.admin.configuration.AdminConfiguration;
import org.allbinary.business.user.modules.admin.configuration.AdminConfigurationInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface;
import org.allbinary.string.CommonStrings;

class AdminEmailInfo extends BasicEmailInfo {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(subject : String, textBody : String) {
        super(subject, textBody);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().EMAILLOGGING)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.START, this, commonStrings.CONSTRUCTOR);
        }
        this.init();
    }

    // throws Exception
    public function init() : Void {
        var adminConfigurationInterface : AdminConfigurationInterface = (cast new AdminConfiguration() : AdminConfigurationInterface);
        var contextConfigurationInterface : ContextConfigurationInterface = adminConfigurationInterface.getContextConfigurationInterface();
        var emailServerConfigurationInterface : EmailServerConfigurationInterface = contextConfigurationInterface.getEmailServerConfigurationInterface();
        this.setEmailServerConfigurationInterface(emailServerConfigurationInterface);
    }

}

