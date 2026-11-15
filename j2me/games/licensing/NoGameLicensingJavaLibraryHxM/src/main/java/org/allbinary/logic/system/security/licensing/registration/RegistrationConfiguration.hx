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
package org.allbinary.logic.system.security.licensing.registration;

import org.allbinary.logic.string.StringMaker;

class RegistrationConfiguration {
    private static final SINGLETON : RegistrationConfiguration = new RegistrationConfiguration();
    private var registrationCode : String = "No Registration Code";
    public final NAME : String = "registrationid";
    public function new() {
    }

    public static function getInstance() : RegistrationConfiguration {
        return RegistrationConfiguration.SINGLETON;
    }

    // throws Exception
    private function read() : Void {
    }

    // throws Exception
    public function write() : Void {
    }

    public function toString() : String {
        return new StringMaker().append("Registration Code: ").append(this.getRegistrationCode()).toString();
    }

    public function setRegistrationCode(registrationCode : String) : Void {
        this.registrationCode = registrationCode;
    }

    public function getRegistrationCode() : String {
        return this.registrationCode;
    }

}

