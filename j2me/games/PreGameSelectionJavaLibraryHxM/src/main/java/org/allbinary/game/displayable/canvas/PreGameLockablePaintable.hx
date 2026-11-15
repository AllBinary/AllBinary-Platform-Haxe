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
package org.allbinary.game.displayable.canvas;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.image.GameFeatureImageCacheFactory;
import org.allbinary.logic.system.security.licensing.LockedResources;
import org.allbinary.logic.system.security.licensing.LockedUtil;
import org.allbinary.graphics.form.LockablePaintable;
import org.allbinary.graphics.form.ScrollCurrentSelectionForm;

class PreGameLockablePaintable extends LockablePaintable {
    private final halfWidth : Int;
    private final paintableForm : ScrollCurrentSelectionForm;
    public function new(paintableForm : ScrollCurrentSelectionForm, lockedIndex : Int) {
        super(lockedIndex);
        this.paintableForm = paintableForm;
        this.halfWidth = GameFeatureImageCacheFactory.getInstance().getWithKey(LockedResources.getInstance().LOCKED_DEMO_GAME_FEATURE_RESOURCE).getWidth() / 2;
    }

    public override function paint(graphics : Graphics, currentIndex : Int, x : Int, y : Int) : Void {
        if (LockedUtil.getInstance().isLocked() && this.getPaintableForm().getSelectedIndex() >= this.getLockedIndex()) {
            this.getAnimation().paintXY(graphics, this.getPaintableForm().getDx() - this.halfWidth, this.getPaintableForm().getDy() + 34);
        }
    }

    public function getPaintableForm() : ScrollCurrentSelectionForm {
        return this.paintableForm;
    }

}

