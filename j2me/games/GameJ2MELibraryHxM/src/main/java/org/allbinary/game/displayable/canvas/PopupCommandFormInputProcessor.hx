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
package org.allbinary.game.displayable.canvas;

import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.util.BasicArrayList;

class PopupCommandFormInputProcessor extends CommandFormInputProcessor {
    public function new(gameKeyEventList : BasicArrayList, playerInputId : Int, gameCanvas : MyCanvas, form : ScrollSelectionForm, popupMenuInputProcessor : PopupMenuInputProcessor) {
        super(gameKeyEventList, playerInputId, gameCanvas, form);
    }

    // throws Exception
    public override function processInput(key : Int) : Int {
        return super.processInput(key);
    }

    // throws Exception
    public override function processMotionInput(motionGestureEvent : MotionGestureEvent) : Void {
        super.processMotionInput(motionGestureEvent);
    }

}

