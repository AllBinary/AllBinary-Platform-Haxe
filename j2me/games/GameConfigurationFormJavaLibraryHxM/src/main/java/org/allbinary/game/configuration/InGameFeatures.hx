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

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureChoiceGroups;
import org.allbinary.game.configuration.feature.InGameFeatureChoiceGroups;
import org.allbinary.game.configuration.feature.SensorFeatureFactory;
import org.allbinary.game.configuration.feature.TouchFeatureFactory;
import org.allbinary.init.Init;
import org.allbinary.input.gyro.OrientationData;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class InGameFeatures extends Init {
    public override function init() : Void {
        final LABEL : String = "Screen Buttons";
        final orientationData : OrientationData = OrientationData.getInstance();
        final exclusiveOrientationSensorVector : BasicArrayList = (cast GameFeatureChoiceGroups.getExclusiveInstance().get().get((cast orientationData.ORIENTATION_SENSOR_INPUT : Any)) : BasicArrayList);
        final inGameFeatureChoiceGroups : InGameFeatureChoiceGroups = InGameFeatureChoiceGroups.getExclusiveInstance();
        if (exclusiveOrientationSensorVector != null) {
            final inGameExclusiveOrientationSensorVectorCanBeNull : Any = inGameFeatureChoiceGroups.get().get((cast orientationData.ORIENTATION_SENSOR_INPUT : Any));
            if (inGameExclusiveOrientationSensorVectorCanBeNull == null) {
                this.addToInGameMenu();
            } else {
                final inGameExclusiveOrientationSensorVector : BasicArrayList = (cast inGameExclusiveOrientationSensorVectorCanBeNull : BasicArrayList);
                if (inGameExclusiveOrientationSensorVector.size() == 0) {
                    this.addToInGameMenu();
                }
            }
        }
        final features : Features = Features.getInstance();
        if (features.isFeature(TouchFeatureFactory.getInstance().SHOW_SCREEN_BUTTONS) || features.isFeature(TouchFeatureFactory.getInstance().AUTO_HIDE_SHOW_SCREEN_BUTTONS) || features.isFeature(TouchFeatureFactory.getInstance().HIDE_SCREEN_BUTTONS)) {
            final exclusiveScreenButtonsVector : BasicArrayList = new BasicArrayListD();
            final touchFeatureFactory : TouchFeatureFactory = TouchFeatureFactory.getInstance();
            exclusiveScreenButtonsVector.add(touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS);
            exclusiveScreenButtonsVector.add(touchFeatureFactory.SHOW_SCREEN_BUTTONS);
            exclusiveScreenButtonsVector.add(touchFeatureFactory.HIDE_SCREEN_BUTTONS);
            inGameFeatureChoiceGroups.add(LABEL, exclusiveScreenButtonsVector);
        }
    }

    private function addToInGameMenu() : Void {
        final orientationData : OrientationData = OrientationData.getInstance();
        final inGameExclusiveOrientationSensorVector : BasicArrayList = new BasicArrayListD();
        inGameExclusiveOrientationSensorVector.add(SensorFeatureFactory.getInstance().ORIENTATION_SENSORS);
        inGameExclusiveOrientationSensorVector.add(SensorFeatureFactory.getInstance().NO_ORIENTATION);
        InGameFeatureChoiceGroups.getExclusiveInstance().add(orientationData.ORIENTATION_SENSOR_INPUT, inGameExclusiveOrientationSensorVector);
    }

    public function isAny() : Bool {
        final features : Features = Features.getInstance();
        final touchFeatureFactory : TouchFeatureFactory = TouchFeatureFactory.getInstance();
        if (features.isFeature(touchFeatureFactory.SHOW_SCREEN_BUTTONS) || features.isFeature(touchFeatureFactory.AUTO_HIDE_SHOW_SCREEN_BUTTONS) || features.isFeature(touchFeatureFactory.HIDE_SCREEN_BUTTONS)) {
            return true;
        }
        final exclusiveOrientationSensorVector : BasicArrayList = (cast GameFeatureChoiceGroups.getExclusiveInstance().get().get((cast OrientationData.getInstance().ORIENTATION_SENSOR_INPUT : Any)) : BasicArrayList);
        if (exclusiveOrientationSensorVector != null) {
            return true;
        }
        return false;
    }

    public function new() {
        super();
    }
}

