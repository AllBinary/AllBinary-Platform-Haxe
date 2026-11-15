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
package org.allbinary.input.automation.module.game;

//import java.awt.image.BufferedImage;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;

class MeteredGameObject implements MeteredGameObjectInterface {
    private var ratios : haxe.ds.Vector<Null<Float>> = null;
    private var good : Bool = false;
    private var dropping : Bool = false;
    private var minX : Null<Int> = null;
    private var maxX : Null<Int> = null;
    private var y : Null<Int> = null;
    private var size : Null<Int> = null;
    private final RATIOS_LABEL : String = "Ratios: ";
    private final IS_GOOD_LABEL : String = "isGood: ";
    private final IS_DROPPPING_LABEL : String = "isDropping: ";
    public function new(bufferedImage : haxe.ds.Vector<BufferedImage>, minX : Null<Int>, maxX : Null<Int>, y : Null<Int>) {
        this.setRatios(haxe.ds.Vector.fromArrayCopy([for (index in 0...bufferedImage.length) null]));
        this.setMinX(minX);
        this.setMaxX(maxX);
        this.setY(y);
        this.setSize(maxX - minX);
        for (index in 0...bufferedImage.length) {
            var nominator : Float = GraphicsAnalysisUtil.getNominator(bufferedImage[index], this.getMinX(), this.getMaxX(), this.getY());
            this.getRatios()[index] = nominator / this.getSize();
        }
        if (this.getRatios()[bufferedImage.length - 1] > 0.93) {
            this.setGood(true);
        } else {
            this.setGood(false);
        }
        if (this.getRatios()[bufferedImage.length - 1] < this.getRatios()[0]) {
            this.setDropping(true);
        } else {
            this.setDropping(false);
        }
    }

    public function isGood() : Bool {
        return this.good;
    }

    public function setGood(good : Bool) : Void {
        this.good = good;
    }

    public function isDropping() : Bool {
        return this.dropping;
    }

    public function setDropping(dropping : Bool) : Void {
        this.dropping = dropping;
    }

    public function getRatios() : haxe.ds.Vector<Null<Float>> {
        return this.ratios;
    }

    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(this.RATIOS_LABEL);
        for (index in 0...this.getRatios().length) {
            stringBuffer.append(this.getRatios()[index].toString());
            if (index < this.getRatios().length - 1) {
                stringBuffer.append(commonSeps.COMMA_SEP);
            }
        }
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(this.IS_GOOD_LABEL);
        stringBuffer.appendboolean(this.isGood());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(this.IS_DROPPPING_LABEL);
        stringBuffer.appendboolean(this.isDropping());
        return stringBuffer.toString();
    }

    public function setRatios(ratios : haxe.ds.Vector<Null<Float>>) : Void {
        this.ratios = ratios;
    }

    public function getMinX() : Null<Int> {
        return this.minX;
    }

    public function setMinX(minX : Null<Int>) : Void {
        this.minX = minX;
    }

    public function getMaxX() : Null<Int> {
        return this.maxX;
    }

    public function setMaxX(maxX : Null<Int>) : Void {
        this.maxX = maxX;
    }

    public function getY() : Null<Int> {
        return this.y;
    }

    public function setY(y : Null<Int>) : Void {
        this.y = y;
    }

    public function getSize() : Null<Int> {
        return this.size;
    }

    public function setSize(size : Null<Int>) : Void {
        this.size = size;
    }

}

