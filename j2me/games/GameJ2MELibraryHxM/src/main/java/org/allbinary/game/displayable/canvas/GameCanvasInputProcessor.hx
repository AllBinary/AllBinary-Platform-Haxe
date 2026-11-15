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
import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyEventSourceInterface;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.input.InputProcessor;
import org.allbinary.game.input.PlatformInputMappingFactory;
import org.allbinary.game.input.event.DownGameKeyEventHandler;
import org.allbinary.game.input.event.DownKeyEventHandler;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.input.event.UpGameKeyEventHandler;
import org.allbinary.game.input.mapping.InputToGameKeyMapping;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;

class GameCanvasInputProcessor extends InputProcessor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final allBinaryGameCanvas : AllBinaryGameCanvas;
    private final downGameKeyEventHandler : DownGameKeyEventHandler = DownGameKeyEventHandler.getInstance();
    private final upGameKeyEventHandler : UpGameKeyEventHandler = UpGameKeyEventHandler.getInstance();
    private final downKeyEventHandler : DownKeyEventHandler = DownKeyEventHandler.getInstance();
    private final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
    private final inputToGameKeyMapping : InputToGameKeyMapping = PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance().getInputMapping();
    public function new(allBinaryGameCanvas : AllBinaryGameCanvas) {
        super();
        this.allBinaryGameCanvas = allBinaryGameCanvas;
        this.inputToGameKeyMapping.init(this.allBinaryGameCanvas);
    }

    private final NONE : GameKey = GameKeyFactory.getInstance().NONE;
    private final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
    public override function keyPressedByDevice(keyCode : Int, deviceId : Int) : Void {
        try {
            final gameKey : GameKey = this.inputToGameKeyMapping.getInstanceForCanvas(this.allBinaryGameCanvas, keyCode);
            if (gameKey != this.NONE) {
                final gameKeyEvent : GameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(this.allBinaryGameCanvas, gameKey);
                this.downGameKeyEventHandler.fireEvent(gameKeyEvent);
                this.downGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
            } else {
                this.logUtil.putF(Std.string(new StringMaker().append(this.gameInputStrings.NO_KEY).appendint(keyCode)), this, this.gameInputStrings.ADD_KEY_EVENT);
            }
            final keyCodeAsInteger : Null<Int> = this.smallIntegerSingletonFactory.getAtNoThrow(keyCode);
            this.downKeyEventHandler.fireEventI(keyCodeAsInteger);
            this.downKeyEventHandler.getInstanceForDevice(deviceId).fireEventI(keyCodeAsInteger);
        } catch (e : haxe.Exception) {
            this.logUtil.put("Key Event Error", this, this.gameInputStrings.ADD_KEY_EVENT, e);
        }
    }

    public override function keyReleasedByDevice(canvas : Canvas, keyCode : Int, deviceId : Int) : Void {
        this.removeGameKeyEvent(canvas, keyCode, deviceId, false);
    }

    private function removeGameKeyEvent(canvas : Canvas, keyCode : Int, deviceId : Int, repeated : Bool) : Void {
        try {
            final gameKey : GameKey = this.inputToGameKeyMapping.getInstanceForCanvas(canvas, keyCode);
            if (gameKey != this.NONE) {
                final gameKeyEventSourceInterface : GameKeyEventSourceInterface = (cast canvas : GameKeyEventSourceInterface);
                final gameKeyEvent : GameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(gameKeyEventSourceInterface, gameKey);
                this.upGameKeyEventHandler.fireEvent(gameKeyEvent);
                this.upGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
            } else {
                this.logUtil.putF(Std.string(new StringMaker().append(this.gameInputStrings.NO_KEY).appendint(keyCode)), this, this.gameInputStrings.REMOVE_KEY_EVENT);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put("Key Event Error", this, this.gameInputStrings.REMOVE_KEY_EVENT, e);
        }
    }

}

