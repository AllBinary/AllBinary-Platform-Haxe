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
package org.allbinary.game.input;

import org.allbinary.logic.NullUtil;

class PlatformKeyFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : PlatformKeyFactory {
        if (PlatformKeyFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            PlatformKeyFactory.instance = new PlatformKeyFactory();
        }
        return (cast PlatformKeyFactory.instance : PlatformKeyFactory);
    }

    public function getString(keyCode : Int) : String {
        return PCGameKey.getString(keyCode);
    }

    public function isSubmission(input : Input) : Bool {
        return PCKeyFactory.getInstance().isSubmission(input);
    }

    public function isDelete(input : Input) : Bool {
        return PCKeyFactory.getInstance().isDelete(input);
    }

    public function isBackSpace(input : Input) : Bool {
        return PCKeyFactory.getInstance().isBackSpace(input);
    }

    public function isUp(input : Input) : Bool {
        return PCKeyFactory.getInstance().isUp(input);
    }

    public function isDown(input : Input) : Bool {
        return PCKeyFactory.getInstance().isDown(input);
    }

    public function isEnter(input : Input) : Bool {
        return PCKeyFactory.getInstance().isEnter(input);
    }

    public function isLeft(input : Input) : Bool {
        return PCKeyFactory.getInstance().isLeft(input);
    }

    public function isRight(input : Input) : Bool {
        return PCKeyFactory.getInstance().isRight(input);
    }

    public function new() {
    }
}

