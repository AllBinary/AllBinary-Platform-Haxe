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
package org.allbinary.game.configuration;


class GameSpeed {
    private static final instance : GameSpeed = new GameSpeed();
    public function getSpeed() : Int {
        var speedGameConfiguration : GameConfiguration = GameConfigurationCentral.getInstance().SPEED;
        return (Std.int(speedGameConfiguration.getMaxValue()) - Std.int(speedGameConfiguration.getValue()) + 1);
    }

    public function getDelay() : Int {
        var speedGameConfiguration : GameConfiguration = GameConfigurationCentral.getInstance().SPEED;
        return 19 * (Std.int(speedGameConfiguration.getMaxValue()) - Std.int(speedGameConfiguration.getValue()));
    }

    public static function getInstance() : GameSpeed {
        return GameSpeed.instance;
    }

    public function new() {
    }
}

