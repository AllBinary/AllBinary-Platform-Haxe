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

    private final androidKeyFactory : AndroidKeyFactory = ActivityFractureControllerUtilFactory.getInstance();
    public function getString(keyCode : Int) : String {
        return AndroidGameKey.getString(keyCode);
    }

    public function isSubmission(input : Input) : Bool {
        return this.androidKeyFactory.isSubmission(input);
    }

    public function isDelete(input : Input) : Bool {
        return this.androidKeyFactory.isDelete(input);
    }

    public function isBackSpace(input : Input) : Bool {
        return this.androidKeyFactory.isBackSpace(input);
    }

    public function isLeft(input : Input) : Bool {
        return this.androidKeyFactory.isLeft(input);
    }

    public function isRight(input : Input) : Bool {
        return this.androidKeyFactory.isRight(input);
    }

    public function isUp(input : Input) : Bool {
        return this.androidKeyFactory.isUp(input);
    }

    public function isDown(input : Input) : Bool {
        return this.androidKeyFactory.isDown(input);
    }

    public function isEnter(input : Input) : Bool {
        return this.androidKeyFactory.isEnter(input);
    }

    public function new() {
    }
}

