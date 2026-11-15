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
import org.allbinary.init.Init;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class InGameOptionsFormFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : InGameOptionsFormFactory {
        if (InGameOptionsFormFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            InGameOptionsFormFactory.instance = new InGameOptionsFormFactory();
        }
        return (cast InGameOptionsFormFactory.instance : InGameOptionsFormFactory);
    }

    private var SINGLETON : CommandForm = CommandForm.getNullCommandForm();
    public function init(commandListener : CommandListener, initInterface : Init, title : String, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) : Void {
        try {
            if (this.SINGLETON == CommandForm.getNullCommandForm()) {
                initInterface.init();
                this.SINGLETON = new InGameOptionsForm(commandListener, title, backgrounBasicColor, foregroundBasicColor);
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.INIT, e);
        }
    }

    public function get() : CommandForm {
        return this.SINGLETON;
    }

    public function new() {
    }
}

