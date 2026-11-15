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

//import javax.microedition.lcdui.ChoiceGroup;
//import javax.microedition.lcdui.Item;
//import javax.microedition.lcdui.ItemStateListener;
import org.allbinary.game.configuration.GameConfigurationGauge;
import org.allbinary.game.configuration.GameConfigurationUtil;
import org.allbinary.game.configuration.GameOptionsForm;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GameFeatureItemStateListener implements ItemStateListener {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static var toggleList : BasicArrayList = new BasicArrayListD();
    private var gameOptionsForm : GameOptionsForm;
    public function new(gameOptionsForm : GameOptionsForm) {
        this.gameOptionsForm = gameOptionsForm;
        var gameFeatureFactory : GameFeatureFactory = GameFeatureFactory.getInstance();
        GameFeatureItemStateListener.add(gameFeatureFactory.ARTIFICIAL_INTELLEGENCE_PROCESSOR);
        GameFeatureItemStateListener.add(gameFeatureFactory.COLLIDABLE_INTERFACE_LAYER_PROCESSOR);
        GameFeatureItemStateListener.add(gameFeatureFactory.DAMAGE_FLOATERS);
        GameFeatureItemStateListener.add(gameFeatureFactory.DROPPED_ITEMS);
        GameFeatureItemStateListener.add(gameFeatureFactory.GAME_INPUT_LAYER_PROCESSOR);
        GameFeatureItemStateListener.add(gameFeatureFactory.HEALTH_BARS);
        GameFeatureItemStateListener.add(gameFeatureFactory.SOUND);
        GameFeatureItemStateListener.add(gameFeatureFactory.TICKABLE_LAYER_PROCESSOR);
    }

    public static function add(gameFeature : GameFeature) : Void {
        if (!GameFeatureItemStateListener.toggleList.contains(gameFeature)) {
            GameFeatureItemStateListener.toggleList.add(gameFeature);
        }
    }

    public function itemStateChanged(item : Item) : Void {
        try {
            var itemLabel : String = item.getLabel();
            this.logUtil.putF(new StringMaker().append(CommonLabels.getInstance().ITEM_LABEL).append(itemLabel).toString(), this, "itemStateChanged");
            if (Std.isOfType(item, GameConfigurationGauge)) {
                GameConfigurationUtil.getInstance().change(this.gameOptionsForm, (cast item : GameConfigurationGauge));
            } else if (Std.isOfType(item, ChoiceGroup)) {
                var gameFeatureUtil : GameFeatureUtil = GameFeatureUtil.getInstance();
                if (gameFeatureUtil.isExclusive(itemLabel)) {
                    gameFeatureUtil.updateExclusiveForChoiceGroup((cast item : ChoiceGroup));
                } else {
                    gameFeatureUtil.updateMultiple((cast item : ChoiceGroup));
                }
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, "itemStateChanged", e);
        }
    }

}

