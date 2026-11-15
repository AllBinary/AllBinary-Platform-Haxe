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


//NoPlatform
class SystemProperties {
    private static final instance : SystemProperties = new SystemProperties();
    public static function getInstance() : SystemProperties {
        return SystemProperties.instance;
    }

    public function new() {
    }

    public function getName() : String {
        throw new jre.lang.JavaException();
    }

    public function getArch() : String {
        throw new jre.lang.JavaException();
    }

    public function getVersion() : String {
        throw new jre.lang.JavaException();
    }

    public function getUserHomePath() : String {
        throw new jre.lang.JavaException();
    }

}

