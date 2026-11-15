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

//import javax.microedition.lcdui.Canvas;
import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyEventSourceInterface;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputFactory;
import org.allbinary.game.input.InputProcessor;
import org.allbinary.game.input.PlatformKeyFactory;
import org.allbinary.game.input.event.DownKeyEventHandler;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventFactory;
import org.allbinary.game.input.event.UpGameKeyEventHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class FormInputProcessor extends InputProcessor {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final gameKeyEventFactory : GameKeyEventFactory = GameKeyEventFactory.getInstance();
    private final downKeyEventHandler : DownKeyEventHandler = DownKeyEventHandler.getInstance();
    private final upGameKeyEventHandler : UpGameKeyEventHandler = UpGameKeyEventHandler.getInstance();
    private final inputFactory : InputFactory = InputFactory.getInstance();
    private final platformKeyFactory : PlatformKeyFactory = PlatformKeyFactory.getInstance();
    private final allBinaryGameCanvas : AllBinaryGameCanvas;
    public function new(allBinaryGameCanvas : AllBinaryGameCanvas) {
        super();
        this.allBinaryGameCanvas = allBinaryGameCanvas;
    }

    public override function keyPressedByDevice(keyCode : Int, deviceId : Int) : Void {
        try {
            PreLogUtil.put(new StringMaker().append(this.inputFactory.KEY_CODE_LABEL).appendint(keyCode).append(CommonSeps.getInstance().SPACE).append(this.inputFactory.DEVICE_ID_LABEL).appendint(deviceId).toString(), this, this.gameInputStrings.KEY_PRESSED);
            final input : Input = this.inputFactory.getInstanceById(keyCode);
            final gameKeyEvent : GameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(this.allBinaryGameCanvas, input);
            this.downKeyEventHandler.fireEventForGameKeyEvent(gameKeyEvent);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.ADD_KEY_EVENT, e);
        }
    }

    public override function keyReleasedByDevice(canvas : Canvas, keyCode : Int, deviceId : Int) : Void {
        try {
            final input : Input = this.inputFactory.getInstanceById(keyCode);
            if (this.platformKeyFactory.isEnter(input)) {
                PreLogUtil.put(new StringMaker().append(this.inputFactory.KEY_CODE_LABEL).appendint(keyCode).append(CommonSeps.getInstance().SPACE).append(this.inputFactory.DEVICE_ID_LABEL).appendint(deviceId).toString(), this, this.gameInputStrings.KEY_RELEASED);
                final gameKey : GameKey = GameKeyFactory.getInstance().KEY_NUM0;
                final gameKeyEventSourceInterface : GameKeyEventSourceInterface = (cast canvas : GameKeyEventSourceInterface);
                final gameKeyEvent : GameKeyEvent = this.gameKeyEventFactory.getInstanceForInput(gameKeyEventSourceInterface, gameKey);
                this.upGameKeyEventHandler.fireEvent(gameKeyEvent);
                this.upGameKeyEventHandler.getInstanceForDevice(deviceId).fireEvent(gameKeyEvent);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.gameInputStrings.ADD_KEY_EVENT, e);
        }
    }

}

