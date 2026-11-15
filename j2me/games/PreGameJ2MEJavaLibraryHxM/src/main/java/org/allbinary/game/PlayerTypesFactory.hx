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
package org.allbinary.game;


class PlayerTypesFactory {
    public final PLAYER_TYPE_ONE : PlayerType = new PlayerType("Player Type One", 0);
    public final PLAYER_TYPE_TWO : PlayerType = new PlayerType("Player Type Two", 1);
    public final PLAYER_TYPE_THREE : PlayerType = new PlayerType("Player Type Three", 2);
    private static final SINGLETON : PlayerTypesFactory = new PlayerTypesFactory();
    public static function getInstance() : PlayerTypesFactory {
        return PlayerTypesFactory.SINGLETON;
    }

    public function new() {
    }
}

