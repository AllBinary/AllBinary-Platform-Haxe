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


//ActualPlatform
class SystemProperties {
    private static final instance : SystemProperties = new SystemProperties();
    public static function getInstance() : SystemProperties {
        return SystemProperties.instance;
    }

    private final OS_NAME : String = "os.name";
    private final OS_ARCH : String = "os.arch";
    private final OS_VERSION : String = "os.version";
    public function new() {
    }

    public function getName() : String {
        return this.OS_NAME;
    }

    public function getArch() : String {
        return this.OS_ARCH;
    }

    public function getVersion() : String {
        return this.OS_VERSION;
    }

    public function getUserHomePath() : String {
        throw new haxe.Exception();
    }

}

