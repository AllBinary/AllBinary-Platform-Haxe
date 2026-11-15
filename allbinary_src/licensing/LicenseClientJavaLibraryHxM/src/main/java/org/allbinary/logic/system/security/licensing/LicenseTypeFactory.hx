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

import org.allbinary.string.CommonStrings;

class LicenseTypeFactory {
    private static final instance : LicenseTypeFactory = new LicenseTypeFactory();
    public static function getInstance() : LicenseTypeFactory {
        return LicenseTypeFactory.instance;
    }

    public final UNKNOWN : LicenseType = new LicenseType(CommonStrings.getInstance().UNKNOWN);
    public final DEMO : LicenseType = new LicenseType("Demo");
    public final NORMAL : LicenseType = new LicenseType("Normal");
    public function getInstance(name : String) : LicenseType {
        if (this.DEMO.getName().compareTo(name) == 0) {
            return this.DEMO;
        } else if (this.NORMAL.getName().compareTo(name) == 0) {
            return this.NORMAL;
        }
        return this.UNKNOWN;
    }

    public function new() {
    }
}

