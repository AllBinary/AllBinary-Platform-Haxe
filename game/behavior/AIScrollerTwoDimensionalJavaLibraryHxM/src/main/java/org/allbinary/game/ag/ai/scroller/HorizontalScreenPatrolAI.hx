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

//import javax.microedition.lcdui.Canvas;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.media.audio.PlayerQueue;
import org.allbinary.media.audio.SecondaryPlayerQueueFactory;
import org.allbinary.media.audio.Sound;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.ABHashtable;

class HorizontalScreenPatrolAI extends BasicAI {
    public var keyDirection : Int = Canvas.LEFT;
    private final displayInfoSingleton : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
    private var firingX : Int = this.displayInfoSingleton.getLastHalfWidth();
    private var firedIndex : Int = 0;
    private final MAX_FIRE : Int = 28;
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(240);
    private final secondaryPlayerQueue : PlayerQueue = SecondaryPlayerQueueFactory.getInstance();
    private final sound : Sound;
    public static final SOUND : Null<Int> = SmallIntegerSingletonFactory.getInstance().getAt(433);
    public function new(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        this.sound = (cast hashtable.get(HorizontalScreenPatrolAI.SOUND) : Sound);
        if (this.sound == null) {
            throw new haxe.Exception("No Sound Provided!!");
        }
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        super.processKeyAI(this.keyDirection);
        if (this.timeDelayHelper.isTimeTNT()) {
            var layerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
            var currentOwnerLayerX : Int = layerInterface.getXP();
            if (currentOwnerLayerX < -layerInterface.getWidth()) {
                var y : Int = MyRandomFactory.getInstance().getAbsoluteNextIntAllowZero(50);
                layerInterface.setPosition(this.displayInfoSingleton.getLastWidth() + layerInterface.getWidth() + 50, y, layerInterface.getZP());
                this.firedIndex = 0;
                this.firingX = this.displayInfoSingleton.getLastHalfWidth() + MyRandomFactory.getInstance().getNextInt(this.displayInfoSingleton.getLastHalfWidth());
                this.secondaryPlayerQueue.add(this.sound);
            }
            if (currentOwnerLayerX < this.firingX && currentOwnerLayerX > -layerInterface.getWidth()) {
                super.processKeyAI(Canvas.KEY_NUM1);
                final gameLayerManager : AllBinaryGameLayerManager = (cast allBinaryLayerManager : AllBinaryGameLayerManager);
                var FIRE : Int = (gameLayerManager.getGameInfo().getCurrentLevel() + 12) >> 2;
                if (FIRE > this.MAX_FIRE) {
                    FIRE = this.MAX_FIRE;
                }
                if (this.firedIndex > FIRE) {
                    this.firedIndex = 0;
                    this.firingX = Integer.MIN_VALUE;
                }
                this.firedIndex++;
            }
        }
    }

    public function nextDirection() : Void {
    }

}

