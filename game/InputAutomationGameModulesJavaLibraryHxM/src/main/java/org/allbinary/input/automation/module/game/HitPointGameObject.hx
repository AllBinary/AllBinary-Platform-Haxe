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

class HitPointGameObject extends MeteredGameObject implements HitPointGameObjectInterface {
    private var damaged : Bool = false;
    private var closeDeath : Bool = false;
    private final HP_LABEL : String = "HP: ";
    private final IS_DAMAGED_LABEL : String = "isDamaged: ";
    private final IS_CLOSE_DEATH_LABEL : String = "isCloseDeath: ";
    public function new(bufferedImage : haxe.ds.Vector<BufferedImage>, minX : Null<Int>, maxX : Null<Int>, y : Null<Int>) {
        super(bufferedImage, minX, maxX, y);
        if (this.getRatios()[bufferedImage.length - 1] < 1.0) {
            this.setDamaged(true);
        } else {
            this.setDamaged(false);
        }
        if (this.getRatios()[bufferedImage.length - 1] > 0.25) {
            this.closeDeath = false;
        } else {
            this.closeDeath = true;
        }
    }

    public function isMoreThan(aFloat : Float) : Bool {
        if (this.getRatios()[this.getRatios().length - 1] > aFloat) {
            return true;
        } else {
            return false;
        }
    }

    public function isCloseDeath() : Bool {
        return this.closeDeath;
    }

    public function setCloseDeath(closeDeath : Bool) : Void {
        this.closeDeath = closeDeath;
    }

    public function isDamaged() : Bool {
        return this.damaged;
    }

    public function setDamaged(damaged : Bool) : Void {
        this.damaged = damaged;
    }

    public function toString() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.HP_LABEL);
        stringBuffer.append(super.toString());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(this.IS_DAMAGED_LABEL);
        stringBuffer.appendboolean(this.isDamaged());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(this.IS_CLOSE_DEATH_LABEL);
        stringBuffer.appendboolean(this.isCloseDeath());
        return stringBuffer.toString();
    }

}

