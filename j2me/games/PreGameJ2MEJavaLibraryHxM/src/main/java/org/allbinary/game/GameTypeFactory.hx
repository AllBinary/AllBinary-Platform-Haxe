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

import org.allbinary.logic.string.StringUtil;

class GameTypeFactory {
    private static final instance : GameTypeFactory = new GameTypeFactory();
    public static function getInstance() : GameTypeFactory {
        return GameTypeFactory.instance;
    }

    public var NULL_GAME_TYPE_ARRAY : haxe.ds.Vector<GameType> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public var NONE : GameType = new GameType(StringUtil.getInstance().NULL_STRING);
    public var SINGLE_PLAYER : GameType = new GameType("Single Player");
    public var MULTI_PLAYER : GameType = new GameType("Multi Player");
    public var BOT : GameType = new GameType("Artificial Player");
    public function new() {
    }
}

