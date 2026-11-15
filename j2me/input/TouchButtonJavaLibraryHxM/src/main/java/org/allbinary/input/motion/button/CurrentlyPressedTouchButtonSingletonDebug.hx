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
package org.allbinary.input.motion.button;

import org.allbinary.graphics.GPoint;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;

class CurrentlyPressedTouchButtonSingletonDebug extends CurrentlyPressedTouchButtonSingleton {
    private static final instanceC : CurrentlyPressedTouchButtonSingletonDebug = new CurrentlyPressedTouchButtonSingletonDebug();
    public static function getInstance() : CurrentlyPressedTouchButtonSingleton {
        return CurrentlyPressedTouchButtonSingletonDebug.instanceC;
    }

    private var string : String = StringUtil.getInstance().EMPTY_STRING;
    private var listString : String = StringUtil.getInstance().EMPTY_STRING;
    private var appendText : String = StringUtil.getInstance().EMPTY_STRING;
    private final PRESSED_AND_FIRED : String = "pressed & fired";
    private final PRESSED_AND_NOT_FIRED : String = "pressed in button but not fired";
    private final ASSOCIATED_RELEASED_AND_FIRED : String = "assoc. rel & fired";
    private final RELEASED_AND_FIRED : String = "rel & fired 1";
    private final RELEASED_AND_FIRED_2 : String = "rel & fired 2";
    private final RELEASED_AND_NOT_FIRED : String = "rel & not fired";
    private function appendTouchButtonInput(append : String, touchButtonInput : TouchButtonInput) : Void {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(Std.string(touchButtonInput));
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(append);
        this.appendText = Std.string(stringBuffer);
        this.string = Std.string(new StringMaker().append(this.listString).append(this.appendText));
    }

    private function append(append : String) : Void {
        this.appendText = Std.string(new StringMaker().append(this.appendText).append(append));
        this.string = Std.string(new StringMaker().append(this.listString).append(this.appendText));
    }

    public function clearLog(x : Int, y : Int) : Void {
        this.appendText = Std.string(new StringMaker().append(GPoint.toStringStatic(x, y, 0)).append(CommonSeps.getInstance().SPACE));
        this.string = Std.string(new StringMaker().append(this.listString).append(this.appendText));
    }

    public function releaseAndNotFired() : Void {
        this.append(this.RELEASED_AND_NOT_FIRED);
    }

    public function releaseAndFired(touchButtonInput : TouchButtonInput) : Void {
        this.appendTouchButtonInput(this.RELEASED_AND_FIRED, touchButtonInput);
    }

    public function releaseAndFired2(touchButtonInput : TouchButtonInput) : Void {
        this.appendTouchButtonInput(this.RELEASED_AND_FIRED_2, touchButtonInput);
    }

    public function releaseAndFiredAssociated(touchButtonInput : TouchButtonInput) : Void {
        this.appendTouchButtonInput(this.ASSOCIATED_RELEASED_AND_FIRED, touchButtonInput);
    }

    public function pressedAndFired(touchButtonInput : TouchButtonInput) : Void {
        this.appendTouchButtonInput(this.PRESSED_AND_FIRED, touchButtonInput);
    }

    public function pressedAndNotFired(touchButtonInput : TouchButtonInput) : Void {
        this.appendTouchButtonInput(this.PRESSED_AND_NOT_FIRED, touchButtonInput);
    }

    public override function removeAt(index : Int) : TouchButtonInput {
        var touchButtonInput : TouchButtonInput = super.removeAt(index);
        this.listString = Std.string(this.list);
        this.string = Std.string(new StringMaker().append(this.listString).append(this.appendText));
        return touchButtonInput;
    }

    public override function remove(touchButtonInput : TouchButtonInput) : Bool {
        var isRemoved : Bool = super.remove(touchButtonInput);
        this.listString = Std.string(this.list);
        this.string = Std.string(new StringMaker().append(this.listString).append(this.appendText));
        return isRemoved;
    }

    public override function add(touchButtonInput : TouchButtonInput) : Void {
        super.add(touchButtonInput);
        this.listString = Std.string(this.list);
        this.string = Std.string(new StringMaker().append(this.listString).append(this.appendText));
    }

    public function toString() : String {
        return this.string;
    }

    public function new() {
        super();
    }
}

