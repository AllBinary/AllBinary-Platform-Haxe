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


class TouchScreenFactory {
    private static final SINGLETON : TouchScreenFactory = new TouchScreenFactory();
    private var multiTouch : Bool = false;
    private var touch : Bool = false;
    private var touchScreenType : TouchScreenType = TouchScreenTypesFactory.getInstance().NOTOUCH;
    public function new() {
    }

    public static function getInstance() : TouchScreenFactory {
        return TouchScreenFactory.SINGLETON;
    }

    public function isMultiTouch() : Bool {
        return this.multiTouch;
    }

    public function setTouch(touch : Bool) : Void {
    }

    public function isTouch() : Bool {
        return this.touch;
    }

    public function getTouchScreenType() : TouchScreenType {
        return this.touchScreenType;
    }

}

