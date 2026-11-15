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

import org.allbinary.game.configuration.persistance.GameConfigurationPersistanceSingleton;
import org.allbinary.game.configuration.persistance.KeyValuePersistance;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;

class GameConfigurationCentral {
    private static var SINGLETON : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : GameConfigurationCentral {
        if (GameConfigurationCentral.SINGLETON == NullUtil.getInstance().NULL_OBJECT) {
            GameConfigurationCentral.SINGLETON = new GameConfigurationCentral();
        }
        return (cast GameConfigurationCentral.SINGLETON : GameConfigurationCentral);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public final SCALE : GameConfiguration;
    public final ORIENTATION : GameConfiguration;
    public final SENSOR_UPDATE_RATE : GameConfiguration;
    public final VIBRATION : GameConfiguration;
    public final CHALLENGE_LEVEL : GameConfiguration;
    public final COLLIDE_DAMAGE : GameConfiguration;
    public final DURABILITY_CHALLENGE_LEVEL : GameConfiguration;
    public final SPEED_CHALLENGE_LEVEL : GameConfiguration;
    public final ATTACK_CHALLENGE_LEVEL : GameConfiguration;
    public final CONTROL_LEVEL : GameConfiguration;
    public final PLAYER_INPUT_WAIT : GameConfiguration;
    public final SPEED : GameConfiguration;
    public final SOUND_VOLUME : GameConfiguration;
    public final MAX_GAME_OBJECTS : GameConfiguration;
    public final MAX_LAYERS : GameConfiguration;
    private var gameControlFidelity : Int = 36;
    public function new() {
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        this.SCALE = new GameConfiguration("Scale", smallIntegerSingletonFactory.getAt(2), smallIntegerSingletonFactory.getAt(2), smallIntegerSingletonFactory.getAt(3));
        this.ORIENTATION = new GameConfiguration("Orientation", smallIntegerSingletonFactory.getAt(0), smallIntegerSingletonFactory.getAt(0), smallIntegerSingletonFactory.getAt(8));
        this.SENSOR_UPDATE_RATE = new GameConfiguration("Sensor Update Rate", smallIntegerSingletonFactory.getAt(0), smallIntegerSingletonFactory.getAt(0), smallIntegerSingletonFactory.getAt(3));
        this.VIBRATION = new GameConfiguration("Vibration", smallIntegerSingletonFactory.getAt(0), smallIntegerSingletonFactory.getAt(0), smallIntegerSingletonFactory.getAt(3));
        this.CHALLENGE_LEVEL = new GameConfiguration("Global Challenge Level", smallIntegerSingletonFactory.getAt(3), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(10));
        this.COLLIDE_DAMAGE = new GameConfiguration("Collide Damage Challenge Level", smallIntegerSingletonFactory.getAt(3), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(10));
        this.DURABILITY_CHALLENGE_LEVEL = new GameConfiguration("Enemy Durability Challenge Level", smallIntegerSingletonFactory.getAt(3), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(10));
        this.SPEED_CHALLENGE_LEVEL = new GameConfiguration("Enemy Speed Challenge Level", smallIntegerSingletonFactory.getAt(3), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(10));
        this.ATTACK_CHALLENGE_LEVEL = new GameConfiguration("Enemy Attack Challenge Level", smallIntegerSingletonFactory.getAt(3), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(10));
        this.CONTROL_LEVEL = new GameConfiguration("Control Fidelity", smallIntegerSingletonFactory.getAt(5), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(10));
        this.PLAYER_INPUT_WAIT = new GameConfiguration("Input Wait", smallIntegerSingletonFactory.getAt(5), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(10));
        this.SPEED = new GameConfiguration("Game Speed (Device Specific)", smallIntegerSingletonFactory.getAt(5), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(10));
        this.SOUND_VOLUME = new GameConfiguration("Sound Volume", smallIntegerSingletonFactory.getAt(6), smallIntegerSingletonFactory.getAt(0), smallIntegerSingletonFactory.getAt(10));
        this.MAX_GAME_OBJECTS = new GameConfiguration("Max Game Objects", smallIntegerSingletonFactory.getAt(20), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(50));
        this.MAX_LAYERS = new GameConfiguration("Max Layers", smallIntegerSingletonFactory.getAt(20), smallIntegerSingletonFactory.getAt(1), smallIntegerSingletonFactory.getAt(50));
    }

    public function load(abeClientInformation : AbeClientInformationInterface) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
            final keyValuePersistance : KeyValuePersistance = GameConfigurationPersistanceSingleton.getInstance();
            keyValuePersistance.clear();
            keyValuePersistance.loadAll(abeClientInformation);
            final list : BasicArrayList = keyValuePersistance.getIds();
            if (list.size() > 0) {
                final hashtable : ABHashtable<Any, Any> = keyValuePersistance.get(0);
                final anyType : Any = (cast this.SCALE.getName() : Any);
                final value : String = (cast hashtable.get(anyType) : String);
                this.SCALE.setValue(smallIntegerSingletonFactory.getAt(Std.int(Std.string(value))));
            } else {
                this.logUtil.putF("No Game Configuration To Load", this, commonStrings.LOAD);
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.LOAD, e);
        }
    }

    public function setGameControlFidelity(gameControlFidelity : Int) : Void {
        this.gameControlFidelity = gameControlFidelity;
    }

    public function getGameControlFidelity() : Int {
        return this.gameControlFidelity;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        final commonStrings : CommonSeps = CommonSeps.getInstance();
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.SCALE.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.SCALE.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.ORIENTATION.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.ORIENTATION.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.SENSOR_UPDATE_RATE.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.SENSOR_UPDATE_RATE.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.VIBRATION.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.VIBRATION.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.CHALLENGE_LEVEL.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.CHALLENGE_LEVEL.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.COLLIDE_DAMAGE.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.COLLIDE_DAMAGE.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.DURABILITY_CHALLENGE_LEVEL.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.DURABILITY_CHALLENGE_LEVEL.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.SPEED_CHALLENGE_LEVEL.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.SPEED_CHALLENGE_LEVEL.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.ATTACK_CHALLENGE_LEVEL.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.ATTACK_CHALLENGE_LEVEL.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.CONTROL_LEVEL.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.CONTROL_LEVEL.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.SPEED.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.SPEED.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.MAX_GAME_OBJECTS.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.MAX_GAME_OBJECTS.getValue())));
        stringBuffer.append(commonStrings.COMMA_SEP);
        stringBuffer.append(this.MAX_LAYERS.getName());
        stringBuffer.append(commonStrings.EQUALS);
        stringBuffer.appendint(Std.int(Std.int(this.MAX_LAYERS.getValue())));
        return stringBuffer.toString();
    }

}

