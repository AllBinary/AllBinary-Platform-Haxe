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

//import javax.microedition.lcdui.Item;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class GameConfigurationUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : GameConfigurationUtil = new GameConfigurationUtil();
    public static function getInstance() : GameConfigurationUtil {
        return GameConfigurationUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    // throws Exception
    public function change(gameOptionsForm : GameOptionsForm, gauge : GameConfigurationGauge) : Void {
        this.update(gauge);
        var gameConfigurationSingleton : GameConfigurationSingleton = GameConfigurationSingleton.getInstance();
        var gameConfiguration : GameConfiguration = gameConfigurationSingleton.getInstanceByName(gauge.getLabel());
        this.updateChallange(gameOptionsForm, gameConfiguration);
    }

    private final GAUGE_UPDATE : String = "Gauge Update: ";
    private final FROM : String = " from: ";
    private final TO : String = " to: ";
    // throws Exception
    public function update(gauge : GameConfigurationGauge) : Void {
        var gameConfigurationSingleton : GameConfigurationSingleton = GameConfigurationSingleton.getInstance();
        var gameConfiguration : GameConfiguration = gameConfigurationSingleton.getInstanceByName(gauge.getLabel());
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        var value : Null<Int> = smallIntegerSingletonFactory.getAt(gauge.getValue() + Std.int(gameConfiguration.getMinValue()));
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.GAUGE_UPDATE);
        stringBuffer.append(gameConfiguration.getName());
        stringBuffer.append(this.FROM);
        stringBuffer.appendint(Std.int(Std.int(gameConfiguration.getValue())));
        stringBuffer.append(this.TO);
        stringBuffer.appendint(Std.int(Std.int(value)));
        this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.UPDATE);
        gameConfiguration.setValue(value);
    }

    // throws Exception
    public function setDefault(gauge : GameConfigurationGauge) : Void {
        var gameConfigurationSingleton : GameConfigurationSingleton = GameConfigurationSingleton.getInstance();
        var gameConfiguration : GameConfiguration = gameConfigurationSingleton.getInstanceByName(gauge.getLabel());
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Gauge Default: ");
        stringBuffer.append(gameConfiguration.getName());
        stringBuffer.append(this.TO);
        stringBuffer.appendint(Std.int(Std.int(gameConfiguration.getDefaultValue())));
        this.logUtil.putF(stringBuffer.toString(), this, "setDefault");
        gauge.setValue(Std.int(gameConfiguration.getDefaultValue()) - Std.int(gameConfiguration.getMinValue()));
        gameConfiguration.setValue(gameConfiguration.getDefaultValue());
    }

    // throws Exception
    public function updateChallange(gameOptionsForm : GameOptionsForm, gameConfiguration : GameConfiguration) : Void {
        var gameConfigurationSingleton : GameConfigurationSingleton = GameConfigurationSingleton.getInstance();
        var gameConfigurationCentral : GameConfigurationCentral = GameConfigurationCentral.getInstance();
        if (gameConfiguration == gameConfigurationCentral.CHALLENGE_LEVEL) {
            this.logUtil.putF(this.commonStrings.START, this, "updateChallange");
            gameConfigurationCentral.COLLIDE_DAMAGE.setValue(gameConfiguration.getValue());
            gameConfigurationCentral.ATTACK_CHALLENGE_LEVEL.setValue(gameConfiguration.getValue());
            gameConfigurationCentral.DURABILITY_CHALLENGE_LEVEL.setValue(gameConfiguration.getValue());
            gameConfigurationCentral.SPEED_CHALLENGE_LEVEL.setValue(gameConfiguration.getValue());
            final size : Int = gameOptionsForm.size();
            for (index in 0...size) {
                var item : Item = gameOptionsForm.get(index);
                if (Std.isOfType(item, GameConfigurationGauge)) {
                    var gauge : GameConfigurationGauge = (cast item : GameConfigurationGauge);
                    var name : String = item.getLabel();
                    var nextGameConfiguration : GameConfiguration = gameConfigurationSingleton.getInstanceByName(name);
                    if (nextGameConfiguration == gameConfigurationCentral.COLLIDE_DAMAGE) {
                        gauge.setValue(Std.int(gameConfigurationCentral.COLLIDE_DAMAGE.getValue()) - Std.int(gameConfiguration.getMinValue()));
                    } else if (nextGameConfiguration == gameConfigurationCentral.DURABILITY_CHALLENGE_LEVEL) {
                        gauge.setValue(Std.int(gameConfigurationCentral.DURABILITY_CHALLENGE_LEVEL.getValue()) - Std.int(gameConfiguration.getMinValue()));
                    } else if (nextGameConfiguration == gameConfigurationCentral.ATTACK_CHALLENGE_LEVEL) {
                        gauge.setValue(Std.int(gameConfigurationCentral.ATTACK_CHALLENGE_LEVEL.getValue()) - Std.int(gameConfiguration.getMinValue()));
                    } else if (nextGameConfiguration == gameConfigurationCentral.SPEED_CHALLENGE_LEVEL) {
                        gauge.setValue(Std.int(gameConfigurationCentral.SPEED_CHALLENGE_LEVEL.getValue()) - Std.int(gameConfiguration.getMinValue()));
                    }
                }
            }
        }
    }

    private var COMPETITION_VALUE : Int = 1;
    public function updateCompetitionValue() : Void {
        this.logUtil.putF(this.commonStrings.START, this, "updateCompetitionValue");
        var gameConfigurationCentral : GameConfigurationCentral = GameConfigurationCentral.getInstance();
        this.COMPETITION_VALUE = Std.int(gameConfigurationCentral.COLLIDE_DAMAGE.getValue()) + Std.int(gameConfigurationCentral.ATTACK_CHALLENGE_LEVEL.getValue()) + Std.int(gameConfigurationCentral.DURABILITY_CHALLENGE_LEVEL.getValue()) + Std.int(gameConfigurationCentral.SPEED_CHALLENGE_LEVEL.getValue());
        this.COMPETITION_VALUE = (this.COMPETITION_VALUE >> 2);
    }

    public function getCompetitionValue() : Int {
        return this.COMPETITION_VALUE;
    }

    public function new() {
    }
}

