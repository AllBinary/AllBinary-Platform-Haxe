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
package org.allbinary.business.init.db;


class LogDbInitInfo extends DbInitInfo {
    private static final INITFILE : String = "logdbinitdata.dat";
    public function new(...args : Dynamic) {
        if (args.length == 0) {
            super(INITFILE, true);
            this._newLogDbInitInfo0();
        }
        else if (args.length == 1) {
            final read : Bool = args[0];
            super(INITFILE, read);
            this._newLogDbInitInfo1(read);
        }
    }

    private function _newLogDbInitInfo0() : Void {
    }

    private function _newLogDbInitInfo1(read : Bool) : Void {
    }

}

