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
package org.allbinary.graphics.form;

import javax.microedition.lcdui.Graphics;
import org.allbinary.graphics.form.item.ABCustomItem;

class ScrollSelectionFormVerticalPaintable extends ItemIndexPaintable {
    private final scrollSelectionForm : ScrollSelectionForm;
    public function new(scrollSelectionForm : ScrollSelectionForm) {
        super();
        this.scrollSelectionForm = scrollSelectionForm;
    }

    // throws Exception
    public override function paint(graphics : Graphics, index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return this.scrollSelectionForm.paintItemVertical(graphics, index, item, dx, dy);
    }

}

