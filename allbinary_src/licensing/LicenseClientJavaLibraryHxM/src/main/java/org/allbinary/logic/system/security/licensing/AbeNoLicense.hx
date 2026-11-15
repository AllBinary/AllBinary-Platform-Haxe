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

import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AbeNoLicense implements AbeLicenseInterface {
    private static var abeNoLicense : AbeNoLicense = new AbeNoLicense();
    public var serverVector : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public static function getInstance() : AbeNoLicense {
        return AbeNoLicense.abeNoLicense;
    }

    public function hasKey() : Bool {
        return false;
    }

    public function getKey(keyName : String) : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function getLicenseId() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function getSpecial() : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function getServers() : BasicArrayList {
        return this.serverVector;
    }

    public function isValid() : Bool {
        return false;
    }

    public function getLicenseType() : LicenseType {
        return LicenseTypeFactory.getInstance().UNKNOWN;
    }

}

