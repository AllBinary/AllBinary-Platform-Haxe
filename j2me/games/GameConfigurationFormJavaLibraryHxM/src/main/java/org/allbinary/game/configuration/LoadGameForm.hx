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

import javax.microedition.lcdui.Choice;
import javax.microedition.lcdui.ChoiceGroup;
import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Item;
import javax.microedition.lcdui.NullImage;
import javax.microedition.lcdui.StringItem;
import org.allbinary.MIDPUtil;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.configuration.persistance.GamePersistanceSingleton;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.screen.CommandForm;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

class LoadGameForm extends CommandForm {
    private final meUtil : MIDPUtil = MIDPUtil.getInstance();
    private var areChoices : Bool = false;
    public function new(commandListener : CommandListener, title : String, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(commandListener, title, backgrounBasicColor, foregroundBasicColor);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.update();
        this.initCommands(commandListener);
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
        this.removeAllCommands();
        this.addCommand(gameCommandsFactory.LOAD_FILE);
        this.addCommand(gameCommandsFactory.DELETE_FILE);
        this.addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS);
        this.setCommandListener(cmdListener);
    }

    // throws Exception
    public override function update() : Void {
        final list : BasicArrayList = GamePersistanceSingleton.getInstance().getIds();
        this.deleteAll();
        if (list.size() > 0) {
            this.add(list, "Select A Saved Game", javax.microedition.lcdui.Choice.ChoiceFields.EXCLUSIVE);
            this.areChoices = true;
        } else {
            this.meUtil.appendItem(this, new StringItem("No Saved Games", StringUtil.getInstance().EMPTY_STRING, Item.PLAIN));
            this.areChoices = false;
        }
        super.update();
    }

    private function add(list : BasicArrayList, name : String, option : Int) : Void {
        var choiceGroup : ChoiceGroup = this.getChoiceGroup(list, name, option);
        if (list.size() > 0) {
            choiceGroup.setSelectedIndex(0, true);
        }
        this.meUtil.appendItem(this, choiceGroup);
    }

    private function getChoiceGroup(list : BasicArrayList, name : String, option : Int) : ChoiceGroup {
        final METHOD_NAME : String = "getChoiceGroup";
        final ADDING_CHOICE : String = "Adding Choice: ";
        final choiceGroup : ChoiceGroup = new ChoiceGroup(name, option, StringUtil.getInstance().getArrayInstance(), NullImage.NULL_IMAGE_ARRAY);
        final size : Int = list.size();
        for (index in 0...size) {
            var anyType : Any = list.objectArray[index];
            this.logUtil.putF(Std.string(new StringMaker().append(ADDING_CHOICE).append(Std.string(anyType))), this, METHOD_NAME);
            choiceGroup.append(Std.string(anyType), NullImage.NULL_IMAGE);
        }
        return choiceGroup;
    }

    public function getSelectedId() : Int {
        if (this.areChoices) {
            final choiceGroup : ChoiceGroup = (cast this.get(0) : ChoiceGroup);
            return choiceGroup.getSelectedIndex();
        } else {
            return -1;
        }
    }

    public function getSelectedText() : Int {
        if (this.areChoices) {
            final choiceGroup : ChoiceGroup = (cast this.get(0) : ChoiceGroup);
            final value : Int = jre.lang.JavaObject.intValue(Std.string(choiceGroup.getString(choiceGroup.getSelectedIndex())));
            return value;
        } else {
            return -1;
        }
    }

}

