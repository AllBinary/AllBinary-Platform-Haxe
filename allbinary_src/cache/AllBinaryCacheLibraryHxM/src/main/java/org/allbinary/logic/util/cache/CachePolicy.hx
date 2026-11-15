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
package org.allbinary.logic.util.cache;


class CachePolicy {
    private final name : String;
    private var maxTime : haxe.Int64 = haxe.Int64.ofInt(0);
    private var maxSize : haxe.Int64 = haxe.Int64.ofInt(0);
    public function new(name : String, maxTime : haxe.Int64, maxSize : haxe.Int64) {
        this.name = name;
        this.setMaxTime(maxTime);
        this.setMaxSize(maxSize);
    }

    public function getMaxTime() : haxe.Int64 {
        return this.maxTime;
    }

    public function setMaxTime(maxTime : haxe.Int64) : Void {
        this.maxTime = maxTime;
    }

    public function getMaxSize() : haxe.Int64 {
        return this.maxSize;
    }

    public function setMaxSize(maxSize : haxe.Int64) : Void {
        this.maxSize = maxSize;
    }

    public function getName() : String {
        return this.name;
    }

}

