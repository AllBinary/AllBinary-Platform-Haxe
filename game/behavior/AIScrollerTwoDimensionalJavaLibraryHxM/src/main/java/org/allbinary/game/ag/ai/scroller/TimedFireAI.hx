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
package org.allbinary.game.ag.ai.scroller;

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;

class TimedFireAI extends BasicAI {
    public static final TIME : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(1);
    public final maxFireDelayTimeHelper : TimeDelayHelper = new TimeDelayHelper(0);
    private final delay : Int;
    public function new(delay : Int, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        this.delay = delay;
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        var timeFiredInterface : TimeFiredInterface = (cast this.getOwnerLayerInterface() : TimeFiredInterface);
        if (this.maxFireDelayTimeHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) && timeFiredInterface.getLastFireTime() + this.maxFireDelayTimeHelper.delay < this.maxFireDelayTimeHelper.getStartTime()) {
            super.processKeyAI(Canvas.KEY_NUM1);
            this.maxFireDelayTimeHelper.delay = this.delay;
        }
    }

}

