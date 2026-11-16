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
package org.allbinary.business.init;


class InitException extends jre.lang.JavaException {
    public function new(...args : Dynamic) {
        if (args.length == 0) {
            super();
            this._newInitException0();
        }
        else if (args.length == 1) {
            final msg : String = args[0];
            super(msg);
            this._newInitException1(msg);
        }
    }

    private function _newInitException0() : Void {
    }

    private function _newInitException1(msg : String) : Void {
    }

}

