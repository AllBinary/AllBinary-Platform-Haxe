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
package org.allbinary.game.part;

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory;
import org.allbinary.graphics.font.MyFontProcessor;
import org.allbinary.graphics.font.UpdateMyFontInterface;
import org.allbinary.graphics.font.UpdateMyFontProcessor;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.math.PrimitiveLongUtil;
import org.allbinary.util.ABHashtable;

class CountedLayerInterfaceFactoryPart implements PartInterface implements UpdateMyFontInterface {
    public static final NULL_COUNTED_LAYER_INTERFACE_FACTORY : CountedLayerInterfaceFactoryPart = new CountedLayerInterfaceFactoryPart(0, CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY);
    private final updateMyFontProcessor : MyFontProcessor;
    private var myFontProcessor : MyFontProcessor;
    private var animationInterface : Animation = NullAnimationFactory.getFactoryInstance().getInstanceFor(0);
    private var total : Int = 0;
    private var totalString : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_CHAR_ARRAY;
    private var xOffset : Int = 0;
    private var countedPickedUpLayerInterfaceFactory : CountedPickedUpLayerInterfaceFactory = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY;
    private final primitiveLongUtil : PrimitiveLongUtil;
    public function new(total : Int, countedPickedUpLayerInterfaceFactory : CountedPickedUpLayerInterfaceFactory) {
        this.updateMyFontProcessor = new UpdateMyFontProcessor(this);
        this.myFontProcessor = this.updateMyFontProcessor;
        this.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(1000);
        this.init(total, countedPickedUpLayerInterfaceFactory);
    }

    public function updateMeasurement(graphics : Graphics) : Void {
        final font : Font = graphics.getFont();
        this.setXOffset(font.charsWidth(this.totalString, 0, this.primitiveLongUtil.getCurrentTotalDigits()) + (font.getSize() >> 1));
        this.myFontProcessor = MyFontProcessor.getInstance();
    }

    private function init(total : Int, countedPickedUpLayerInterfaceFactory : CountedPickedUpLayerInterfaceFactory) : Void {
        this.setCountedPickedUpLayerInterfaceFactory(countedPickedUpLayerInterfaceFactory);
        this.total = total;
    }

    // throws Exception
    public function getInstanceFor(hashtable : ABHashtable<Any, Any>, x : Int, y : Int, z : Int) : AllBinaryLayer {
        if (this.total > 0) {
            this.setTotal(this.total - 1);
            return this.getCountedPickedUpLayerInterfaceFactory().getNextInstance(hashtable, x, y, z);
        } else {
            throw new jre.lang.JavaException("No more left. Could use a listener to automatically remove");
        }
    }

    public function getTotal() : Int {
        return this.total;
    }

    public function setTotal(total : Int) : Void {
        this.total = total;
        this.totalString = this.primitiveLongUtil.getCharArray(total);
        this.myFontProcessor = this.updateMyFontProcessor;
    }

    public function paint(graphics : Graphics) : Void {
        this.myFontProcessor.process(graphics);
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

    public function getAnimationInterface() : Animation {
        return this.animationInterface;
    }

    public function setAnimationInterface(animationInterface : Animation) : Void {
        this.animationInterface = animationInterface;
    }

    public function getXOffset() : Int {
        return this.xOffset;
    }

    private function setXOffset(totalStringWidth : Int) : Void {
        this.xOffset = totalStringWidth;
    }

    public function getTotalString() : haxe.ds.Vector<Int> {
        return this.totalString;
    }

    public function getCountedPickedUpLayerInterfaceFactory() : CountedPickedUpLayerInterfaceFactory {
        return this.countedPickedUpLayerInterfaceFactory;
    }

    public function setCountedPickedUpLayerInterfaceFactory(countedPickedUpLayerInterfaceFactory : CountedPickedUpLayerInterfaceFactory) : Void {
        this.countedPickedUpLayerInterfaceFactory = countedPickedUpLayerInterfaceFactory;
    }

}

