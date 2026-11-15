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


class LicenseLevelUtil {
    private static final instance : LicenseLevelUtil = new LicenseLevelUtil();
    public static function getInstance() : LicenseLevelUtil {
        return LicenseLevelUtil.instance;
    }

    public function getMaxLevel(maxLevel : Int, demoLevel : Int) : Int {
        return demoLevel;
    }

    public function new() {
    }
}

