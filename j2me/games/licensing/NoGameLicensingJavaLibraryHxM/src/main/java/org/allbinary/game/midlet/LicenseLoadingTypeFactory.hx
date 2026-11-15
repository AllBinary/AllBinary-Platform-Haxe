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
package org.allbinary.game.midlet;


class LicenseLoadingTypeFactory {
    private static final instance : LicenseLoadingTypeFactory = new LicenseLoadingTypeFactory();
    public static function getIntance() : LicenseLoadingTypeFactory {
        return LicenseLoadingTypeFactory.instance;
    }

    public final INITIAL_LOADING : LicenseLoadingType = new LicenseLoadingType("Initial Loading");
    public final GAME_START : LicenseLoadingType = new LicenseLoadingType("Game Start");
    public final LOGIN : LicenseLoadingType = new LicenseLoadingType("Login");
    public final OTHER : LicenseLoadingType = new LicenseLoadingType("Other/Usually The First Non Demo Level");
    public function new() {
    }
}

