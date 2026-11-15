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

//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Graphics;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.InputFactory;
import org.allbinary.game.input.PlatformInputMappingFactory;
import org.allbinary.game.input.mapping.InputMappingInterface;
import org.allbinary.game.input.mapping.PersistentInputMapping;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.paint.ColorFillBasePaintable;
import org.allbinary.game.paint.ColorFillPaintableFactory;
import org.allbinary.game.paint.help.HelpPaintable;
import org.allbinary.game.paint.help.InputMappingHelpPaintable;
import org.allbinary.graphics.paint.ProcessPaintable;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.util.BasicArrayList;

class GameInputMappingCanvas extends GameCommandCanvas implements InputMappingInterface {
    private final paintable : ProcessPaintable;
    public static final NAME : String = "GameInputMappingCanvas";
    public static final DISPLAY : Command = new Command("Controls", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2);
    public static final DEFAULT : Command = new Command("Default", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 2);
    private final helpPaintable : InputMappingHelpPaintable;
    public final colorFillPaintable : ColorFillBasePaintable;
    private final inputMapping : PersistentInputMapping;
    private final NONE : GameKey = GameKeyFactory.getInstance().NONE;
    private final abeClientInformation : AbeClientInformationInterface;
    private var selectedGameKey : GameKey = this.NONE;
    private var selectedInput : Input = this.NONE;
    public function new(abeClientInformation : AbeClientInformationInterface, commandListener : CommandListener, allBinaryGameLayerManager : AllBinaryGameLayerManager, helpPaintable : HelpPaintable) {
        super(commandListener, GameInputMappingCanvas.NAME, allBinaryGameLayerManager.getBackgroundBasicColor(), allBinaryGameLayerManager.getForegroundBasicColor());
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        if (helpPaintable == null) {
            throw new haxe.Exception("Help Paintable Exception");
        }
        this.abeClientInformation = abeClientInformation;
        this.helpPaintable = (cast helpPaintable : InputMappingHelpPaintable);
        this.inputMapping = PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance();
        this.paintable = new ProcessPaintable();
        this.colorFillPaintable = ColorFillPaintableFactory.getInstance().getInstance(allBinaryGameLayerManager.getBackgroundBasicColor(), false);
    }

    // throws Exception
    public override function close() : Void {
        super.close();
        this.paintable.process();
        this.selectedGameKey = this.NONE;
        this.selectedInput = this.NONE;
        this.update();
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        this.removeAllCommands();
        this.addCommand(GameCommandsFactory.getInstance().CLOSE_AND_SHOW_GAME_CANVAS);
        this.addCommand(GameInputMappingCanvas.DEFAULT);
        this.addCommand(GameInputMappingInstructionsCanvas.DISPLAY);
        this.setCommandListener(cmdListener);
    }

    public override function keyPressed(keyCode : Int) : Void {
        this.keyPressedByDevice(keyCode, 0);
    }

    public override function keyReleased(keyCode : Int) : Void {
        this.keyReleasedByDevice(keyCode, 0);
    }

    public override function keyRepeated(keyCode : Int) : Void {
        this.keyRepeatedByDevice(keyCode, 0);
    }

    public override function keyPressedByDevice(keyCode : Int, deviceId : Int) : Void {
        this.addGameKey(keyCode, false);
        super.keyPressedByDevice(keyCode, 0);
    }

    private final inputFactory : InputFactory = InputFactory.getInstance();
    private function addGameKey(keyCode : Int, repeated : Bool) : Void {
        try {
            this.logUtil.putF(new StringMaker().append("Raw Device Key Code: ").append(StringTools.hex(keyCode)).toString(), this, this.gameInputStrings.ADD_KEY_EVENT);
            var gameKey : GameKey = this.inputToGameKeyMapping.getInstanceForCanvas(this, keyCode);
            var input : Input = this.inputFactory.getInstanceById(keyCode);
            this.processInputMapping(gameKey, input);
        } catch (e : haxe.Exception) {
            this.logUtil.put("Key Event Error", this, this.gameInputStrings.ADD_KEY_EVENT, e);
        }
    }

