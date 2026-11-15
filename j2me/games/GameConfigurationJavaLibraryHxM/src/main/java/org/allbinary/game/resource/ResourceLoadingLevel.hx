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


class ResourceLoadingLevel {
    private final name : String;
    private final level : Int;
    public function new(name : String, level : Int) {
        this.name = name;
        this.level = level;
    }

    public function getLevel() : Int {
        return this.level;
    }

    public function getName() : String {
        return this.name;
    }

}

