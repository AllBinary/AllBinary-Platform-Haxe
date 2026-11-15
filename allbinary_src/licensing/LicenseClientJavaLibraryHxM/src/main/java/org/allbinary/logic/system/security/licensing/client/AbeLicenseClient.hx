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
package org.allbinary.logic.system.security.licensing.client;

import org.allbinary.business.init.LicenseInitInfo;
import org.allbinary.business.init.LicenseInitInfoUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.AbeLicenseInterface;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class AbeLicenseClient {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final MINSERVERS : Int = 3;
    public function new() {
    }

    // throws Exception
    // synchronized
    public function get(abeClientInformation : AbeClientInformationInterface) : AbeLicenseInterface {
        try {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.GET);
            final xmlRpcAbeLicenseClient : XmlRpcAbeClient = new XmlRpcAbeLicenseRetrievalClient(abeClientInformation);
            final abeLicenseInterface : AbeLicenseInterface = (cast xmlRpcAbeLicenseClient.get(null) : AbeLicenseInterface);
            final licenseId : String = abeLicenseInterface.getLicenseId();
            final servers : BasicArrayList = abeLicenseInterface.getServers();
            var isNewLicenseId : Bool = false;
            var isBetterServerList : Bool = false;
            final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            if (stringValidationUtil.isEmpty(abeClientInformation.getLicenseId()) && !abeClientInformation.isSameId(licenseId)) {
                isNewLicenseId = true;
            }
            if (servers.size() >= this.MINSERVERS && abeClientInformation.isLargerOrDifferentServerList(servers)) {
                isBetterServerList = true;
            }
            if (isBetterServerList || isNewLicenseId) {
                final initInfo : LicenseInitInfo = LicenseInitInfoUtil.getInstance().read();
                initInfo.setLicenseId(licenseId);
                initInfo.setServerList(servers);
                LicenseInitInfoUtil.getInstance().write(initInfo);
                abeClientInformation.init();
            }
            this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.GET);
            return abeLicenseInterface;
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

