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


class LicensingException extends jre.lang.JavaException {
    public static final serialVersionUID : haxe.Int64 = haxe.Int64.ofInt(1);
    public function new(...args : Dynamic) {
        if (args.length == 0) {
            super();
            this._newLicensingException0();
        }
        else if (args.length == 1) {
            final msg : String = args[0];
            super(msg);
            this._newLicensingException1(msg);
        }
    }

    private function _newLicensingException0() : Void {
    }

    private function _newLicensingException1(msg : String) : Void {
    }

}

