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

import javax.microedition.lcdui.Canvas;
import org.allbinary.logic.NullUtil;
import org.allbinary.string.CommonPhoneStrings;

class GameKeyFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameKeyFactory {
        if (GameKeyFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            GameKeyFactory.instance = new GameKeyFactory();
        }
        return (cast GameKeyFactory.instance : GameKeyFactory);
    }

    public final NONE : GameKey = new GameKey(InputFactory.getInstance().MAX - 1, "None");
    public final UP : GameKey = new GameKey(Canvas.UP, CommonPhoneStrings.getInstance().UP);
    public final DOWN : GameKey = new GameKey(Canvas.DOWN, CommonPhoneStrings.getInstance().DOWN);
    public final LEFT : GameKey = new GameKey(Canvas.LEFT, CommonPhoneStrings.getInstance().LEFT);
    public final RIGHT : GameKey = new GameKey(Canvas.RIGHT, CommonPhoneStrings.getInstance().RIGHT);
    public final KEY_POUND : GameKey = new GameKey(Canvas.KEY_POUND, "POUND");
    public final KEY_STAR : GameKey = new GameKey(Canvas.KEY_STAR, "STAR");
    public final KEY_NUM0 : GameKey = new GameKey(Canvas.KEY_NUM0, CommonPhoneStrings.getInstance().ZERO);
    public final KEY_NUM1 : GameKey = new GameKey(Canvas.KEY_NUM1, CommonPhoneStrings.getInstance().ONE);
    public final KEY_NUM2 : GameKey = new GameKey(Canvas.KEY_NUM2, CommonPhoneStrings.getInstance().TWO);
    public final KEY_NUM3 : GameKey = new GameKey(Canvas.KEY_NUM3, CommonPhoneStrings.getInstance().THREE);
    public final KEY_NUM4 : GameKey = new GameKey(Canvas.KEY_NUM4, CommonPhoneStrings.getInstance().FOUR);
    public final KEY_NUM5 : GameKey = new GameKey(Canvas.KEY_NUM5, CommonPhoneStrings.getInstance().FIVE);
    public final KEY_NUM6 : GameKey = new GameKey(Canvas.KEY_NUM6, CommonPhoneStrings.getInstance().SIX);
    public final KEY_NUM7 : GameKey = new GameKey(Canvas.KEY_NUM7, CommonPhoneStrings.getInstance().SEVEN);
    public final KEY_NUM8 : GameKey = new GameKey(Canvas.KEY_NUM8, CommonPhoneStrings.getInstance().EIGHT);
    public final KEY_NUM9 : GameKey = new GameKey(Canvas.KEY_NUM9, CommonPhoneStrings.getInstance().NINE);
    public final GAME_A : GameKey = new GameKey(Canvas.GAME_A, "Game A");
    public final GAME_B : GameKey = new GameKey(Canvas.GAME_B, "Game B");
    public final GAME_C : GameKey = new GameKey(Canvas.GAME_C, "Game C");
    public final GAME_D : GameKey = new GameKey(Canvas.GAME_D, "Game D");
    public final FIRE : GameKey = new GameKey(Canvas.FIRE, CommonPhoneStrings.getInstance().FIRE);
    public var LEVEL_DOWN : GameKey = new GameKey(Canvas.KEY_NUM9 + 1, "Cheat Level Up");
    public var LEVEL_UP : GameKey = new GameKey(Canvas.KEY_NUM9 + 2, "Cheat Level Down");
    public function new() {
    }
}

