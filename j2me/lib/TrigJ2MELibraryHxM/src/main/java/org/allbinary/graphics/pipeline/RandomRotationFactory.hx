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
package org.allbinary.graphics.pipeline;

import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.math.AngleFactory;
import org.allbinary.util.BasicArrayList;

class RandomRotationFactory {
    private static final instance : RandomRotationFactory = new RandomRotationFactory();
    public static function getInstance() : RandomRotationFactory {
        return RandomRotationFactory.instance;
    }

    private final myRandomFactory : MyRandomFactory = MyRandomFactory.getInstance();
    private final angleFactory : AngleFactory = AngleFactory.getInstance();
    // throws Exception
    public function getInstanceList(vector : BasicArrayList, howMuch : Int) : BasicArrayList {
        final graphicsPipe : BasicGraphicsPipeline = new BasicGraphicsPipeline(vector);
        graphicsPipe.createMatrix();
        graphicsPipe.rotateToAngle(this.angleFactory.getAt(this.getNextRandomAngle(howMuch)));
        return graphicsPipe.getMatrix();
    }

    public function getNextRandomAngle(howMuch : Int) : Int {
        return this.myRandomFactory.getNextInt(howMuch * 10);
    }

    public function new() {
    }
}

