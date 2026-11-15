/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.game.state;

import org.allbinary.logic.NullUtil;

class RaceGameStateFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : RaceGameStateFactory {
        if (RaceGameStateFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            RaceGameStateFactory.instance = new RaceGameStateFactory();
        }
        return (cast RaceGameStateFactory.instance : RaceGameStateFactory);
    }

    public final START_GAME_STATE : GameState = GameStateFactory.getInstance().createGameState("START_GAME_STATE");
    public final YELLOW_LIGHT_GAME_STATE : GameState = GameStateFactory.getInstance().createGameState("YELLOW_LIGHT_GAME_STATE");
    public final RED_LIGHT_GAME_STATE : GameState = GameStateFactory.getInstance().createGameState("RED_LIGHT_GAME_STATE");
    public function new() {
    }
}

