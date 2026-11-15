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

//import java.util.Enumeration;
//import javax.microedition.lcdui.ChoiceGroup;
import org.allbinary.TsUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.EnumerationUtil;
import org.allbinary.util.HashtableUtil;

class GameFeatureUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : GameFeatureUtil = new GameFeatureUtil();
    public static function getInstance() : GameFeatureUtil {
        return GameFeatureUtil.instance;
    }

    private final tsUtil : TsUtil = TsUtil.getInstance();
    private final enumerationUtil : EnumerationUtil = EnumerationUtil.getInstance();
    public final ON_GAME_FEATURE_CHANGE : String = "onGameFeatureChange";
    public final GAME_FEATURE_CHANGED : String = "Game Feature Changed: ";
    // throws Exception
    public function setDefault(choiceGroup : ChoiceGroup) : Void {
        var stringBuffer : StringMaker = new StringMaker();
        final METHOD_NAME : String = "setDefault";
        final SELECTED_ARRAY_RETURN : String = "selectedArray_return[";
        final SELECTED_SEP : String = "] = ";
        var selectedArray_return : haxe.ds.Vector<Bool> = haxe.ds.Vector.fromArrayCopy([for (index in 0...choiceGroup.size()) false]);
        var total : Int = choiceGroup.getSelectedFlags(selectedArray_return);
        stringBuffer.append("Multiple Total Choices: ");
        stringBuffer.appendint(total);
        this.logUtil.putF(stringBuffer.toString(), this, METHOD_NAME);
        var features : Features = Features.getInstance();
        for (index in 0...selectedArray_return.length) {
            var isSelected : Bool = selectedArray_return[index];
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(SELECTED_ARRAY_RETURN);
            stringBuffer.appendint(index);
            stringBuffer.append(SELECTED_SEP);
            stringBuffer.appendboolean(isSelected);
            this.logUtil.putF(stringBuffer.toString(), this, METHOD_NAME);
            var selectedChoiceLabel : String = choiceGroup.getString(index);
            var gameFeature : Feature = Feature.getInstance(selectedChoiceLabel);
            if (features.isDefault(gameFeature)) {
                features.add(gameFeature);
                choiceGroup.setSelectedIndex(index, true);
            } else {
                features.remove(gameFeature);
                choiceGroup.setSelectedIndex(index, false);
            }
        }
    }

    // throws Exception
    public function updateMultiple(choiceGroup : ChoiceGroup) : Void {
        var stringBuffer : StringMaker = new StringMaker();
        final METHOD_NAME : String = "updateMultiple";
        final SELECTED_ARRAY_RETURN : String = "selectedArray_return[";
        final SELECTED_SEP : String = "] = ";
        var selectedArray_return : haxe.ds.Vector<Bool> = haxe.ds.Vector.fromArrayCopy([for (index in 0...choiceGroup.size()) false]);
        var total : Int = choiceGroup.getSelectedFlags(selectedArray_return);
        stringBuffer.append("Multiple Total Choices: ");
        stringBuffer.appendint(total);
        this.logUtil.putF(stringBuffer.toString(), this, METHOD_NAME);
        var features : Features = Features.getInstance();
        for (index in 0...selectedArray_return.length) {
            var isSelected : Bool = selectedArray_return[index];
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(SELECTED_ARRAY_RETURN);
            stringBuffer.appendint(index);
            stringBuffer.append(SELECTED_SEP);
            stringBuffer.appendboolean(isSelected);
            this.logUtil.putF(stringBuffer.toString(), this, METHOD_NAME);
            var selectedChoiceLabel : String = choiceGroup.getString(index);
            var gameFeature : Feature = Feature.getInstance(selectedChoiceLabel);
            if (!isSelected && features.isFeature(gameFeature)) {
                features.remove(gameFeature);
            } else if (isSelected && !features.isFeature(gameFeature)) {
                features.add(gameFeature);
            }
        }
    }

    // throws Exception
    public function updateExclusiveForChoiceGroup(choiceGroup : ChoiceGroup) : Void {
        var stringBuffer : StringMaker = new StringMaker();
        final METHOD_NAME : String = "updateExclusive";
        final SELECTED_ARRAY_RETURN : String = "selectedArray_return[";
        final SELECTED_SEP : String = "] = ";
        var selectedArray_return : haxe.ds.Vector<Bool> = haxe.ds.Vector.fromArrayCopy([for (index in 0...choiceGroup.size()) false]);
        var total : Int = choiceGroup.getSelectedFlags(selectedArray_return);
        stringBuffer.append("Exclusive Total Choices: 1==");
        stringBuffer.appendint(total);
        this.logUtil.putF(stringBuffer.toString(), this, METHOD_NAME);
        for (index in 0...selectedArray_return.length) {
            var isSelected : Bool = selectedArray_return[index];
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(SELECTED_ARRAY_RETURN);
            stringBuffer.appendint(index);
            stringBuffer.append(SELECTED_SEP);
            stringBuffer.appendboolean(isSelected);
            this.logUtil.putF(stringBuffer.toString(), this, METHOD_NAME);
            if (isSelected) {
                var selectedChoiceLabel : String = choiceGroup.getString(index);
                this.updateExclusive(selectedChoiceLabel);
            }
        }
    }

    public function isExclusive(itemLabel : String) : Bool {
        final enumeration : Enumeration = GameFeatureChoiceGroups.getExclusiveInstance().get().keys();
        var name : String = null;
        while (this.enumerationUtil.hasMoreElements(enumeration)) {
            name = (cast this.enumerationUtil.nextElement(enumeration) : String);
            if (this.tsUtil.compareTo(itemLabel, name) == 0) {
                return true;
            }
        }
        return false;
    }

    // throws Exception
    private function updateExclusive(selectedChoiceLabel : String) : Void {
        this.logUtil.putF(new StringMaker().append(CommonLabels.getInstance().ITEM_LABEL).append(selectedChoiceLabel).toString(), this, "updateExclusive");
        final gameFeature : Feature = Feature.getInstance(selectedChoiceLabel);
        final hashtable : ABHashtable<Any, Any> = GameFeatureChoiceGroups.getExclusiveInstance().get();
        final objectArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(hashtable);
        var basicArrayList : BasicArrayList = null;
        var anyType : Any = null;
        var size : Int = objectArray.length;
        for (index in 0...size) {
            anyType = (cast objectArray[index] : Any);
            basicArrayList = (cast hashtable.get(anyType) : BasicArrayList);
            this.updateExclusiveList(gameFeature, basicArrayList);
        }
    }

    // throws Exception
    public function updateExclusiveList(gameFeature : Feature, list : BasicArrayList) : Void {
        if (list.contains(gameFeature)) {
            var features : Features = Features.getInstance();
            var addIndex : Int = list.indexOf(gameFeature);
            var size : Int = list.size();
            for (index in 0...size) {
                if (addIndex != index) {
                    features.remove((cast list.objectArray[index] : Feature));
                } else {
                    features.add((cast list.objectArray[index] : Feature));
                }
            }
        }
    }

    public function new() {
    }
}

