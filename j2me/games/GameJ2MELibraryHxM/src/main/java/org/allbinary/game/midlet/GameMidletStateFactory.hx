// Generated Code Do Not Modify
package org.allbinary.game.midlet;

import org.allbinary.game.state.GameState;
import org.allbinary.game.state.GameStateFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;

class GameMidletStateFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final INSTANCE : GameMidletStateFactory = new GameMidletStateFactory();
    private var currentGameState : GameState = GameStateFactory.getInstance().NO_GAME_STATE;
    public function new() {
    }

    public static function getInstance() : GameMidletStateFactory {
        return GameMidletStateFactory.INSTANCE;
    }

    public function getCurrentGameState() : GameState {
        return this.currentGameState;
    }

    public function setCurrentGameState(currentGameState : GameState) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().CURRENT).append(" GameState: ").append(StringUtil.getInstance().toString(currentGameState))), this, "setCurrentGameState");
        this.currentGameState = currentGameState;
    }

}

