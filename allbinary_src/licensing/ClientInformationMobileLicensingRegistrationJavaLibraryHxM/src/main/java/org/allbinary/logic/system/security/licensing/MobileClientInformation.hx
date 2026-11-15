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
package org.allbinary.logic.system.security.licensing;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.registration.RegistrationConfiguration;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;

class MobileClientInformation extends AbeClientInformation {
    public static final DESC : String = "Mobile";
    public static final ANDROID_DESC : String = "Android" + MobileClientInformation.DESC;
    public function new(name : String, version : String, specialName : String, shortName : String) {
        super(name, version, new StringMaker().append(specialName).append(CommonSeps.getInstance().SPACE).append(PartnerIdentifierFileUtil.getInstance().get()).toString(), shortName);
        final string : String = this.getSpecialName();
        final number : String = string.substring(string.length - 1);
        if (Integer.getInteger(number) == null) {
            this.setHardSale(false);
        }
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        if (this.isHardSale()) {
            this.logUtil.putF("Use Hard Coded Selling", this, commonStrings.CONSTRUCTOR);
        } else {
            this.logUtil.putF("Don't Use Hard Coded Selling", this, commonStrings.CONSTRUCTOR);
        }
    }

    public override function toHashtable() : ABHashtable<Any, Any> {
        final hashtable : ABHashtable<Any, Any> = super.toHashtable();
        final registrationConfiguration : RegistrationConfiguration = RegistrationConfiguration.getInstance();
        hashtable.put(registrationConfiguration.NAME, registrationConfiguration.getRegistrationCode());
        return hashtable;
    }

}

