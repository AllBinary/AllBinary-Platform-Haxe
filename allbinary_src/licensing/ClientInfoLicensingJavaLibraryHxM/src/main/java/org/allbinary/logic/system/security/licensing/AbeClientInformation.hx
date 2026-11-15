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

import org.allbinary.business.init.LicenseInitInfo;
import org.allbinary.business.init.LicenseInitInfoUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.string.CommonStrings;

// This is the information sent to the license server
class AbeClientInformation extends ClientInformation {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(name : String, version : String, specialName : String, shortName : String) {
        super(name, version, specialName, shortName);
    }

    public override function init() : Void {
        try {
            this.setOperatingSystemInterface(OperatingSystemFactory.getInstance().getOperatingSystemInstance());
            final licenseInitInfo : LicenseInitInfo = LicenseInitInfoUtil.getInstance().read();
            this.setLicenseId(licenseInitInfo.getLicenseId());
            this.setLicenseServers(licenseInitInfo.getServerList());
            final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            if (stringValidationUtil.isEmpty(this.getLicenseId())) {
                final NONE : String = "No License Id";
                this.setLicenseId(NONE);
            }
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.put(new StringMaker().append("Special Name: ").append(this.getSpecialName()).toString(), this, commonStrings.CONSTRUCTOR);
        } catch (e : haxe.Exception) {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
    }

}

