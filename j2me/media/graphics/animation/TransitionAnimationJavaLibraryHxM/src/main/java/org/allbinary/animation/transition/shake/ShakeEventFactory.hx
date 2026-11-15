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
package org.allbinary.animation.transition.shake;


class ShakeEventFactory {
    private static final instance : ShakeEventFactory = new ShakeEventFactory();
    public static function getInstance() : ShakeEventFactory {
        return ShakeEventFactory.instance;
    }

    public var MICRO : ShakeEvent = new ShakeEvent();
    public var SMALL : ShakeEvent = new ShakeEvent();
    public var MEDIUM : ShakeEvent = new ShakeEvent();
    public var LARGE : ShakeEvent = new ShakeEvent();
    public function init() : Void {
    }

    public function new() {
    }
}

