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

import org.allbinary.game.resource.ResourceLoadingLevel;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.logic.util.event.AllBinaryEventObject;

class GameInitializedEvent extends AllBinaryEventObject {
    private var resourceLoadingLevel : ResourceLoadingLevel = ResourceLoadingLevelFactory.getInstance().LEVEL;
    private var level : Int = 0;
    public function new(anyType : Any) {
        super(anyType);
    }

    public function setLevel(level : Int) : Void {
        this.level = level;
        this.resourceLoadingLevel = ResourceLoadingLevelFactory.getInstance().LEVEL;
    }

    public function getLevel() : Int {
        return this.level;
    }

    public function setResourceLoadingLevel(resourceLoadingLevel : ResourceLoadingLevel) : Void {
        this.resourceLoadingLevel = resourceLoadingLevel;
        this.level = this.resourceLoadingLevel.getLevel();
    }

    public function getResourceLoadingLevel() : ResourceLoadingLevel {
        return this.resourceLoadingLevel;
    }

}

