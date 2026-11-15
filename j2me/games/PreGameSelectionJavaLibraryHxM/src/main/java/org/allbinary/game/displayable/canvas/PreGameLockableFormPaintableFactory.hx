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

import org.allbinary.graphics.form.ItemPaintable;
import org.allbinary.graphics.form.ItemPaintableFactory;
import org.allbinary.graphics.form.PaintableForm;
import org.allbinary.graphics.form.ScrollCurrentSelectionForm;

class PreGameLockableFormPaintableFactory extends ItemPaintableFactory {
    private final lockedIndex : Int;
    public function new(lockedIndex : Int) {
        super();
        this.lockedIndex = lockedIndex;
    }

    // throws Exception
    public override function getInstanceItemPaintable(paintableForm : PaintableForm) : ItemPaintable {
        return new PreGameLockablePaintable((cast paintableForm : ScrollCurrentSelectionForm), this.lockedIndex);
    }

}

