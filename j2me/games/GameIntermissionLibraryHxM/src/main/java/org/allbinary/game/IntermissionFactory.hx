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

import org.allbinary.game.state.GameState;
import org.allbinary.game.state.GameStateFactory;

class IntermissionFactory {
    private static final instance : IntermissionFactory = new IntermissionFactory();
    public static function getInstance() : IntermissionFactory {
        return IntermissionFactory.instance;
    }

    public final START_LEVEL_INTERMISSION_GAME_STATE : GameState = GameStateFactory.getInstance().createGameState("START_LEVEL_INTERMISSION_GAME_STATE");
    public final WAIT_LEVEL_INTERMISSION_GAME_STATE : GameState = GameStateFactory.getInstance().createGameState("WAIT_LEVEL_INTERMISSION_GAME_STATE");
    public final SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE : GameState = GameStateFactory.getInstance().createGameState("SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE");
    public final SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE : GameState = GameStateFactory.getInstance().createGameState("SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE");
    public function new() {
    }
}

