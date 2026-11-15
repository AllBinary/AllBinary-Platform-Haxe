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
package org.allbinary.animation;

import org.allbinary.logic.util.event.handler.BasicEventHandler;

class AnimationEventHandler extends BasicEventHandler {
    private static final eventHandler : AnimationEventHandler = new AnimationEventHandler();
    public function new() {
        super();
    }

    // synchronized
    public static function getInstance() : AnimationEventHandler {
        return AnimationEventHandler.eventHandler;
    }

}

