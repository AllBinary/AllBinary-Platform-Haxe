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

class MultipleScrollSelectionFormHorizontalPaintable extends ItemIndexPaintable {
    private final multipleScrollSelectionForm : MultipleScrollSelectionHorizontalForm;
    public function new(multipleScrollSelectionForm : MultipleScrollSelectionHorizontalForm) {
        super();
        this.multipleScrollSelectionForm = multipleScrollSelectionForm;
    }

    // throws Exception
    public override function paint(graphics : Graphics, index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return this.multipleScrollSelectionForm.paintHorizontal(graphics, index, item, dx, dy);
    }

}

