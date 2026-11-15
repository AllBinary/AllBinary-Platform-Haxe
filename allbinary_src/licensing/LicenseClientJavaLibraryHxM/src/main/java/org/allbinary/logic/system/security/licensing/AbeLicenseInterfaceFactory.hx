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

//import java.io.IOException;
//import java.util.Calendar;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.client.AbeLicenseClient;
import org.allbinary.string.CommonStrings;

class AbeLicenseInterfaceFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final SINGLETON : AbeLicenseInterfaceFactory = new AbeLicenseInterfaceFactory();
    public static function getInstance() : AbeLicenseInterfaceFactory {
        return AbeLicenseInterfaceFactory.SINGLETON;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var time : haxe.Int64 = 0;
    private var check : Bool = false;
    private var checkPeriod : Int = 36000000;
    private var abeLicenseInterface : AbeLicenseInterface = null;
    public function new() {
    }

    // throws LicensingException
    public function getLicenseInstance(abeClientInformation : AbeClientInformationInterface) : AbeLicenseInterface {
        if (isTimeToGetKey()) {
            return this.get(abeClientInformation);
        } else {
            return this.abeLicenseInterface;
        }
    }

    // throws LicensingException
    private function get(abeClientInformation : AbeClientInformationInterface) : AbeLicenseInterface {
        try {
            this.logUtil.putF("Getting Keys", this, this.commonStrings.GET);
            this.abeLicenseInterface = AbeNoLicense.getInstance();
            var licenseClient : AbeLicenseClient = new AbeLicenseClient();
            this.abeLicenseInterface = licenseClient.get(abeClientInformation);
            if (this.abeLicenseInterface != null) {
                this.logUtil.putF("Default Key: " + this.abeLicenseInterface.getKey(AbeClientInformationData.getInstance().KEY), this, this.commonStrings.GET);
            }
            return this.abeLicenseInterface;
        } catch (e : IOException) {
            this.logUtil.put("Licensing IO Error", this, this.commonStrings.GET, e);
            throw new LicensingException("License Server Connection Error");
        } catch (e : haxe.Exception) {
            this.logUtil.put("Licensing Failure", this, this.commonStrings.GET, e);
            throw new LicensingException("Unknown License Failure: " + Type.getClassName(Type.getClass(this)));
        }
    }

    private function isTimeToGetKey() : Bool {
        var calendar : Calendar = Calendar.getInstance();
        var currentTime : haxe.Int64 = calendar.getTimeInMillis();
        if (this.abeLicenseInterface == null || this.abeLicenseInterface == AbeNoLicense.getInstance() || !this.abeLicenseInterface.hasKey() || isCheck() || currentTime - haxe.Int64.ofInt(checkPeriod) > time) {
            this.abeLicenseInterface = null;
            this.time = currentTime;
            return true;
        } else {
            return false;
        }
    }

    public function setCheck(check : Bool) : Void {
        this.check = check;
    }

    private function isCheck() : Bool {
        return this.check;
    }

}

