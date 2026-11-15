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
import javax.microedition.lcdui.NullImage;
import org.allbinary.MIDPUtil;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.configuration.persistance.GameDifficultyFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.screen.CommandForm;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

class GameDifficultyOptions extends CommandForm {
    private final meUtil : MIDPUtil = MIDPUtil.getInstance();
    private final list : BasicArrayList;
    public function new(commandListener : CommandListener, title : String, list : BasicArrayList, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(commandListener, title, backgrounBasicColor, foregroundBasicColor);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.list = list;
        this.update();
        this.initCommands(commandListener);
        final gameDifficultyFactory : GameDifficultyFactory = GameDifficultyFactory.getInstance();
        this.setSelectedId(gameDifficultyFactory.getLevel());
    }

    public override function open() : Void {
        super.open();
    }

    // throws Exception
    public override function close() : Void {
        super.close();
        this.save();
    }

    // throws Exception
    public function save() : Void {
        final gameDifficultyFactory : GameDifficultyFactory = GameDifficultyFactory.getInstance();
        gameDifficultyFactory.setLevel(this.getSelectedId());
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
        this.removeAllCommands();
        this.addCommand(gameCommandsFactory.CLOSE_AND_SHOW_GAME_CANVAS);
        this.setCommandListener(cmdListener);
    }

    // throws Exception
    public override function update() : Void {
        this.deleteAll();
        this.add(this.list, "Difficulty", Choice.EXCLUSIVE);
        super.update();
    }

    private function add(list : BasicArrayList, name : String, option : Int) : Void {
        final choiceGroup : ChoiceGroup = this.getChoiceGroup(list, name, option);
        if (list.size() > 0) {
            choiceGroup.setSelectedIndex(0, true);
        }
        this.meUtil.appendItem(this, choiceGroup);
    }

    private function getChoiceGroup(list : BasicArrayList, name : String, option : Int) : ChoiceGroup {
        final METHOD_NAME : String = "addChoiceGroup";
        final NAME : String = "Adding Choice: ";
        final choiceGroup : ChoiceGroup = new ChoiceGroup(name, option, StringUtil.getInstance().getArrayInstance(), NullImage.NULL_IMAGE_ARRAY);
        final size : Int = list.size();
        var anyType : Any = null;
        for (index in 0...size) {
            anyType = list.objectArray[index];
            this.logUtil.putF(Std.string(new StringMaker().append(NAME).append(Std.string(anyType))), this, METHOD_NAME);
            choiceGroup.append(Std.string(anyType), NullImage.NULL_IMAGE);
        }
        return choiceGroup;
    }

    public function setSelectedId(id : Int) : Void {
        final choiceGroup : ChoiceGroup = (cast this.get(0) : ChoiceGroup);
        choiceGroup.setSelectedIndex(id, true);
    }

    public function getSelectedId() : Int {
        final choiceGroup : ChoiceGroup = (cast this.get(0) : ChoiceGroup);
        return choiceGroup.getSelectedIndex();
    }

    public function getSelectedText() : Int {
        final choiceGroup : ChoiceGroup = (cast this.get(0) : ChoiceGroup);
        final value : Int = Std.int(Std.string(choiceGroup.getString(choiceGroup.getSelectedIndex())));
        return value;
    }

}

