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
package org.allbinary.logic.system.os.android;

import org.allbinary.android.AndroidInfoFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.string.CommonSeps;

class AndroidOS extends GenericOperatingSystem {
    private var stringBuffer : StringMaker = new StringMaker();
    private final DEVICE_ID : String = "DeviceId";
    private final DEVICE_SOFTWARE_VERSION : String = "DeviceSoftwareVersion";
    private final LINE_1_NUMBER : String = "Line1Number";
    public function new() {
        super();
        final SDK_VERSION : Int = AndroidInfoFactory.getInstance().getVersion();
        if (SDK_VERSION > 10) {
            this.scalable = true;
        }
        final properties : AndroidSystemProperties = AndroidSystemProperties.getInstance();
        final commonStrings : CommonSeps = CommonSeps.getInstance();
        this.stringBuffer.append(this.DEVICE_ID);
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getDeviceId());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append(this.DEVICE_SOFTWARE_VERSION);
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getDeviceSoftwareVersion());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append(this.LINE_1_NUMBER);
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getLine1Number());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("NetworkCountryIso");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getNetworkCountryIso());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("NetworkOperator");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getNetworkOperator());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("NetworkOperatorName");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getNetworkOperatorName());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("NetworkType");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.appendint(jre.lang.JavaNumber.toInt(properties.getNetworkType()));
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("PhoneType");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.appendint(jre.lang.JavaNumber.toInt(properties.getPhoneType()));
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("SimCountryIso");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getSimCountryIso());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("SimOperator");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getSimOperator());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("SimOperatorName");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getSimOperatorName());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("SimSerialNumber");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getSimSerialNumber());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("SubscriberId");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getSubscriberId());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("VoiceMailAlphaTag");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getVoiceMailAlphaTag());
        this.stringBuffer.append(commonStrings.SPACE);
        this.stringBuffer.append("VoiceMailNumber");
        this.stringBuffer.append(commonStrings.EQUALS);
        this.stringBuffer.append(properties.getVoiceMailNumber());
        this.stringBuffer.append(commonStrings.SPACE);
    }

    private final OUYA : String = "ouya";
    public override function isOverScan() : Bool {
        var properties : AndroidSystemProperties = AndroidSystemProperties.getInstance();
        if (properties.getDevice().toLowerCase().indexOf(this.OUYA) >= 0) {
            return true;
        }
        return false;
    }

    public override function getOverScanXPercent() : Int {
        return 90;
    }

    public override function getOverScanYPercent() : Int {
        return 90;
    }

    public override function toString() : String {
        var osBuffer : StringMaker = new StringMaker();
        osBuffer.append(super.toString());
        osBuffer.append(CommonSeps.getInstance().SPACE);
        osBuffer.append("Other System Info: \n");
        osBuffer.append(Std.string(this.stringBuffer));
        return Std.string(osBuffer);
    }

}

