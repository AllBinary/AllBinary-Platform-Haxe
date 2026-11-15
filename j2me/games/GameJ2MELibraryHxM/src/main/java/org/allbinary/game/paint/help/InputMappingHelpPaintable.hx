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
package org.allbinary.game.paint.help;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.PlatformInputMappingFactory;
import org.allbinary.game.input.mapping.GameInputMapping;
import org.allbinary.game.input.mapping.PersistentInputMapping;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorUtil;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class InputMappingHelpPaintable extends HelpPaintable {
    private static final AND : String = " and ";
    private static final SEP : String = ", ";
    private static final MORE_THAN_TWO_IN_LIST_AND : String = ", and ";
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final commonSeps : CommonSeps = CommonSeps.getInstance();
    public final stringUtil : StringUtil = StringUtil.getInstance();
    private final basicColorFactory : BasicColorFactory = BasicColorFactory.getInstance();
    private final NONE : GameKey = GameKeyFactory.getInstance().NONE;
    private final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
    private var gameInputMappingArray : haxe.ds.Vector<GameInputMapping>;
    private var keyMappingArray : haxe.ds.Vector<BasicArrayList> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    private var actionBasicColor : haxe.ds.Vector<BasicColor> = BasicColorUtil.getInstance().ZERO_ARRAY;
    private var inputBasicColorArray : haxe.ds.Vector<haxe.ds.Vector<BasicColor>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) null])]);
    private var selectedBasicColor : BasicColor = null;
    private var updateMyFontProperties : UpdateMyFontProperties = new UpdateMyFontProperties();
    public function new(gameInputMappingArray : haxe.ds.Vector<GameInputMapping>, backgroundBasicColor : BasicColor, basicColor : BasicColor) {
        super("Input Mapping", backgroundBasicColor, basicColor);
        this.gameInputMappingArray = gameInputMappingArray;
        this.update(this.NONE, this.NONE);
        if (backgroundBasicColor == this.basicColorFactory.WHITE || basicColor == this.basicColorFactory.WHITE) {
            this.selectedBasicColor = this.basicColorFactory.RED;
        } else {
            this.selectedBasicColor = this.basicColorFactory.WHITE;
        }
    }

    public override function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        final updateMyFontProperties : UpdateMyFontProperties = new UpdateMyFontProperties();
        updateMyFontProperties.charHeight = font.getHeight();
        final stringMaker : StringMaker = new StringMaker();
        final inputInfo : haxe.ds.Vector<String> = this.inputInfo;
        final size : Int = inputInfo.length;
        updateMyFontProperties.actionStringArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        updateMyFontProperties.keymappingBeginWidthArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) 0]);
        updateMyFontProperties.actionStringDeltaXArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) 0]);
        updateMyFontProperties.inputDeltaXArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) 0])]);
        updateMyFontProperties.sepArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) null])]);
        updateMyFontProperties.sepWidthArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) 0])]);
        var list : BasicArrayList = null;
        var keyMappings : String = null;
        var actionString : String = null;
        var input : Input = null;
        var size2 : Int = 0;
        for (index in 0...size) {
            list = this.keyMappingArray[index];
            keyMappings = this.get(list);
            stringMaker.delete(0, stringMaker.length());
            actionString = Std.string(stringMaker.append(inputInfo[index]).append(commonSeps.COLON).append(commonSeps.SPACE).append(commonSeps.SPACE));
            updateMyFontProperties.actionStringArray[index] = actionString;
            stringMaker.delete(0, stringMaker.length());
            updateMyFontProperties.keymappingBeginWidthArray[index] = (font.stringWidth(Std.string(stringMaker.append(updateMyFontProperties.actionStringArray[index]).append(keyMappings))) >> 1);
            updateMyFontProperties.actionStringDeltaXArray[index] = font.stringWidth(actionString);
            size2 = list.size();
            updateMyFontProperties.inputDeltaXArray[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...size2) 0]);
            updateMyFontProperties.sepArray[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...size2) null]);
            updateMyFontProperties.sepWidthArray[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...size2) 0]);
            for (index2 in 0...size2) {
                input = (cast list.objectArray[index2] : Input);
                updateMyFontProperties.inputDeltaXArray[index][index2] = font.stringWidth(input.getName());
                updateMyFontProperties.sepArray[index][index2] = EMPTY_STRING;
                if (index2 + 1 < list.size()) {
                    if (list.size() == 2) {
                        updateMyFontProperties.sepArray[index][index2] = InputMappingHelpPaintable.AND;
                    } else {
                        if (index2 + 2 == list.size()) {
                            updateMyFontProperties.sepArray[index][index2] = InputMappingHelpPaintable.MORE_THAN_TWO_IN_LIST_AND;
                        } else {
                            updateMyFontProperties.sepArray[index][index2] = InputMappingHelpPaintable.SEP;
                        }
                    }
                }
                if (updateMyFontProperties.sepArray[index][index2] != EMPTY_STRING) {
                    updateMyFontProperties.sepWidthArray[index][index2] = font.stringWidth(updateMyFontProperties.sepArray[index][index2]);
                }
            }
        }
        this.updateMyFontProperties = updateMyFontProperties;
        super.updateMeasurement(graphics);
    }

    public function update(selectedGameKey : GameKey, selectedInput : Input) : Void {
        final stringMaker : StringMaker = new StringMaker();
        this.logUtil.putF(Std.string(stringMaker.append(CommonLabels.getInstance().START_LABEL).append("selected GameKey: ").append(this.stringUtil.toString(selectedGameKey)).append(" Input: ").append(this.stringUtil.toString(selectedInput))), this, this.commonStrings.UPDATE);
        final gameKeyMapping : PersistentInputMapping = PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance();
        final size : Int = this.gameInputMappingArray.length;
        final keyInfo : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        final keyMappingArray : haxe.ds.Vector<BasicArrayList> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        final actionBasicColor : haxe.ds.Vector<BasicColor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        final inputBasicColorArray : haxe.ds.Vector<haxe.ds.Vector<BasicColor>> = new haxe.ds.Vector<BasicColor>(size);
        var gameInputMapping : GameInputMapping = null;
        var gameKey : GameKey = null;
        var list : BasicArrayList = null;
        for (index in 0...size) {
            gameInputMapping = this.gameInputMappingArray[index];
            gameKey = gameInputMapping.getGameKey();
            list = gameKeyMapping.getInputMapping().getMappedInput(gameKey);
            var size2 : Int = list.size();
            inputBasicColorArray[index] = haxe.ds.Vector.fromArrayCopy([for (index in 0...size2) null]);
            for (index2 in 0...size2) {
                inputBasicColorArray[index][index2] = this.basicColor;
            }
            if (gameKey == selectedGameKey) {
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(Std.string(stringMaker.append("Found: selected GameKey: ").append(this.stringUtil.toString(selectedGameKey))), this, this.commonStrings.UPDATE);
                actionBasicColor[index] = this.selectedBasicColor;
                var indexOfSelectedInput : Int = list.indexOf(selectedInput);
                if (indexOfSelectedInput >= 0) {
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(Std.string(stringMaker.append("Found: selected Input: ").append(this.stringUtil.toString(selectedInput))), this, this.commonStrings.UPDATE);
                    inputBasicColorArray[index][indexOfSelectedInput] = this.selectedBasicColor;
                }
            } else {
                actionBasicColor[index] = this.basicColor;
            }
            keyInfo[index] = gameInputMapping.getName();
            keyMappingArray[index] = list;
        }
        this.keyMappingArray = keyMappingArray;
        this.actionBasicColor = actionBasicColor;
        this.inputBasicColorArray = inputBasicColorArray;
        super.setInputInfoP(keyInfo);
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    private function get(keyList : BasicArrayList) : String {
        final stringBuffer : StringMaker = new StringMaker();
        var key : Input = null;
        final size : Int = keyList.size();
        for (index in 0...size) {
            key = (cast keyList.objectArray[index] : Input);
            stringBuffer.append(key.getName());
            if (index + 1 < keyList.size()) {
                if (keyList.size() == 2) {
                    stringBuffer.append(InputMappingHelpPaintable.AND);
                } else {
                    if (index + 2 == keyList.size()) {
                        stringBuffer.append(InputMappingHelpPaintable.MORE_THAN_TWO_IN_LIST_AND);
                    } else {
                        stringBuffer.append(InputMappingHelpPaintable.SEP);
                    }
                }
            }
        }
        return Std.string(stringBuffer);
    }

    public override function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
        final halfWidth : Int = this.displayInfo.getLastHalfWidth();
        graphics.setColor(Std.int(this.basicColor));
        graphics.drawString(this.title, halfWidth - this.titleBeginWidth, this.updateMyFontProperties.charHeight, this.anchor);
        final inputInfo : haxe.ds.Vector<String> = this.inputInfo;
        final size : Int = inputInfo.length;
        var y : Int = 0;
        var deltaX : Int = 0;
        var size2 : Int = 0;
        var actionString : String = null;
        var input : Input = null;
        var list : BasicArrayList = null;
        var sep : String = null;
        var beginWidth : Int = 0;
        for (index in 0...size) {
            y = (index + 3) * this.updateMyFontProperties.charHeight;
            deltaX = 0;
            list = this.keyMappingArray[index];
            size2 = list.size();
            beginWidth = this.updateMyFontProperties.keymappingBeginWidthArray[index];
            graphics.setColor(Std.int(this.actionBasicColor[index]));
            actionString = this.updateMyFontProperties.actionStringArray[index];
            graphics.drawString(actionString, halfWidth - beginWidth + deltaX, y, this.anchor);
            deltaX += this.updateMyFontProperties.actionStringDeltaXArray[index];
            for (index2 in 0...size2) {
                input = (cast list.objectArray[index2] : Input);
                graphics.setColor(Std.int(this.inputBasicColorArray[index][index2]));
                graphics.drawString(input.getName(), halfWidth - beginWidth + deltaX, y, this.anchor);
                deltaX += this.updateMyFontProperties.inputDeltaXArray[index][index2];
                sep = this.updateMyFontProperties.sepArray[index][index2];
                graphics.setColor(Std.int(this.basicColor));
                graphics.drawString(sep, halfWidth - beginWidth + deltaX, y, this.anchor);
                deltaX += this.updateMyFontProperties.sepWidthArray[index][index2];
            }
        }
    }

}

