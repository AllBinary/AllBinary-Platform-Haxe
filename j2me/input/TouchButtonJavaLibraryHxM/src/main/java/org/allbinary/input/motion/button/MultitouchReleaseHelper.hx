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

import org.allbinary.game.input.event.GameKeyEvent;

class MultitouchReleaseHelper extends ReleaseHelper {
    public function new(touchButtonRecognizer : TouchButtonRecognizer) {
        super(touchButtonRecognizer);
    }

    // throws Exception
    public override function release(touchButtonInput : TouchButtonInput, deviceId : Int) : Void {
        final cancelTouchButtonInput : TouchButtonInput = CancelTouchButtonInputFactory.getInstance().getCancel(touchButtonInput);
        var nextTouchButtonInput : TouchButtonInput = null;
        var gameKeyEvent : GameKeyEvent = null;
        {
            var index : Int = this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.size() - 1;
            while (index >= 0) {
            nextTouchButtonInput = this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.get(index);
            if (cancelTouchButtonInput == nextTouchButtonInput) {
                gameKeyEvent = nextTouchButtonInput.getGameKeyEvent();
                this.touchButtonRecognizer.upGameKeyEventHandler.fireEvent(gameKeyEvent);
                this.touchButtonRecognizer.upGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
                this.touchButtonRecognizer.currentlyPressedTouchButtonSingleton.removeAt(index);
            }
                index--;
            }
        }
    }

}

