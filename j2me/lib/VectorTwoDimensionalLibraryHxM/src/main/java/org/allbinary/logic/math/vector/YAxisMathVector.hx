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

class YAxisMathVector extends MathVector {
    public function new(magnitudeBasicDecimal : BasicDecimal, direction : Int) {
        super(magnitudeBasicDecimal, direction);
        this.calculate();
    }

    public function getResult() : BasicDecimal {
        return resultBasicDecimal;
    }

    private function calculate() : Void {
        var result : haxe.Int64 = YAxisMathVectorUtil.calculate(this.getMagnitude().getUnscaled(), this.getDirection());
        this.resultBasicDecimal = new BasicDecimal(result);
    }

}

