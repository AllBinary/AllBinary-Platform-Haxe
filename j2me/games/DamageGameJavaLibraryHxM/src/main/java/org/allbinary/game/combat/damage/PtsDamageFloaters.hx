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
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorArrayIndexer;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.java.character.CharArrayFactory;
import org.allbinary.logic.math.PrimitiveLongUtil;
import org.allbinary.util.CircularIndexUtil;
import org.allbinary.view.ViewPosition;
import org.allbinary.view.ViewPositionBase;

class PtsDamageFloaters extends DamageFloaters {
    public final basicSetColorUtil : BasicColorSetUtil = BasicColorSetUtil.getInstance();
    private var layerInterface : AllBinaryLayer;
    private var lastDamage : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...5) 0]);
    private var lastDamageString : haxe.ds.Vector<haxe.ds.Vector<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...5) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) 0])]);
    private var lastDamageStringSizeArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...5) 0]);
    private var circularIndexUtil : CircularIndexUtil = CircularIndexUtil.createInstance(5);
    private final primitiveLongUtil : PrimitiveLongUtil;
    private static final basicColorArrayIndexer : BasicColorArrayIndexer = new BasicColorArrayIndexer(haxe.ds.Vector.fromArrayCopy([BasicColorFactory.getInstance().WHITE, BasicColorFactory.getInstance().RED, BasicColorFactory.getInstance().YELLOW, BasicColorFactory.getInstance().BLUE]));
    public function new(layerInterface : AllBinaryLayer) {
        super();
        this.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(100000);
        this.layerInterface = layerInterface;
        var CHAR_ARRAY : haxe.ds.Vector<Int> = CharArrayFactory.getInstance().getZeroCharArray();
        {
            var index : Int = this.lastDamageString.length - 1;
            while (index >= 0) {
            this.lastDamageString[index] = CHAR_ARRAY;
                index--;
            }
        }
    }

    public override function add(damage : Int) : Void {
        var index : Int = this.circularIndexUtil.getIndex();
        this.lastDamage[index] = damage;
        this.lastDamageString[index] = this.primitiveLongUtil.getCharArray(this.lastDamage[index]);
        this.lastDamageStringSizeArray[index] = this.primitiveLongUtil.getCurrentTotalDigits();
        this.circularIndexUtil.next();
    }

    private final myRandomFactory : MyRandomFactory = MyRandomFactory.getInstance();
    public override function paint(graphics : Graphics) : Void {
        final viewPosition : ViewPositionBase = this.layerInterface.getViewPosition();
        final x : Int = viewPosition.getX();
        final y : Int = viewPosition.getY();
        {
            var index : Int = this.lastDamage.length - 1;
            while (index >= 0) {
            if (this.lastDamage[index] != 0) {
                var delta : Int = 10 * (index + 2);
                this.basicSetColorUtil.setBasicColorP(graphics, PtsDamageFloaters.basicColorArrayIndexer.get());
                graphics.drawChars(this.lastDamageString[index], 0, this.lastDamageStringSizeArray[index], x - this.myRandomFactory.getNextInt(delta), y - delta, 0);
                PtsDamageFloaters.basicColorArrayIndexer.next();
            }
            this.lastDamage[index] = 0;
                index--;
            }
        }
    }

}

