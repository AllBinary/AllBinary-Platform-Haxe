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
package org.allbinary.game.ag.ai;

import org.allbinary.logic.StdUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.ABHashtable;

class InputProbability {
    public static var INPUT_PROBABILITY : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(0);
    private final likelyhoodIntegerArray : haxe.ds.Vector<haxe.ds.Vector<Null<Int>>>;
    private final repeatLikelyhoodIntegerArray : haxe.ds.Vector<Null<Int>>;
    private final max : Int;
    private final timeDelayHelper : TimeDelayHelper;
    public function new(likelyhoodIntegerArray : haxe.ds.Vector<haxe.ds.Vector<Null<Int>>>, repeatLikelyhoodIntegerArray : haxe.ds.Vector<Null<Int>>, max : Int, timeDelayHelper : TimeDelayHelper) {
        this.likelyhoodIntegerArray = likelyhoodIntegerArray;
        this.repeatLikelyhoodIntegerArray = repeatLikelyhoodIntegerArray;
        this.max = max;
        this.timeDelayHelper = timeDelayHelper;
    }

    public function getLikelyhoodIntegerArray() : haxe.ds.Vector<haxe.ds.Vector<Null<Int>>> {
        return this.likelyhoodIntegerArray;
    }

    public function getRepeatLikelyhoodIntegerArray() : haxe.ds.Vector<Null<Int>> {
        return this.repeatLikelyhoodIntegerArray;
    }

    public function getMax() : Int {
        return this.max;
    }

    public function getTimeDelayHelper() : TimeDelayHelper {
        return this.timeDelayHelper;
    }

    public function toHashtable() : ABHashtable<Any, Any> {
        var hashtable : ABHashtable<Any, Any> = StdUtil.getInstance().createHashtable();
        hashtable.put(InputProbability.INPUT_PROBABILITY, this);
        return hashtable;
    }

}

