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

import org.allbinary.game.input.CompleteMotionGestureInputEvent;
import org.allbinary.game.input.CompleteMotionGestureInputEventHandler;
import org.allbinary.game.input.CompleteMotionGestureInputEventListenerInterface;
import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.mapping.InputMappingInterface;
import org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.paint.ProcessPaintable;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.time.TimeDelayHelper;

class TouchButtonsPaintableComposite extends ProcessPaintable implements CompleteMotionGestureInputEventListenerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var inputMappingInterface : InputMappingInterface;
    public var touchButtonsPaintable : TouchButtonsMappingPaintable;
    private var timeHelper : TimeDelayHelper = new TimeDelayHelper(250);
    private var released : Bool = true;
    public function new(inputMappingInterface : InputMappingInterface, basicColor : BasicColor) {
        super();
        this.inputMappingInterface = inputMappingInterface;
        CompleteMotionGestureInputEventHandler.getInstance().addListenerInterface(this);
        this.touchButtonsPaintable = new TouchButtonsMappingPaintable(basicColor);
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    private final METHOD_NAME : String = "onCompleteMotionGestureInputEvent";
    private final RELEASE : String = "Ignoring: MotionGestureInput Release";
    private final FAST_REPEAT : String = "Ignoring: MotionGestureInput Repeated To Quickly";
    private final IGNORE : String = "Ignoring: Until Released";
    public override function onCompleteMotionGestureInputEvent(completeMotionGestureInputEvent : CompleteMotionGestureInputEvent) : Void {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "onCompleteMotionGestureInputEvent");
            final touchMotionGestureFactory : TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
            final gameKeyCompleteMotionGestureInputEvent : GameKeyCompleteMotionGestureInputEvent = (cast completeMotionGestureInputEvent : GameKeyCompleteMotionGestureInputEvent);
            final gameKey : GameKey = gameKeyCompleteMotionGestureInputEvent.getGameKey();
            final motionGestureInput : MotionGestureInput = completeMotionGestureInputEvent.getMotionGestureInput();
            if (motionGestureInput == touchMotionGestureFactory.RELEASED) {
                this.logUtil.putF(this.RELEASE, this, this.METHOD_NAME);
                this.released = true;
                return;
            }
            if (motionGestureInput == TouchMotionGestureFactory.getInstance().NO_MOTION && !this.timeHelper.isTimeTNT()) {
                this.logUtil.putF(this.FAST_REPEAT, this, this.METHOD_NAME);
                return;
            }
            if (!this.released) {
                this.logUtil.putF(this.IGNORE, this, this.METHOD_NAME);
                return;
            }
            this.released = false;
            this.logUtil.putF(Std.string(new StringMaker().append("GameKey: ").append(StringUtil.getInstance().toString(gameKey)).append(" MotionGestureInput: ").append(StringUtil.getInstance().toString(motionGestureInput))), this, this.METHOD_NAME);
            this.inputMappingInterface.processInputMapping(gameKey, motionGestureInput);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.METHOD_NAME, e);
        }
    }

    public override function process() : Void {
        CompleteMotionGestureInputEventHandler.getInstance().removeListener(this);
    }

}

