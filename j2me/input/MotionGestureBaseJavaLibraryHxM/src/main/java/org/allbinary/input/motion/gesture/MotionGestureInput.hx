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
package org.allbinary.input.motion.gesture;

import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputFactory;

class MotionGestureInput extends Input {
    public function new(id : Int, name : String) {
        super(id, name);
        final inputFactory : InputFactory = InputFactory.getInstance();
        inputFactory.add(this.getId(), this);
    }

}

