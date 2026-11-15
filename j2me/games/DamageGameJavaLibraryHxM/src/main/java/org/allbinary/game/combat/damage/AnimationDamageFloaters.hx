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
package org.allbinary.game.combat.damage;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.CircularIndexUtil;
import org.allbinary.view.ViewPosition;
import org.allbinary.view.ViewPositionBase;

class AnimationDamageFloaters extends DamageFloaters {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var layerInterface : AllBinaryLayer;
    private var animationInterfaceArray : haxe.ds.Vector<IndexedAnimation>;
    private final circularIndexUtil : CircularIndexUtil;
    private var dx : Int;
    private var dy : Int;
    public function new(layerInterface : AllBinaryLayer, animationInterfaceArray : haxe.ds.Vector<IndexedAnimation>, dx : Int, dy : Int) {
        super();
        this.animationInterfaceArray = animationInterfaceArray;
        {
            var index : Int = this.animationInterfaceArray.length - 1;
            while (index >= 0) {
            this.animationInterfaceArray[index].setFrame(this.animationInterfaceArray[index].getSize() - 1);
                index--;
            }
        }
        this.layerInterface = layerInterface;
        this.circularIndexUtil = CircularIndexUtil.createInstance(this.animationInterfaceArray.length);
        this.dx = dx;
        this.dy = dy;
    }

    public override function add(damage : Int) : Void {
        var i : Int = this.circularIndexUtil.getIndex();
        this.animationInterfaceArray[i].setFrame(0);
        this.circularIndexUtil.next();
    }

    public override function paint(graphics : Graphics) : Void {
        try {
            final viewPosition : ViewPositionBase = this.layerInterface.getViewPosition();
            final x : Int = viewPosition.getX();
            final y : Int = viewPosition.getY();
            for (index in 0...this.animationInterfaceArray.length) {
                var animationInterface : IndexedAnimation = this.animationInterfaceArray[index];
                if (animationInterface.getFrame() < animationInterface.getAnimationSize() - 1) {
                    var delta : Int = animationInterface.getFrame() * 20;
                    animationInterface.paintXY(graphics, x + this.dx, y - delta + this.dy);
                    animationInterface.nextFrame();
                }
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, canvasStrings.PAINT, e);
        }
    }

}

