/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2002 AllBinary 
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
package org.allbinary.graphics.displayable.screen;

//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Form;
//import javax.microedition.lcdui.NullCommandListener;
import org.allbinary.canvas.Processor;
import org.allbinary.game.displayable.canvas.MenuListener;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.displayable.command.MyCommandInterface;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABStack;

class CommandForm extends Form implements MyCommandInterface implements MenuListener {
    private static var NULL_COMMAND_FORM : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullCommandForm() : CommandForm {
        if (CommandForm.NULL_COMMAND_FORM == NullUtil.getInstance().NULL_OBJECT) {
            CommandForm.NULL_COMMAND_FORM = new CommandForm(NullCommandListener.NULL_COMMAND_LISTENER, StringUtil.getInstance().EMPTY_STRING, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE);
        }
        return (cast CommandForm.NULL_COMMAND_FORM : CommandForm);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final repaintProcessor : Processor = ScreenRepaintProcessorFactory.getInstance().create(this);
    private var commandStack : ABStack<Any>;
    public function new(commandListener : CommandListener, formTitle : String, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(formTitle);
        this.commandStack = StdUtil.getInstance().createStack();
        try {
            this.repaintProcessor.process();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e);
        }
    }

    public function initCommands(cmdListener : CommandListener) : Void {
    }

    public override function open() : Void {
        this.logUtil.putF(this.commonStrings.START, this, "open");
    }

    // throws Exception
    public override function close() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CLOSE);
    }

    // throws Exception
    public function update() : Void {
        this.repaintProcessor.process();
    }

    public override function getSourceId() : Int {
        return 0;
    }

    public override function addCommand(command : Command) : Void {
        this.commandStack.push(command);
        super.addCommand(command);
    }

    public override function removeAllCommands() : Void {
        final size : Int = this.commandStack.size();
        for (index in 0...size) {
            super.removeCommand((cast this.commandStack.pop() : Command));
        }
    }

}

