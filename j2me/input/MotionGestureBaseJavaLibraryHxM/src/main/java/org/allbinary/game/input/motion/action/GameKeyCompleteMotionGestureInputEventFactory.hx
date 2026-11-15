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
package org.allbinary.game.input.motion.action;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GameKeyCompleteMotionGestureInputEventFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final SINGLETON : GameKeyCompleteMotionGestureInputEventFactory = new GameKeyCompleteMotionGestureInputEventFactory();
    private final eventList : BasicArrayList = new BasicArrayListD();
    public static function getInstance() : GameKeyCompleteMotionGestureInputEventFactory {
        return GameKeyCompleteMotionGestureInputEventFactory.SINGLETON;
    }

    public function add(gameKeyCompleteMotionGestureInputEvent : GameKeyCompleteMotionGestureInputEvent) : Void {
        this.eventList.add(gameKeyCompleteMotionGestureInputEvent);
    }

    public function updateAll() : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START_LABEL).appendint(this.eventList.size())), this, "updateAll");
        {
            var index : Int = this.eventList.size() - 1;
            while (index >= 0) {
            var gameKeyCompleteMotionGestureInputEvent : GameKeyCompleteMotionGestureInputEvent = (cast this.eventList.objectArray[index] : GameKeyCompleteMotionGestureInputEvent);
            gameKeyCompleteMotionGestureInputEvent.update();
                index--;
            }
        }
    }

    public function new() {
    }
}

