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
package org.allbinary.game.configuration.feature;

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.Item;
import javax.microedition.lcdui.ItemCommandListener;
import org.allbinary.game.configuration.GameConfigurationGauge;
import org.allbinary.game.configuration.GameConfigurationUtil;
import org.allbinary.game.configuration.GameOptionsForm;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.midlet.MidletStrings;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;

class GameFeatureItemCommandListener implements ItemCommandListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var gameOptionsForm : GameOptionsForm;
    public function new(gameOptionsForm : GameOptionsForm) {
        this.gameOptionsForm = gameOptionsForm;
    }

    public function commandAction(command : Command, item : Item) : Void {
        try {
            var itemLabel : String = item.getLabel();
            this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().ITEM_LABEL).append(itemLabel)), this, MidletStrings.getInstance().COMMAND_ACTION);
            if (Std.isOfType(item, GameConfigurationGauge)) {
                GameConfigurationUtil.getInstance().change(this.gameOptionsForm, (cast item : GameConfigurationGauge));
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, MidletStrings.getInstance().COMMAND_ACTION, e);
        }
    }

}

