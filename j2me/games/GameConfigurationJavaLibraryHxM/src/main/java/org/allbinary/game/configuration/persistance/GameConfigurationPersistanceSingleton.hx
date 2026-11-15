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
package org.allbinary.game.configuration.persistance;


class GameConfigurationPersistanceSingleton extends KeyValuePersistance {
    private static var GAME_PERSISTANCE : GameConfigurationPersistanceSingleton = new GameConfigurationPersistanceSingleton();
    public static function getInstance() : GameConfigurationPersistanceSingleton {
        return GameConfigurationPersistanceSingleton.GAME_PERSISTANCE;
    }

    public function new() {
        super(GamePersistanceStrings.getInstance().SAVED_GAME_CONFIGURATION_RECORD_ID);
    }

}

