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
package org.allbinary.logic.math.vector;

import org.allbinary.logic.math.BasicDecimal;

class MathVector implements MathVectorInterface {
    private var magnitudeBasicDecimal : BasicDecimal;
    private var direction : Int;
    public var resultBasicDecimal : BasicDecimal = null;
    public function new(magnitudeBasicDecimal : BasicDecimal, direction : Int) {
        this.magnitudeBasicDecimal = magnitudeBasicDecimal;
        this.direction = direction;
    }

    public function getMagnitude() : BasicDecimal {
        return this.magnitudeBasicDecimal;
    }

    public function getDirection() : Int {
        return this.direction;
    }

    public function getResult() : BasicDecimal {
        return this.resultBasicDecimal;
    }

}

