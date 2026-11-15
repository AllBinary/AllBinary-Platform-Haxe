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

//import javax.microedition.lcdui.CommandListener;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.screen.CommandForm;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class GameOptionsFormFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : GameOptionsFormFactory = new GameOptionsFormFactory();
    public function new() {
    }

    public static function getInstance() : GameOptionsFormFactory {
        return GameOptionsFormFactory.instance;
    }

    public function init(commandListener : CommandListener, title : String, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) : CommandForm {
        try {
            return new GameOptionsForm(commandListener, title, backgrounBasicColor, foregroundBasicColor);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.INIT, e);
            return CommandForm.getNullCommandForm();
        }
    }

}

