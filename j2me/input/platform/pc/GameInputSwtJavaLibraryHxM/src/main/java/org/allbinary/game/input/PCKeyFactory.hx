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

    public final UNKNOWN : PCGameKey = new PCGameKey(254, "UNKNOWN");
    public final ENTER : PCGameKey = new PCGameKey(13, "Enter");
    public final _A : PCGameKey = new PCGameKey(65, "A");
    public final _B : PCGameKey = new PCGameKey(66, "B");
    public final _C : PCGameKey = new PCGameKey(67, "C");
    public final _D : PCGameKey = new PCGameKey(68, "D");
    public final _E : PCGameKey = new PCGameKey(69, "E");
    public final _F : PCGameKey = new PCGameKey(70, "F");
    public final _G : PCGameKey = new PCGameKey(71, "G");
    public final _H : PCGameKey = new PCGameKey(72, "H");
    public final _I : PCGameKey = new PCGameKey(73, "I");
    public final _J : PCGameKey = new PCGameKey(74, "J");
    public final _K : PCGameKey = new PCGameKey(75, "K");
    public final _L : PCGameKey = new PCGameKey(76, "L");
    public final _M : PCGameKey = new PCGameKey(77, "M");
    public final _N : PCGameKey = new PCGameKey(78, "N");
    public final _O : PCGameKey = new PCGameKey(79, "O");
    public final _P : PCGameKey = new PCGameKey(80, "P");
    public final _Q : PCGameKey = new PCGameKey(81, "Q");
    public final _R : PCGameKey = new PCGameKey(82, "R");
    public final _S : PCGameKey = new PCGameKey(83, "S");
    public final _T : PCGameKey = new PCGameKey(84, "T");
    public final _U : PCGameKey = new PCGameKey(85, "U");
    public final _V : PCGameKey = new PCGameKey(86, "V");
    public final _W : PCGameKey = new PCGameKey(87, "W");
    public final _X : PCGameKey = new PCGameKey(88, "X");
    public final _Y : PCGameKey = new PCGameKey(89, "Y");
    public final _Z : PCGameKey = new PCGameKey(90, "Z");
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
    public final ZERO : PCGameKey = new PCGameKey(48, CommonPhoneStrings.getInstance().ZERO);
    public final ONE : PCGameKey = new PCGameKey(49, CommonPhoneStrings.getInstance().ONE);
    public final TWO : PCGameKey = new PCGameKey(50, CommonPhoneStrings.getInstance().TWO);
    public final THREE : PCGameKey = new PCGameKey(51, CommonPhoneStrings.getInstance().THREE);
    public final FOUR : PCGameKey = new PCGameKey(52, CommonPhoneStrings.getInstance().FOUR);
    public final FIVE : PCGameKey = new PCGameKey(53, CommonPhoneStrings.getInstance().FIVE);
    public final SIX : PCGameKey = new PCGameKey(54, CommonPhoneStrings.getInstance().SIX);
    public final SEVEN : PCGameKey = new PCGameKey(55, CommonPhoneStrings.getInstance().SEVEN);
    public final EIGHT : PCGameKey = new PCGameKey(56, CommonPhoneStrings.getInstance().EIGHT);
    public final NINE : PCGameKey = new PCGameKey(57, CommonPhoneStrings.getInstance().NINE);
    public final DPAD_UP : PCGameKey = new PCGameKey(38, CommonPhoneStrings.getInstance().UP);
    public final DPAD_DOWN : PCGameKey = new PCGameKey(40, CommonPhoneStrings.getInstance().DOWN);
    public final DPAD_LEFT : PCGameKey = new PCGameKey(37, CommonPhoneStrings.getInstance().LEFT);
    public final DPAD_RIGHT : PCGameKey = new PCGameKey(39, CommonPhoneStrings.getInstance().RIGHT);
    public final DPAD_UP2 : PCGameKey = this.DPAD_UP;
    public final DPAD_DOWN2 : PCGameKey = this.DPAD_DOWN;
    public final DPAD_LEFT2 : PCGameKey = this.DPAD_LEFT;
    public final DPAD_RIGHT2 : PCGameKey = this.DPAD_RIGHT;
    public final COMMA : PCGameKey = new PCGameKey(44, "COMMA");
    public final SPACE : PCGameKey = new PCGameKey(32, "SPACE");
    public final DEL : PCGameKey = new PCGameKey(46, "DEL");
    public final STAR : PCGameKey = new PCGameKey(42, CommonPhoneStrings.getInstance().STAR);
    public final QUESTION : PCGameKey = new PCGameKey(47, "?");
    public final PERIOD : PCGameKey = new PCGameKey(46, CommonSeps.getInstance().PERIOD);
    public final ESCAPE : PCGameKey = new PCGameKey(27, "Esc");
    public final BACK_SPACE : PCGameKey = new PCGameKey(8, "Backspace");
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

