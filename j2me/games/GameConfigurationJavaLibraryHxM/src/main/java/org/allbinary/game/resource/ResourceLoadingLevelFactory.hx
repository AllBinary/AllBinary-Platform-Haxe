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
package org.allbinary.game.resource;


class ResourceLoadingLevelFactory {
    private static final instance : ResourceLoadingLevelFactory = new ResourceLoadingLevelFactory();
    public static function getInstance() : ResourceLoadingLevelFactory {
        return ResourceLoadingLevelFactory.instance;
    }

    public final LOAD_EARLY : ResourceLoadingLevel = new ResourceLoadingLevel("Load Early", Integer.MAX_VALUE);
    public final LOAD_TOUCH : ResourceLoadingLevel = new ResourceLoadingLevel("Load Touch", Integer.MAX_VALUE - 1);
    public final LOAD_GAME : ResourceLoadingLevel = new ResourceLoadingLevel("Load Game", Integer.MAX_VALUE - 2);
    public final LEVEL : ResourceLoadingLevel = new ResourceLoadingLevel("Level", Integer.MAX_VALUE - 99);
    public final MAX_LEVEL : ResourceLoadingLevel = new ResourceLoadingLevel("Max Level", Integer.MAX_VALUE - 100);
    public final LOAD_ALL : ResourceLoadingLevel = new ResourceLoadingLevel("Load All", -1);
    private final RESOURCE_LOADING_LEVEL_ARRAY : haxe.ds.Vector<ResourceLoadingLevel> = haxe.ds.Vector.fromArrayCopy([this.LOAD_ALL, this.MAX_LEVEL, this.LEVEL, this.LOAD_GAME, this.LOAD_TOUCH, this.LOAD_EARLY]);
    public function getLevelString(level : Int) : String {
        for (index in 0...this.RESOURCE_LOADING_LEVEL_ARRAY.length) {
            if (level == this.RESOURCE_LOADING_LEVEL_ARRAY[index].getLevel()) {
                return this.RESOURCE_LOADING_LEVEL_ARRAY[index].getName();
            }
        }
        return Std.string(level);
    }

    public function new() {
    }
}

