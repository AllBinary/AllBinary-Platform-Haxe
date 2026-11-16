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

import org.allbinary.thirdparty.store.LongArrayIdentifierInterface;

class StoreAppClientInformation extends AbeClientInformation implements LongArrayIdentifierInterface {
    private final longArrayIdentifier : haxe.ds.Vector<haxe.Int64>;
    public function new(name : String, version : String, specialName : String, shortName : String, longArrayIdentifier : haxe.ds.Vector<haxe.Int64>) {
        super(name, version, specialName, shortName);
        this.longArrayIdentifier = longArrayIdentifier;
    }

    public function getLongArrayIdentifier() : haxe.ds.Vector<haxe.Int64> {
        return this.longArrayIdentifier;
    }

}

