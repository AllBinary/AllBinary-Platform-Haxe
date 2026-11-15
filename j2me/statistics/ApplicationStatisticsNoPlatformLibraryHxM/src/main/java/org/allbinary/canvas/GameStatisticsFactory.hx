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
package org.allbinary.canvas;


//NoPlatform
class GameStatisticsFactory extends BaseGameStatistics {
    private static final instance : GameStatisticsFactory = new GameStatisticsFactory();
    public static function getInstance() : GameStatisticsFactory {
        return GameStatisticsFactory.instance;
    }

    public override function add(string : String) : Void {
    }

    public function toString() : String {
        throw new haxe.Exception();
    }

    public function new() {
        super();
    }
}

