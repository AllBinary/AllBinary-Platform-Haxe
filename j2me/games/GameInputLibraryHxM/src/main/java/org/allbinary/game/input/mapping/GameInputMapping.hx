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
package org.allbinary.game.input.mapping;

import org.allbinary.game.input.GameKey;
import org.allbinary.logic.string.StringUtil;

class GameInputMapping {
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    private var gameKey : GameKey = GameKey.NULL_GAME_KEY;
    public function new(name : String, gameKey : GameKey) {
        this.setName(name);
        this.setGameKey(gameKey);
    }

    private function setGameKey(gameKey : GameKey) : Void {
        this.gameKey = gameKey;
    }

    public function getGameKey() : GameKey {
        return this.gameKey;
    }

    private function setName(name : String) : Void {
        this.name = name;
    }

    public function getName() : String {
        return this.name;
    }

}

