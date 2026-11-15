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
package org.allbinary.game.configuration;

import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.TextField;
import org.allbinary.MIDPUtil;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.screen.CommandForm;
import org.allbinary.logic.ABSystemWrapper;

class SaveGameForm extends CommandForm {
    private static var FORM : CommandForm = CommandForm.getNullCommandForm();
    // throws Exception
    public static function createForm(commandListener : CommandListener, title : String, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) : CommandForm {
        SaveGameForm.FORM = new SaveGameForm(commandListener, title, backgrounBasicColor, foregroundBasicColor);
        return SaveGameForm.FORM;
    }

    public static function getInstance() : CommandForm {
        return SaveGameForm.FORM;
    }

    private final meUtil : MIDPUtil = MIDPUtil.getInstance();
    public function new(commandListener : CommandListener, title : String, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(commandListener, title, backgrounBasicColor, foregroundBasicColor);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        var timeString : String = Std.string(ABSystemWrapper.getInstance().currentTimeMillis());
        this.meUtil.appendItem(this, new TextField("Name: ", timeString, 30, TextField.ANY));
        this.initCommands(commandListener);
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
        this.removeAllCommands();
        this.addCommand(gameCommandsFactory.SAVE);
        this.addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS);
        this.setCommandListener(cmdListener);
    }

}

