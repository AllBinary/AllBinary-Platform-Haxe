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

import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;

class PCKeyFactory {
    private static final SINGLETON : PCKeyFactory = new PCKeyFactory();
    public static function getInstance() : PCKeyFactory {
        return PCKeyFactory.SINGLETON;
    }

    private final keyEventWrapper : ABKeyEventWrapper = ABKeyEventWrapper.getInstance();
    public final UNKNOWN : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_UNDEFINED, "UNKNOWN");
    public final ENTER : PCGameKey = new PCGameKey(5, "Enter");
    public final _A : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_A, "A");
    public final _B : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_B, "B");
    public final _C : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_C, "C");
    public final _D : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_D, "D");
    public final _E : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_E, "E");
    public final _F : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_F, "F");
    public final _G : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_G, "G");
    public final _H : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_H, "H");
    public final _I : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_I, "I");
    public final _J : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_J, "J");
    public final _K : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_K, "K");
    public final _L : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_L, "L");
    public final _M : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_M, "M");
    public final _N : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_N, "N");
    public final _O : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_O, "O");
    public final _P : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_P, "P");
    public final _Q : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_Q, "Q");
    public final _R : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_R, "R");
    public final _S : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_S, "S");
    public final _T : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_T, "T");
    public final _U : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_U, "U");
    public final _V : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_V, "V");
    public final _W : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_W, "W");
    public final _X : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_X, "X");
    public final _Y : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_Y, "Y");
    public final _Z : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_Z, "Z");
    public final a : PCGameKey = new PCGameKey(97, "a");
    public final b : PCGameKey = new PCGameKey(98, "b");
    public final c : PCGameKey = new PCGameKey(99, "c");
    public final d : PCGameKey = new PCGameKey(100, "d");
    public final e : PCGameKey = new PCGameKey(101, "e");
    public final f : PCGameKey = new PCGameKey(102, "f");
    public final g : PCGameKey = new PCGameKey(103, "g");
    public final h : PCGameKey = new PCGameKey(104, "h");
    public final i : PCGameKey = new PCGameKey(105, "i");
    public final j : PCGameKey = new PCGameKey(106, "j");
    public final k : PCGameKey = new PCGameKey(107, "k");
    public final l : PCGameKey = new PCGameKey(108, "l");
    public final m : PCGameKey = new PCGameKey(109, "m");
    public final n : PCGameKey = new PCGameKey(110, "n");
    public final o : PCGameKey = new PCGameKey(111, "o");
    public final p : PCGameKey = new PCGameKey(112, "p");
    public final q : PCGameKey = new PCGameKey(113, "q");
    public final r : PCGameKey = new PCGameKey(114, "r");
    public final s : PCGameKey = new PCGameKey(115, "s");
    public final t : PCGameKey = new PCGameKey(116, "t");
    public final u : PCGameKey = new PCGameKey(117, "u");
    public final v : PCGameKey = new PCGameKey(118, "v");
    public final w : PCGameKey = new PCGameKey(119, "w");
    public final x : PCGameKey = new PCGameKey(120, PositionStrings.getInstance().X);
    public final y : PCGameKey = new PCGameKey(121, PositionStrings.getInstance().Y);
    public final z : PCGameKey = new PCGameKey(122, "z");
    public final ZERO : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_0, CommonPhoneStrings.getInstance().ZERO);
    public final ONE : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_1, CommonPhoneStrings.getInstance().ONE);
    public final TWO : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_2, CommonPhoneStrings.getInstance().TWO);
    public final THREE : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_3, CommonPhoneStrings.getInstance().THREE);
    public final FOUR : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_4, CommonPhoneStrings.getInstance().FOUR);
    public final FIVE : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_5, CommonPhoneStrings.getInstance().FIVE);
    public final SIX : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_6, CommonPhoneStrings.getInstance().SIX);
    public final SEVEN : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_7, CommonPhoneStrings.getInstance().SEVEN);
    public final EIGHT : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_8, CommonPhoneStrings.getInstance().EIGHT);
    public final NINE : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_9, CommonPhoneStrings.getInstance().NINE);
    public final DPAD_UP : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_UP, CommonPhoneStrings.getInstance().UP);
    public final DPAD_DOWN : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_DOWN, CommonPhoneStrings.getInstance().DOWN);
    public final DPAD_LEFT : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_LEFT, CommonPhoneStrings.getInstance().LEFT);
    public final DPAD_RIGHT : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_RIGHT, CommonPhoneStrings.getInstance().RIGHT);
    public final DPAD_UP2 : PCGameKey = this.DPAD_UP;
    public final DPAD_DOWN2 : PCGameKey = this.DPAD_DOWN;
    public final DPAD_LEFT2 : PCGameKey = this.DPAD_LEFT;
    public final DPAD_RIGHT2 : PCGameKey = this.DPAD_RIGHT;
    public final COMMA : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_COMMA, "COMMA");
    public final SPACE : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_SPACE, "SPACE");
    public final DEL : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_DELETE, "DEL");
    public final STAR : PCGameKey = new PCGameKey(42, CommonPhoneStrings.getInstance().STAR);
    public final QUESTION : PCGameKey = new PCGameKey(47, "?");
    public final PERIOD : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_PERIOD, CommonSeps.getInstance().PERIOD);
    public final ESCAPE : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_ESCAPE, "Esc");
    public final BACK_SPACE : PCGameKey = new PCGameKey(this.keyEventWrapper.VK_BACK_SPACE, "Backspace");
    public function isSubmission(input : Input) : Bool {
        if (input == this.ENTER) {
            return true;
        }
        return false;
    }

    public function isDelete(input : Input) : Bool {
        if (input == this.DEL) {
            return true;
        }
        return false;
    }

    public function isBackSpace(input : Input) : Bool {
        if (input == this.BACK_SPACE) {
            return true;
        }
        return false;
    }

    public function isUp(input : Input) : Bool {
        if (input == this.DPAD_UP || input == this.DPAD_UP2) {
            return true;
        }
        return false;
    }

    public function isDown(input : Input) : Bool {
        if (input == this.DPAD_DOWN || input == this.DPAD_DOWN2) {
            return true;
        }
        return false;
    }

    public function isLeft(input : Input) : Bool {
        if (input == this.DPAD_LEFT || input == this.DPAD_LEFT2) {
            return true;
        }
        return false;
    }

    public function isRight(input : Input) : Bool {
        if (input == this.DPAD_RIGHT || input == this.DPAD_RIGHT2) {
            return true;
        }
        return false;
    }

    public function isEnter(input : Input) : Bool {
        if (input == this.ENTER) {
            return true;
        }
        return false;
    }

    public function new() {
    }
}

