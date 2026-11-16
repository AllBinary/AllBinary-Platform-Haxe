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


class J2MEKeyFactory {
    private static final instance : J2MEKeyFactory = new J2MEKeyFactory();
    public static function getInstance() : J2MEKeyFactory {
        return J2MEKeyFactory.instance;
    }

    public function new() {
    }

    private final gameKeyFactory : GameKeyFactory = GameKeyFactory.getInstance();
    public function init() : Void {
        var gameKeyArray : haxe.ds.Vector<GameKey> = haxe.ds.Vector.fromArrayCopy(([this.gameKeyFactory.DOWN, this.gameKeyFactory.FIRE, this.gameKeyFactory.GAME_A, this.gameKeyFactory.GAME_B, this.gameKeyFactory.GAME_C, this.gameKeyFactory.GAME_D, this.gameKeyFactory.KEY_NUM0, this.gameKeyFactory.KEY_NUM1, this.gameKeyFactory.KEY_NUM2, this.gameKeyFactory.KEY_NUM3, this.gameKeyFactory.KEY_NUM4, this.gameKeyFactory.KEY_NUM5, this.gameKeyFactory.KEY_NUM6, this.gameKeyFactory.KEY_NUM7, this.gameKeyFactory.KEY_NUM8, this.gameKeyFactory.KEY_NUM9, this.gameKeyFactory.KEY_POUND, this.gameKeyFactory.KEY_STAR, this.gameKeyFactory.LEFT, this.gameKeyFactory.LEVEL_DOWN, this.gameKeyFactory.LEVEL_UP, this.gameKeyFactory.NONE, this.gameKeyFactory.RIGHT, this.gameKeyFactory.UP] : Array<GameKey>));
        var inputFactory : InputFactory = InputFactory.getInstance();
        {
            var index : Int = gameKeyArray.length;
            while (--index >= 0) {
            inputFactory.add(gameKeyArray[index].getId(), gameKeyArray[index]);
            }
        }
    }

    public function isSubmission(input : Input) : Bool {
        if (input == this.gameKeyFactory.FIRE) {
            return true;
        }
        return false;
    }

    public function isDelete(input : Input) : Bool {
        if (input == this.gameKeyFactory.GAME_D) {
            return true;
        }
        return false;
    }

    public function isBackSpace(input : Input) : Bool {
        return false;
    }

    public function isUp(input : Input) : Bool {
        if (input == this.gameKeyFactory.UP) {
            return true;
        }
        return false;
    }

    public function isDown(input : Input) : Bool {
        if (input == this.gameKeyFactory.DOWN) {
            return true;
        }
        return false;
    }

    public function isLeft(input : Input) : Bool {
        if (input == this.gameKeyFactory.LEFT) {
            return true;
        }
        return false;
    }

    public function isRight(input : Input) : Bool {
        if (input == this.gameKeyFactory.RIGHT) {
            return true;
        }
        return false;
    }

    public function isEnter(input : Input) : Bool {
        if (input == this.gameKeyFactory.FIRE) {
            return true;
        }
        return false;
    }

}

