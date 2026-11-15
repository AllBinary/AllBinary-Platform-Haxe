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
    public final UNKNOWN : PCGameKey;
    public final ENTER : PCGameKey = new PCGameKey(5, "Enter");
    public final _A : PCGameKey;
    public final _B : PCGameKey;
    public final _C : PCGameKey;
    public final _D : PCGameKey;
    public final _E : PCGameKey;
    public final _F : PCGameKey;
    public final _G : PCGameKey;
    public final _H : PCGameKey;
    public final _I : PCGameKey;
    public final _J : PCGameKey;
    public final _K : PCGameKey;
    public final _L : PCGameKey;
    public final _M : PCGameKey;
    public final _N : PCGameKey;
    public final _O : PCGameKey;
    public final _P : PCGameKey;
    public final _Q : PCGameKey;
    public final _R : PCGameKey;
    public final _S : PCGameKey;
    public final _T : PCGameKey;
    public final _U : PCGameKey;
    public final _V : PCGameKey;
    public final _W : PCGameKey;
    public final _X : PCGameKey;
    public final _Y : PCGameKey;
    public final _Z : PCGameKey;
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
    public final ZERO : PCGameKey;
    public final ONE : PCGameKey;
    public final TWO : PCGameKey;
    public final THREE : PCGameKey;
    public final FOUR : PCGameKey;
    public final FIVE : PCGameKey;
    public final SIX : PCGameKey;
    public final SEVEN : PCGameKey;
    public final EIGHT : PCGameKey;
    public final NINE : PCGameKey;
    public final DPAD_UP : PCGameKey;
    public final DPAD_DOWN : PCGameKey;
    public final DPAD_LEFT : PCGameKey;
    public final DPAD_RIGHT : PCGameKey;
    public final DPAD_UP2 : PCGameKey;
    public final DPAD_DOWN2 : PCGameKey;
    public final DPAD_LEFT2 : PCGameKey;
    public final DPAD_RIGHT2 : PCGameKey;
    public final COMMA : PCGameKey;
    public final SPACE : PCGameKey;
    public final DEL : PCGameKey;
    public final STAR : PCGameKey = new PCGameKey(42, CommonPhoneStrings.getInstance().STAR);
    public final QUESTION : PCGameKey = new PCGameKey(47, "?");
    public final PERIOD : PCGameKey;
    public final ESCAPE : PCGameKey;
    public final BACK_SPACE : PCGameKey;
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
        this.UNKNOWN = new PCGameKey(this.keyEventWrapper.VK_UNDEFINED, "UNKNOWN");
        this._A = new PCGameKey(this.keyEventWrapper.VK_A, "A");
        this._B = new PCGameKey(this.keyEventWrapper.VK_B, "B");
        this._C = new PCGameKey(this.keyEventWrapper.VK_C, "C");
        this._D = new PCGameKey(this.keyEventWrapper.VK_D, "D");
        this._E = new PCGameKey(this.keyEventWrapper.VK_E, "E");
        this._F = new PCGameKey(this.keyEventWrapper.VK_F, "F");
        this._G = new PCGameKey(this.keyEventWrapper.VK_G, "G");
        this._H = new PCGameKey(this.keyEventWrapper.VK_H, "H");
        this._I = new PCGameKey(this.keyEventWrapper.VK_I, "I");
        this._J = new PCGameKey(this.keyEventWrapper.VK_J, "J");
        this._K = new PCGameKey(this.keyEventWrapper.VK_K, "K");
        this._L = new PCGameKey(this.keyEventWrapper.VK_L, "L");
        this._M = new PCGameKey(this.keyEventWrapper.VK_M, "M");
        this._N = new PCGameKey(this.keyEventWrapper.VK_N, "N");
        this._O = new PCGameKey(this.keyEventWrapper.VK_O, "O");
        this._P = new PCGameKey(this.keyEventWrapper.VK_P, "P");
        this._Q = new PCGameKey(this.keyEventWrapper.VK_Q, "Q");
        this._R = new PCGameKey(this.keyEventWrapper.VK_R, "R");
        this._S = new PCGameKey(this.keyEventWrapper.VK_S, "S");
        this._T = new PCGameKey(this.keyEventWrapper.VK_T, "T");
        this._U = new PCGameKey(this.keyEventWrapper.VK_U, "U");
        this._V = new PCGameKey(this.keyEventWrapper.VK_V, "V");
        this._W = new PCGameKey(this.keyEventWrapper.VK_W, "W");
        this._X = new PCGameKey(this.keyEventWrapper.VK_X, "X");
        this._Y = new PCGameKey(this.keyEventWrapper.VK_Y, "Y");
        this._Z = new PCGameKey(this.keyEventWrapper.VK_Z, "Z");
        this.ZERO = new PCGameKey(this.keyEventWrapper.VK_0, CommonPhoneStrings.getInstance().ZERO);
        this.ONE = new PCGameKey(this.keyEventWrapper.VK_1, CommonPhoneStrings.getInstance().ONE);
        this.TWO = new PCGameKey(this.keyEventWrapper.VK_2, CommonPhoneStrings.getInstance().TWO);
        this.THREE = new PCGameKey(this.keyEventWrapper.VK_3, CommonPhoneStrings.getInstance().THREE);
        this.FOUR = new PCGameKey(this.keyEventWrapper.VK_4, CommonPhoneStrings.getInstance().FOUR);
        this.FIVE = new PCGameKey(this.keyEventWrapper.VK_5, CommonPhoneStrings.getInstance().FIVE);
        this.SIX = new PCGameKey(this.keyEventWrapper.VK_6, CommonPhoneStrings.getInstance().SIX);
        this.SEVEN = new PCGameKey(this.keyEventWrapper.VK_7, CommonPhoneStrings.getInstance().SEVEN);
        this.EIGHT = new PCGameKey(this.keyEventWrapper.VK_8, CommonPhoneStrings.getInstance().EIGHT);
        this.NINE = new PCGameKey(this.keyEventWrapper.VK_9, CommonPhoneStrings.getInstance().NINE);
        this.DPAD_UP = new PCGameKey(this.keyEventWrapper.VK_UP, CommonPhoneStrings.getInstance().UP);
        this.DPAD_DOWN = new PCGameKey(this.keyEventWrapper.VK_DOWN, CommonPhoneStrings.getInstance().DOWN);
        this.DPAD_LEFT = new PCGameKey(this.keyEventWrapper.VK_LEFT, CommonPhoneStrings.getInstance().LEFT);
        this.DPAD_RIGHT = new PCGameKey(this.keyEventWrapper.VK_RIGHT, CommonPhoneStrings.getInstance().RIGHT);
        this.DPAD_UP2 = this.DPAD_UP;
        this.DPAD_DOWN2 = this.DPAD_DOWN;
        this.DPAD_LEFT2 = this.DPAD_LEFT;
        this.DPAD_RIGHT2 = this.DPAD_RIGHT;
        this.COMMA = new PCGameKey(this.keyEventWrapper.VK_COMMA, "COMMA");
        this.SPACE = new PCGameKey(this.keyEventWrapper.VK_SPACE, "SPACE");
        this.DEL = new PCGameKey(this.keyEventWrapper.VK_DELETE, "DEL");
        this.PERIOD = new PCGameKey(this.keyEventWrapper.VK_PERIOD, CommonSeps.getInstance().PERIOD);
        this.ESCAPE = new PCGameKey(this.keyEventWrapper.VK_ESCAPE, "Esc");
        this.BACK_SPACE = new PCGameKey(this.keyEventWrapper.VK_BACK_SPACE, "Backspace");
    }
}

