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
package org.allbinary;

import org.allbinary.business.init.LicenseInitInfoUtil;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.system.security.licensing.PartnerIdentifierFileUtil;

class AllBinaryAndroidGameInitializationUtil {
    public static function init() : Void {
        final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
        final androidResources : AndroidResources = AndroidResources.getInstance();
        final licenseInitInfoUtil : LicenseInitInfoUtil = LicenseInitInfoUtil.getInstance();
        resourceUtil.addResource(licenseInitInfoUtil.INITFILENAME, Std.string(androidResources.raw.licenseinitdata));
        resourceUtil.addResource(PartnerIdentifierFileUtil.getInstance().FILE_NAME, Std.string(androidResources.raw.partner));
    }

    public function new() {
    }
}

