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
package org.allbinary.game.state;

import org.allbinary.logic.NullUtil;

class GameStateFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameStateFactory {
        if (GameStateFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            GameStateFactory.instance = new GameStateFactory();
        }
        return (cast GameStateFactory.instance : GameStateFactory);
    }

    private var index : Int = 0;
    public final NO_GAME_STATE : GameState;
    public final PLAYING_GAME_STATE : GameState;
    public final SHOW_END_RESULT_GAME_STATE : GameState;
    public final SHOW_HIGH_SCORE_GAME_STATE : GameState;
    public function new() {
        this.NO_GAME_STATE = this.createGameState("NO_GAME_STATE");
        this.PLAYING_GAME_STATE = this.createGameState("PLAYING_GAME_STATE");
        this.SHOW_END_RESULT_GAME_STATE = this.createGameState("SHOW_END_RESULT_GAME_STATE");
        this.SHOW_HIGH_SCORE_GAME_STATE = this.createGameState("SHOW_HIGH_SCORE_GAME_STATE");
    }

    public function createGameState(name : String) : GameState {
        return new GameState(name, this.index++);
    }

}

