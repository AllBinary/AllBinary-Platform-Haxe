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


class InputFeatureFactory {
    private static final instance : InputFeatureFactory = new InputFeatureFactory();
    public static function getInstance() : InputFeatureFactory {
        return InputFeatureFactory.instance;
    }

    public function new() {
    }

    public final REMOVE_DUPLICATE_KEY_PRESSES : InputFeature = new InputFeature("Remove Duplicate Key Presses");
    public final INPUT_MAPPING : InputFeature = new InputFeature("Input Mapping");
    public final MULTI_KEY_PRESS : InputFeature = new InputFeature("Multi Key Press");
    public final SINGLE_KEY_REPEAT_PRESS : InputFeature = new InputFeature("Single Key Repeat Press");
    public final SINGLE_KEY_PRESS : InputFeature = new InputFeature("Single Key Press");
    public function isSingleKeyProcessing() : Bool {
        var features : Features = Features.getInstance();
        if (features.isFeature(this.SINGLE_KEY_REPEAT_PRESS) || features.isFeature(this.SINGLE_KEY_PRESS)) {
            return true;
        } else {
            return false;
        }
    }

}