    // throws Exception
    public override function processInputMapping(gameKey : GameKey, input : Input) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Start Passed GameKey: ");
        stringBuffer.append(this.stringUtil.toString(gameKey));
        stringBuffer.append(" Input: ");
        stringBuffer.append(this.stringUtil.toString(input));
        this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.PROCESS);
        if (this.selectedGameKey != this.NONE) {
            this.gameActionCrud(gameKey, input);
        } else {
            this.setSelectedAction(gameKey);
        }
    }

    private function setSelectedAction(gameKey : GameKey) : Void {
        this.logUtil.putF(new StringMaker().append("Selected GameKey: ").append(this.stringUtil.toString(gameKey)).toString(), this, "setSelectedAction");
        this.selectedGameKey = gameKey;
        this.selectedInput = this.NONE;
        this.helpPaintable.update(this.selectedGameKey, this.selectedInput);
        this.repaintBehavior.onChangeRepaint(this);
    }

    // throws Exception
    private function gameActionCrud(gameKey : GameKey, input : Input) : Void {
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Start GameKey: ");
        stringBuffer.append(this.stringUtil.toString(this.selectedGameKey));
        stringBuffer.append(" Input: ");
        stringBuffer.append(this.stringUtil.toString(this.selectedInput));
        this.logUtil.putF(stringBuffer.toString(), this, "gameActionCrud");
        if (this.selectedInput == this.NONE) {
            var list : BasicArrayList = this.inputMapping.getInputMapping().getMappedInput(this.selectedGameKey);
            var isInputAlreadyMappedToSelectedAction : Bool = list.contains(input);
            if (isInputAlreadyMappedToSelectedAction) {
                this.logUtil.putF(new StringMaker().append("Already Mapped Input: ").append(this.stringUtil.toString(input)).toString(), this, "gameActionCrud");
                this.selectedInput = input;
                this.helpPaintable.update(this.selectedGameKey, this.selectedInput);
                this.repaintBehavior.onChangeRepaint(this);
            } else {
                this.addNewMapping(gameKey, input);
            }
        } else if (this.inputMapping.isDelete(input)) {
            this.deleteCurrentMapping();
        } else {
            this.setSelectedAction(gameKey);
        }
    }

    // throws Exception
    private function addNewMapping(gameKey : GameKey, input : Input) : Void {
        final METHOD_NAME : String = "addNewMapping";
        this.logUtil.putF(this.commonStrings.START, this, METHOD_NAME);
        var isInputAlreadyMapped : Bool = this.inputMapping.getInputMapping().isMapped(input);
        if (!isInputAlreadyMapped && !this.inputMapping.isSystemInput(input)) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Add Key Mapping : GameKey: ");
            stringBuffer.append(this.stringUtil.toString(this.selectedGameKey));
            stringBuffer.append(" Input: ");
            stringBuffer.append(this.stringUtil.toString(this.selectedInput));
            this.logUtil.putF(stringBuffer.toString(), this, METHOD_NAME);
            this.inputMapping.getInputMapping().add(this.selectedGameKey, input);
            this.selectedInput = input;
            this.update();
        } else {
            this.logUtil.putF("Unable to add Mapping since one already exists or is MENU, HOME, or BACK key and setting selected action to what it is already mapped to", this, METHOD_NAME);
            this.setSelectedAction(gameKey);
        }
    }

    // throws Exception
    private function deleteCurrentMapping() : Void {
        final METHOD_NAME : String = "deleteCurrentMapping";
        var list : BasicArrayList = this.inputMapping.getInputMapping().getMappedInput(this.selectedGameKey);
        if (list.size() > 1) {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Start GameKey: ");
            stringBuffer.append("Remove Key Mapping: GameKey: ");
            stringBuffer.append(this.stringUtil.toString(this.selectedGameKey));
            stringBuffer.append(" Input: ");
            stringBuffer.append(this.stringUtil.toString(this.selectedInput));
            this.logUtil.putF(stringBuffer.toString(), this, METHOD_NAME);
            this.inputMapping.getInputMapping().remove(this.selectedGameKey, this.selectedInput);
            this.selectedInput = this.NONE;
            this.update();
        } else {
            this.logUtil.putF("Can't Remove Last Key Mapping", this, METHOD_NAME);
        }
    }

    // throws Exception
    public function setDefault() : Void {
        this.inputMapping.setDefault(this.abeClientInformation);
        this.helpPaintable.update(this.NONE, this.NONE);
        this.repaintBehavior.onChangeRepaint(this);
    }

    // throws Exception
    public override function update() : Void {
        this.inputMapping.update(this.abeClientInformation);
        this.helpPaintable.update(this.selectedGameKey, this.selectedInput);
        this.repaintBehavior.onChangeRepaint(this);
    }

    public override function paint(graphics : Graphics) : Void {
        this.colorFillPaintable.paint(graphics);
        this.helpPaintable.paint(graphics);
        this.paintable.paint(graphics);
        super.paint(graphics);
    }

}

