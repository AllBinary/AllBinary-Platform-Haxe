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

import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Command;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.layer.SWTUtil;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.graphics.form.CommandCurrentSelectionForm;
import org.allbinary.graphics.form.ScrollSelectionForm;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.media.audio.PrimaryPlayerQueueFactory;
import org.allbinary.media.audio.SelectSound;
import org.allbinary.thread.PrimaryThreadPool;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;

//In general allow scrolling of the menu and selection the center item
class CommandFormInputProcessor extends BasicMenuInputProcessor {
    private final MOTION_GESTURE_SOURCE_ID : Int = GameKeyEventFactory.getInstance().MOTION_GESTURE_SOURCE_ID;
    private final CLICK_DELAY : Int = 150;
    private final clickTimeHelper : TimeDelayHelper;
    private final DOUBLE_CLICK_DELAY : Int = 1200;
    private final doubleClickTimeHelper : TimeDelayHelper;
    public final isSingleKeyProcessing : Bool = InputFeatureFactory.getInstance().isSingleKeyProcessing();
    private var form : ScrollSelectionForm;
    private var hasPressed : Bool = false;
    public function new(gameKeyEventList : BasicArrayList, playerInputId : Int, gameCanvas : MyCanvas, form : ScrollSelectionForm) {
        super(gameKeyEventList, playerInputId, gameCanvas);
        this.clickTimeHelper = new TimeDelayHelper(this.CLICK_DELAY);
        this.doubleClickTimeHelper = new TimeDelayHelper(this.DOUBLE_CLICK_DELAY);
        this.form = form;
    }

    // throws Exception
    public function processInput(key : Int) : Int {
        if (key == Canvas.LEFT || key == Canvas.RIGHT || key == Canvas.UP || key == Canvas.DOWN) {
            PrimaryPlayerQueueFactory.getInstance().add(SelectSound.getInstance());
            this.form.processInputKey(key);
            return 1;
        } else if (key == Canvas.FIRE) {
            PrimaryPlayerQueueFactory.getInstance().add(SelectSound.getInstance());
            return this.processCommand();
        }
        return 0;
    }

    private final PROCESS_COMMAND : String = "processCommand";
    private function processCommand() : Int {
        final commandCurrentSelectionForm : CommandCurrentSelectionForm = (cast this.form : CommandCurrentSelectionForm);
        final command : Command = commandCurrentSelectionForm.getSelectedCommand();
        this.logUtil.putF(Std.string(command), this, this.PROCESS_COMMAND);
        final features : Features = Features.getInstance();
        final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        if (SWTUtil.isSWT && features.isFeature(openGLFeatureFactory.OPENGL) && command != GameCommandsFactory.getInstance().EXIT_COMMAND) {
            new CommandRunnable(this, command).run();
        } else {
            PrimaryThreadPool.getInstance().runTask(new CommandRunnable(this, command));
        }
        if (command == GameCommandsFactory.getInstance().QUIT_COMMAND) {
            return -1;
        } else {
            return 1;
        }
    }

    // throws Exception
    public override function processInputList() : Int {
        try {
            final motionInputsIndex : Int = this.processMotionInputs();
            final list : BasicArrayList = this.getGameKeyEventList();
            final size : Int = list.size();
            var key : Int = 0;
            var gameKeyEvent : GameKeyEvent = null;
            for (index in 0...size) {
                gameKeyEvent = (cast list.objectArray[index] : GameKeyEvent);
                key = gameKeyEvent.getKey();
                if (gameKeyEvent.getSourceId() != this.MOTION_GESTURE_SOURCE_ID) {
                    if (this.processInput(key) == 1) {
                        break;
                    }
                }
            }
            this.clear();
            if (size > 0 || motionInputsIndex >= 0) {
                return 1;
            } else {
                return -1;
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.PROCESS_INPUT, e);
            return -1;
        }
    }

    // throws Exception
    public function processMotionInputs() : Int {
        final lastIndex : Int = this.motionGestureEventList.size() - 1;
        if (lastIndex >= 0) {
            final motionGestureEvent : MotionGestureEvent = (cast this.motionGestureEventList.objectArray[lastIndex] : MotionGestureEvent);
            this.processMotionInput(motionGestureEvent);
        }
        this.motionGestureEventList.clear();
        return lastIndex;
    }

    // throws Exception
    public function processMotionInput(motionGestureEvent : MotionGestureEvent) : Void {
        final touchMotionGestureFactory : TouchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
        final motionGestureInput : MotionGestureInput = motionGestureEvent.getMotionGesture();
        if (motionGestureInput == touchMotionGestureFactory.RELEASED) {
            final point : GPoint = motionGestureEvent.getCurrentPoint();
            if (this.form.isInForm(point)) {
                final index : Int = this.form.getSelectedIndexForPoint(point);
                if (index != -1) {
                    PrimaryPlayerQueueFactory.getInstance().add(SelectSound.getInstance());
                    if (index == this.form.getSelectedIndex()) {
                        if (this.clickTimeHelper.isTimeTNT()) {
                            this.processCommand();
                        }
                    } else {
                        this.form.setSelectedIndex(index);
                    }
                } else {
                }
            }
            if (this.hasPressed) {
                if (!this.doubleClickTimeHelper.isTimeTNT()) {
                    this.logUtil.putF("Double Press", this, this.gameInputStrings.PROCESS_MOTION_INPUT);
                    this.processCommand();
                }
                this.doubleClickTimeHelper.delay = this.DOUBLE_CLICK_DELAY;
                this.doubleClickTimeHelper.setStartTimeTNT();
            }
            this.hasPressed = false;
        } else if (motionGestureInput == touchMotionGestureFactory.PRESSED) {
            this.doubleClickTimeHelper.delay = 0;
            this.hasPressed = true;
        }
    }

    private final NAME_LABEL : String = " ScrollSelectionForm: ";
    public function toString() : String {
        return Std.string(new StringMaker().append(jre.lang.JavaObject.objectToString(this)).append(this.NAME_LABEL).append(Std.string(this.form)));
    }

}

