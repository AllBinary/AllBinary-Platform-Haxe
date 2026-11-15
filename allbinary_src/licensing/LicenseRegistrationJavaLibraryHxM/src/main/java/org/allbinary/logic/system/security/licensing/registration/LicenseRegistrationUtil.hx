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
package org.allbinary.logic.system.security.licensing.registration;

import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.canvas.SpecialMessageUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.util.ABHashtable;

class LicenseRegistrationUtil {
    public function new() {
    }

    // synchronized
    public static function process(abeClientInformation : AbeClientInformationInterface, registrationId : String) : Void {
        try {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.put(CommonLabels.getInstance().START_LABEL + "License Registration", "LicenseRegistrationUtil", commonStrings.PROCESS);
            final registrationConfiguration : RegistrationConfiguration = RegistrationConfiguration.getInstance();
            registrationConfiguration.setRegistrationCode(registrationId);
            registrationConfiguration.write();
            final hashtable : ABHashtable<Any, Any> = abeClientInformation.toHashtable();
            hashtable.put(RegistrationConfiguration.getInstance().NAME, registrationId);
            hashtable.put("message", SpecialMessageUtil.getInstance().get());
            new XmlRpcRemoteLicenseRegistrationClient(abeClientInformation).get(hashtable);
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("License Registration Exception", "LicenseRegistrationUtil", "License Registration", e);
        }
    }

}

