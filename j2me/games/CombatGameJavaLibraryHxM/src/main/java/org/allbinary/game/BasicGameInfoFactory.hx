// Generated Code Do Not Modify
package org.allbinary.game;


class BasicGameInfoFactory {
    private static final SINGLETON : BasicGameInfoFactory = new BasicGameInfoFactory();
    public static function getInstance() : BasicGameInfoFactory {
        return BasicGameInfoFactory.SINGLETON;
    }

    public var currentReleaseIndex : Int = 0;
    public var currentDestroyIndex : Int = 0;
    public var total : Int = 0;
    public function new() {
    }

    public function init(total : Int) : Void {
        this.currentReleaseIndex = 0;
        this.currentDestroyIndex = 0;
        this.total = total;
    }

    public function isPeaked() : Bool {
        if (this.currentDestroyIndex >= this.total) {
            return true;
        } else {
            return false;
        }
    }

    public function howManyLeft() : Int {
        return this.total - this.currentDestroyIndex;
    }

}

