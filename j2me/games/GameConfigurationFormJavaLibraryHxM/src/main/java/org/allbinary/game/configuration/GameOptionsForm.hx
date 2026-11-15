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

//import javax.microedition.lcdui.Choice;
//import javax.microedition.lcdui.Command;
//import javax.microedition.lcdui.CommandListener;
//import javax.microedition.lcdui.Item;
//import javax.microedition.lcdui.TextField;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups;
import org.allbinary.game.configuration.feature.GameFeatureFormUtil;
import org.allbinary.game.configuration.feature.GameFeatureItemCommandListener;
import org.allbinary.game.configuration.feature.GameFeatureItemStateListener;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.game.configuration.persistance.GameConfigurationPersistanceSingleton;
import org.allbinary.game.configuration.persistance.KeyValuePersistance;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;
import org.allbinary.graphics.displayable.screen.CommandForm;
import org.allbinary.input.gyro.OrientationData;
import org.allbinary.logic.MEUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.HashtableUtil;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.ABHashtable;

class GameOptionsForm extends CommandForm {
    private final meUtil : MEUtil = MEUtil.getInstance();
    public function new(commandListener : CommandListener, title : String, backgrounBasicColor : BasicColor, foregroundBasicColor : BasicColor) {
        super(commandListener, title, backgrounBasicColor, foregroundBasicColor);
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.addConfiguration();
        final gameFeatureFormUtil : GameFeatureFormUtil = GameFeatureFormUtil.getInstance();
        gameFeatureFormUtil.addChoiceGroup(this, GameFeatureChoiceGroups.getExclusiveInstance().get(), Choice.EXCLUSIVE);
        gameFeatureFormUtil.addChoiceGroup(this, GameFeatureChoiceGroups.getMultipleInstance().get(), Choice.MULTIPLE);
        this.initCommands(commandListener);
        this.setItemStateListener(new GameFeatureItemStateListener(this));
        this.addTextFieldsIfSimulated();
    }

    // throws Exception
    public function closeClientInformation(abeClientInformation : AbeClientInformationInterface) : Void {
        super.close();
        this.save(abeClientInformation);
    }

    private function addTextFieldsIfSimulated() : Void {
        var key : String = OrientationData.getInstance().ORIENTATION_SENSOR_INPUT;
        final hashtable : ABHashtable<Any, Any> = GameFeatureChoiceGroups.getExclusiveInstance().get();
        if (hashtable != null) {
            var listCanBeNull : Any = hashtable.get(key);
            if (listCanBeNull != null) {
                final list : BasicArrayList = (cast listCanBeNull : BasicArrayList);
                if (list.contains(SensorFeatureFactory.getInstance().SIMULATED_ORIENTATION_SENSORS)) {
                    this.addTextFields();
                }
            }
        }
    }

    private function addTextFields() : Void {
        final hashtable : ABHashtable<Any, Any> = GameConfigurationTextInput.getHashtable();
        final size : Int = hashtable.size();
        final objectArray : haxe.ds.Vector<Any> = HashtableUtil.getInstance().getKeysAsArray(hashtable);
        var gameConfigurationTextInput : GameConfigurationTextInput = null;
        var textField : TextField = null;
        for (index in 0...size) {
            gameConfigurationTextInput = (cast hashtable.get((cast objectArray[index] : Any)) : GameConfigurationTextInput);
            textField = new TextField(gameConfigurationTextInput.getLabel(), gameConfigurationTextInput.getText(), 30, TextField.ANY);
            this.meUtil.appendItem(this, textField);
        }
    }

    private function addConfiguration() : Void {
        final METHOD_NAME : String = "addConfiguration";
        final NAME : String = "Name: ";
        final list : BasicArrayList = GameConfigurationSingleton.getInstance().getOptionsBasicArrayList();
        final GAUGE_CHANGE : Command = MyCommandsFactory.getInstance().GAUGE_CHANGE;
        final stringMaker : StringMaker = new StringMaker();
        final size : Int = list.size();
        var gameConfiguration : GameConfiguration = null;
        var gauge : GameConfigurationGauge = null;
        for (index in 0...size) {
            gameConfiguration = (cast list.objectArray[index] : GameConfiguration);
            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.append(NAME).append(gameConfiguration.toString()).toString(), this, METHOD_NAME);
            gauge = new GameConfigurationGauge(gameConfiguration);
            gauge.setDefaultCommand(GAUGE_CHANGE);
            gauge.setItemCommandListener(new GameFeatureItemCommandListener(this));
            this.meUtil.appendItem(this, gauge);
        }
    }

    public override function initCommands(cmdListener : CommandListener) : Void {
        final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
        this.removeAllCommands();
        this.addCommand(gameCommandsFactory.CLOSE_OPTIONS);
        this.addCommand(gameCommandsFactory.DEFAULT_OPTIONS);
        this.setCommandListener(cmdListener);
    }

    // throws Exception
    public function save(abeClientInformation : AbeClientInformationInterface) : Void {
        final size : Int = this.size();
        var item : Item = null;
        for (index in 0...size) {
            item = this.get(index);
            if (Std.isOfType(item, GameConfigurationGauge)) {
                GameConfigurationUtil.getInstance().update((cast item : GameConfigurationGauge));
            } else if (Std.isOfType(item, TextField)) {
                GameConfigurationTextInput.update((cast item : TextField));
            }
        }
        GameConfigurationUtil.getInstance().updateCompetitionValue();
        final hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        final SCALE : GameConfiguration = GameConfigurationCentral.getInstance().SCALE;
        hashtable.put(SCALE.getName(), SCALE.getValue().toString());
        final keyValuePersistance : KeyValuePersistance = GameConfigurationPersistanceSingleton.getInstance();
        keyValuePersistance.clear();
        keyValuePersistance.loadAll(abeClientInformation);
        final list : BasicArrayList = keyValuePersistance.getIds();
        keyValuePersistance.save(abeClientInformation, hashtable);
        final size2 : Int = list.size();
        var integer : Null<Int> = null;
        for (index in 0...size2) {
            integer = (cast list.objectArray[index] : Null<Int>);
            keyValuePersistance.delete(abeClientInformation, Std.int(integer));
        }
    }

}

