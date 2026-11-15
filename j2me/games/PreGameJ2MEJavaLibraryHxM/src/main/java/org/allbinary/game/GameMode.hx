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

class GameMode {
    public static var NONE : GameMode = new GameMode(StringUtil.getInstance().NULL_STRING);
    public static var SERVER : GameMode = new GameMode("Server");
    public static var CLIENT : GameMode = new GameMode("Client");
    private var name : String = StringUtil.getInstance().EMPTY_STRING;
    public function new(name : String) {
        this.setName(name);
    }

    private function setName(name : String) : Void {
        this.name = name;
    }

    public function getName() : String {
        return this.name;
    }

    public function toString() : String {
        return this.getName();
    }

}

