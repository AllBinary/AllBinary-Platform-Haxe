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

import org.allbinary.game.configuration.event.GameFeatureEvent;
import org.allbinary.game.configuration.event.GameFeatureEventHandler;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class Features {
    private static var SINGLETON : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : Features {
        if (Features.SINGLETON == NullUtil.getInstance().NULL_OBJECT) {
            Features.SINGLETON = new Features();
        }
        return (cast Features.SINGLETON : Features);
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final list : BasicArrayList;
    private final defaultList : BasicArrayList;
    public function new() {
        this.list = new BasicArrayListD();
        this.defaultList = new BasicArrayListD();
        this.init();
    }

    // throws Exception
    public function addDefault(gameFeature : Feature) : Void {
        this.add(gameFeature);
        if (!this.defaultList.contains(gameFeature)) {
            this.defaultList.add(gameFeature);
        }
    }

    // throws Exception
    public function add(gameFeature : Feature) : Void {
        if (!this.list.contains(gameFeature)) {
            this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(Std.string(gameFeature))), this, this.commonStrings.ADD);
            this.list.add(gameFeature);
            GameFeatureEventHandler.getInstance().fireEvent(new GameFeatureEvent(gameFeature, Std.string(gameFeature)));
        }
    }

    // throws Exception
    public function removeDefault(gameFeature : Feature) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(Std.string(gameFeature))), this, "removeDefault");
        this.remove(gameFeature);
        this.defaultList.remove(gameFeature);
    }

    // throws Exception
    public function remove(gameFeature : Feature) : Void {
        if (this.list.contains(gameFeature)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.REMOVE);
            this.list.remove(gameFeature);
            GameFeatureEventHandler.getInstance().fireEvent(new GameFeatureEvent(gameFeature, Std.string(gameFeature)));
        }
    }

    private function init() : Void {
        try {
            final gameFeatureFactory : GameFeatureFactory = GameFeatureFactory.getInstance();
            final inputFeatureFactory : InputFeatureFactory = InputFeatureFactory.getInstance();
            final sensorFeatureFactory : SensorFeatureFactory = SensorFeatureFactory.getInstance();
            final touchFeatureFactory : TouchFeatureFactory = TouchFeatureFactory.getInstance();
            this.addDefault(gameFeatureFactory.ARTIFICIAL_INTELLEGENCE_PROCESSOR);
            this.addDefault(gameFeatureFactory.COLLIDABLE_INTERFACE_LAYER_PROCESSOR);
            this.addDefault(gameFeatureFactory.GAME_INPUT_LAYER_PROCESSOR);
            this.addDefault(gameFeatureFactory.TICKABLE_LAYER_PROCESSOR);
            this.addDefault(inputFeatureFactory.MULTI_KEY_PRESS);
            this.addDefault(inputFeatureFactory.REMOVE_DUPLICATE_KEY_PRESSES);
            this.addDefault(gameFeatureFactory.SCREEN_SHAKE);
            this.addDefault(gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION);
            final operatingSystemInterface : GenericOperatingSystem = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
            if (operatingSystemInterface.isOverScan()) {
                this.addDefault(sensorFeatureFactory.NO_ORIENTATION);
                this.addDefault(touchFeatureFactory.HIDE_SCREEN_BUTTONS);
            } else {
                this.addDefault(sensorFeatureFactory.ORIENTATION_SENSORS);
                this.addDefault(touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS);
            }
            this.addDefault(touchFeatureFactory.TOUCH_ENABLED);
            this.addDefault(MainFeatureFactory.getInstance().FULL_SCREEN);
            this.addDefault(MainFeatureFactory.getInstance().LOAD_ONDEMAND);
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
        }
    }

    public function isDefault(gameFeature : Feature) : Bool {
        return this.defaultList.contains(gameFeature);
    }

    public function isFeature(gameFeature : Feature) : Bool {
        return this.list.contains(gameFeature);
    }

    // throws Exception
    public function toggle(gameFeature : Feature) : Void {
        if (this.isFeature(gameFeature)) {
            this.remove(gameFeature);
        } else {
            this.add(gameFeature);
        }
    }

}

