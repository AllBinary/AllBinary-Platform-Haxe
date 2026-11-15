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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class TouchScreenFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final SINGLETON : TouchScreenFactory = new TouchScreenFactory();
    private var touch : Bool = false;
    private var multiTouch : Bool = false;
    private var multiTouchDistinct : Bool = false;
    private var touchScreenType : TouchScreenType = TouchScreenTypesFactory.getInstance().NOTOUCH;
    public function new() {
        try {
            this.setTouch(true);
            this.setMultiTouch(false);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, TouchScreenFactory.SINGLETON, commonStrings.GET_INSTANCE, e);
        }
    }

    public static function getInstance() : TouchScreenFactory {
        return TouchScreenFactory.SINGLETON;
    }

    public function setMultiTouch(multiTouch : Bool) : Void {
        this.multiTouch = multiTouch;
    }

    public function isMultiTouch() : Bool {
        return this.multiTouch;
    }

    public function setTouch(touch : Bool) : Void {
        this.touch = touch;
    }

    public function isTouch() : Bool {
        return this.touch;
    }

    public function setMultiTouchDistinct(multiTouchDistinct : Bool) : Void {
        this.multiTouchDistinct = multiTouchDistinct;
    }

    public function isMultiTouchDistinct() : Bool {
        return this.multiTouchDistinct;
    }

    public function setTouchScreenType(touchScreenType : TouchScreenType) : Void {
        this.touchScreenType = touchScreenType;
    }

    public function getTouchScreenType() : TouchScreenType {
        return this.touchScreenType;
    }

    public function toString() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("TouchScreen: ");
        stringBuffer.appendboolean(this.isTouch());
        stringBuffer.append(" MultiTouch: ");
        stringBuffer.appendboolean(this.isMultiTouch());
        stringBuffer.append(" Distinct MultiTouch: ");
        stringBuffer.appendboolean(this.isMultiTouchDistinct());
        stringBuffer.append(" TouchScreenType: ");
        stringBuffer.append(StringUtil.getInstance().toString(this.getTouchScreenType()));
        return stringBuffer.toString();
    }

}

