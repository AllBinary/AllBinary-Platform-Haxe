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

import org.allbinary.TsUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.hardware.HardwareInterface;
import org.allbinary.logic.system.hardware.SystemHardwareFactory;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.NoOperatingSystem;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

// This is the information sent to the license server
class ClientInformation implements AbeClientInformationInterface {
    private var operatingSystemInterface : GenericOperatingSystem = NoOperatingSystem.NO_OPERATING_SYSTEM;
    private final tsUtil : TsUtil = TsUtil.getInstance();
    private final name : String;
    private final shortName : String;
    private final version : String;
    private final specialName : String;
    private var hardSale : Bool = true;
    private var licenseId : String = StringUtil.getInstance().EMPTY_STRING;
    private var licenseServers : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    public function new(name : String, version : String, specialName : String, shortName : String) {
        this.name = name;
        this.version = version;
        this.specialName = specialName;
        this.shortName = Std.string(new StringMaker().append(shortName).append(CommonSeps.getInstance().UNDERSCORE).append(version));
        this.init();
    }

    public function init() : Void {
    }

    public function getOperatingSystemInterface() : GenericOperatingSystem {
        return this.operatingSystemInterface;
    }

    public function getName() : String {
        return this.name;
    }

    public function getSpecialName() : String {
        return this.specialName;
    }

    public function getVersion() : String {
        return this.version;
    }

    public function getLicenseId() : String {
        return this.licenseId;
    }

    public function getLicenseServers() : BasicArrayList {
        return this.licenseServers;
    }

    public function getLicenseServer(index : Int) : String {
        return (cast this.licenseServers.objectArray[index] : String);
    }

    public function getNumberOfLicenseServers() : Int {
        return this.licenseServers.size();
    }

    public function toHashtable() : ABHashtable<Any, Any> {
        final abeClientInformationData : AbeClientInformationData = AbeClientInformationData.getInstance();
        final genericOperatingSystem : GenericOperatingSystem = this.getOperatingSystemInterface();
        final clientInfoHashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        clientInfoHashtable.put(abeClientInformationData.NAME, this.name);
        clientInfoHashtable.put(abeClientInformationData.VERSION, this.version);
        clientInfoHashtable.put(abeClientInformationData.SPECIALNAME, this.specialName);
        clientInfoHashtable.put(abeClientInformationData.LICENSEID, this.getLicenseId());
        clientInfoHashtable.put(abeClientInformationData.OSNAME, genericOperatingSystem.getName());
        clientInfoHashtable.put(abeClientInformationData.OSARCH, genericOperatingSystem.getArch());
        clientInfoHashtable.put(abeClientInformationData.OSVERSION, genericOperatingSystem.getVersion());
        clientInfoHashtable.put(abeClientInformationData.OS, Std.string(genericOperatingSystem));
        final hardwareInterface : HardwareInterface = SystemHardwareFactory.getInstance().getInstanceFor(genericOperatingSystem);
        var hardwareString : String = Std.string(hardwareInterface);
        clientInfoHashtable.put(abeClientInformationData.HARDWARE, hardwareString);
        return clientInfoHashtable;
    }

    public function isSameId(alicenseId : String) : Bool {
        if (this.tsUtil.compareTo(this.getLicenseId(), alicenseId) == 0) {
            return true;
        } else {
            return false;
        }
    }

    public function isLargerOrDifferentServerList(list : BasicArrayList) : Bool {
        final size : Int = list.size() - 1;
        final currentSize : Int = this.licenseServers.size() - 1;
        if (size > currentSize) {
            return true;
        }
        {
            var index : Int = size;
            while (index >= 0) {
            final newServerName : String = (cast list.objectArray[index] : String);
            {
                var index2 : Int = currentSize;
                while (index2 >= 0) {
                final nextOldServerName : String = (cast this.licenseServers.objectArray[index] : String);
                if (this.tsUtil.compareTo(newServerName, nextOldServerName) != 0) {
                    return true;
                }
                    index2--;
                }
            }
                index--;
            }
        }
        return false;
    }

    public function setHardSale(hardSale : Bool) : Void {
        this.hardSale = hardSale;
    }

    public function isHardSale() : Bool {
        return this.hardSale;
    }

    public function setOperatingSystemInterface(operatingSystemInterface : GenericOperatingSystem) : Void {
        this.operatingSystemInterface = operatingSystemInterface;
    }

    public function setLicenseId(licenseId : String) : Void {
        this.licenseId = licenseId;
    }

    public function setLicenseServers(licenseServers : BasicArrayList) : Void {
        this.licenseServers = licenseServers;
    }

    public function toShortString() : String {
        return this.shortName;
    }

}

