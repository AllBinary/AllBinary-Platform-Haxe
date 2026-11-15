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
package org.allbinary.game.configuration.event;

import org.allbinary.game.configuration.GameConfiguration;

class ChangedGameFeatureListener extends BaseChangedGameFeatureListener {
    private static final gameFeatureListener : ChangedGameFeatureListener = new ChangedGameFeatureListener();
    public static function getInstance() : ChangedGameFeatureListener {
        return ChangedGameFeatureListener.gameFeatureListener;
    }

    public function isChangedGameConfiguration(gameConfiguration : GameConfiguration) : Bool {
        return this.list.contains(gameConfiguration);
    }

    public function new() {
        super();
    }
}

