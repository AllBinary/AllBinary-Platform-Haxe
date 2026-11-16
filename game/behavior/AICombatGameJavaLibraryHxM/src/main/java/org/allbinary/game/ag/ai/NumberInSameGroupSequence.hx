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

import org.allbinary.logic.math.SmallIntegerSingletonFactory;

class NumberInSameGroupSequence {
    public static function getInstance() : NumberInSameGroupSequence {
        return new NumberInSameGroupSequence();
    }

    public var NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_ONE : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_TWO : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_THREE : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_SIX : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE_NINE : Null<Int>;
    public var NUMBER_ON_SAME_TEAM_SEQUENCE : haxe.ds.Vector<Null<Int>>;
    public function new() {
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO = smallIntegerSingletonFactory.getAt(100);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_ONE = smallIntegerSingletonFactory.getAt(101);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_TWO = smallIntegerSingletonFactory.getAt(102);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_THREE = smallIntegerSingletonFactory.getAt(103);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR = smallIntegerSingletonFactory.getAt(104);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE = smallIntegerSingletonFactory.getAt(105);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_SIX = smallIntegerSingletonFactory.getAt(106);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN = smallIntegerSingletonFactory.getAt(107);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT = smallIntegerSingletonFactory.getAt(108);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE_NINE = smallIntegerSingletonFactory.getAt(109);
        this.NUMBER_ON_SAME_TEAM_SEQUENCE = haxe.ds.Vector.fromArrayCopy(([this.NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO, this.NUMBER_ON_SAME_TEAM_SEQUENCE_ONE, this.NUMBER_ON_SAME_TEAM_SEQUENCE_THREE, this.NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR, this.NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE, this.NUMBER_ON_SAME_TEAM_SEQUENCE_SIX, this.NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN, this.NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT, this.NUMBER_ON_SAME_TEAM_SEQUENCE_NINE] : Array<Null<Int>>));
    }

}

