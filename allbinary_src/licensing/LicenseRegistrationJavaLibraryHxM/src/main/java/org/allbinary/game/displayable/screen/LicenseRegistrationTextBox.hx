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
package org.allbinary.game.displayable.screen;

//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Font;
//import javax.microedition.lcdui.Graphics;
//import javax.microedition.lcdui.TextField;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.form.item.CustomTextBox;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.graphics.paint.Paintable;
import org.allbinary.graphics.paint.SimpleTextPaintable;
import org.allbinary.input.event.VirtualKeyboardEventHandler;

class LicenseRegistrationTextBox extends CustomTextBox {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final DISPLAY_COMMAND : Command = new Command("Register", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3);
    public static final SUBMIT_COMMAND : Command = new Command("Submit", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 3);
    private final pleaseWaitPaintable : Paintable = new SimpleTextPaintable(commonStrings.PLEASE_WAIT, BasicColorFactory.getInstance().WHITE);
    private var paintable : Paintable = NullPaintable.getInstance();
    public function new(cmdListener : CommandListener, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(cmdListener, "Enter Registration Code:", StringUtil.getInstance().EMPTY_STRING, 60, TextField.ANY, Font.getDefaultFont(), backgrounBasicColor, foregroundBasicColor);
    }

    public function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        this.addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS);
        this.addCommand(GameCommandsFactory.getInstance().TOGGLE_KEYBOARD);
        this.addCommand(SUBMIT_COMMAND);
        this.setCommandListener(cmdListener);
    }

    public function open() : Void {
        try {
            var virtualKeyboardEventHandler : VirtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance();
            virtualKeyboardEventHandler.fireEvent(virtualKeyboardEventHandler.SHOW_EVENT);
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, "open", e);
        }
        super.open();
        this.paintable = NullPaintable.getInstance();
        this.repaint();
    }

    // throws Exception
    public function close() : Void {
        try {
            var virtualKeyboardEventHandler : VirtualKeyboardEventHandler = VirtualKeyboardEventHandler.getInstance();
            virtualKeyboardEventHandler.fireEvent(virtualKeyboardEventHandler.HIDE_EVENT);
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, "open", e);
        }
        this.paintable = this.pleaseWaitPaintable;
        this.repaint();
        super.close();
    }

    public function paint(graphics : Graphics) : Void {
        super.paint(graphics);
        this.paintable.paint(graphics);
    }

    public function submit() : Void {
        var commandListener : CommandListener = this.getCustomCommandListener();
        commandListener.commandAction(SUBMIT_COMMAND, this);
    }

}

