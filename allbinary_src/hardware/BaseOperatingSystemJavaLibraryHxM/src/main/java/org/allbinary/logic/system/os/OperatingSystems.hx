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
package org.allbinary.logic.system.os;


class OperatingSystems {
    private static final instance : OperatingSystems = new OperatingSystems();
    public final LINUX : String = "Linux";
    public final WINDOWS : String = "Windows";
    public final SOLARIS : String = "Solaris";
    public final WINDOWS2000 : String = "Windows 2000";
    public final WINDOWS_NT : String = "Windows NT";
    public final WINDOWS_10 : String = "Windows 10";
    public final WINDOWS_11 : String = "Windows 11";
    public final WINDOWS_VISTA : String = "Windows Vista";
    public final WINDOWS_XP : String = "Windows XP";
    public final ANDROID : String;
    public final HARMONY : String = "HarmonyOS";
    public function new() {
        this.ANDROID = this.LINUX;
    }

    private var unknownSpecificOSAllowed : Bool = true;
    public function isUnknownSpecificOSAllowed() : Bool {
        return this.unknownSpecificOSAllowed;
    }

    public function setUnknownSpecificOSAllowed(aUnknownSpecificOSAllowed : Bool) : Void {
        this.unknownSpecificOSAllowed = aUnknownSpecificOSAllowed;
    }

    public static function getInstance() : OperatingSystems {
        return OperatingSystems.instance;
    }

}

