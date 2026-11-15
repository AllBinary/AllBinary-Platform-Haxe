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

import javax.microedition.lcdui.ChoiceGroup;
import javax.microedition.lcdui.Item;
import javax.microedition.lcdui.NullImage;
import org.allbinary.MIDPUtil;
import org.allbinary.game.configuration.GameConfigurationGauge;
import org.allbinary.game.configuration.GameConfigurationUtil;
import org.allbinary.graphics.displayable.screen.CommandForm;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.HashtableUtil;

class GameFeatureFormUtil {
    private static final instance : GameFeatureFormUtil = new GameFeatureFormUtil();
    public static function getInstance() : GameFeatureFormUtil {
        return GameFeatureFormUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final meUtil : MIDPUtil = MIDPUtil.getInstance();
    public function getChoiceGroup(hashtable : ABHashtable<Any, Any>, name : String, option : Int) : ChoiceGroup {
        final stringMaker : StringMaker = new StringMaker();
        final choiceGroup : ChoiceGroup = new ChoiceGroup(name, option, StringUtil.getInstance().getArrayInstance(), NullImage.NULL_IMAGE_ARRAY);
        final list : BasicArrayList = (cast hashtable.get((cast name : Any)) : BasicArrayList);
        final features : Features = Features.getInstance();
        final ADD_CHOICE : String = ": Adding Choice: ";
        final GET_CHOICE_GROUP : String = "getChoiceGroup";
        final size : Int = list.size();
        for (index in 0...size) {
            final gameFeature : Feature = (cast list.objectArray[index] : Feature);
            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(Std.string(stringMaker.append(name).append(ADD_CHOICE).append(Std.string(gameFeature))), this, GET_CHOICE_GROUP);
            choiceGroup.append(Std.string(gameFeature), NullImage.NULL_IMAGE);
            if (features.isFeature(gameFeature)) {
                choiceGroup.setSelectedIndex(index, true);
            }
        }
        return choiceGroup;
    }

    public function addChoiceGroup(form : CommandForm, hashtable : ABHashtable<Any, Any>, option : Int) : Void {
        final stringMaker : StringMaker = new StringMaker();
        final ADDING_CHOICE_GROUP : String = "Adding Choice Group: ";
        final ADD_CHOICE_GROUP : String = "addChoiceGroup";
        final size : Int = hashtable.size();
        final objectArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(hashtable);
        var name : String = null;
        for (index in 0...size) {
            name = (cast objectArray[index] : String);
            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(Std.string(stringMaker.append(ADDING_CHOICE_GROUP).append(name)), this, ADD_CHOICE_GROUP);
            this.meUtil.appendItem(form, this.getChoiceGroup(hashtable, name, option));
        }
    }

    // throws Exception
    public function setDefault(form : CommandForm) : Void {
        final size : Int = form.size();
        for (index in 0...size) {
            var item : Item = form.get(index);
            if (Std.isOfType(item, GameConfigurationGauge)) {
                GameConfigurationUtil.getInstance().setDefault((cast item : GameConfigurationGauge));
            } else if (Std.isOfType(item, ChoiceGroup)) {
                GameFeatureUtil.getInstance().setDefault((cast item : ChoiceGroup));
            }
        }
    }

    public function new() {
    }
}

