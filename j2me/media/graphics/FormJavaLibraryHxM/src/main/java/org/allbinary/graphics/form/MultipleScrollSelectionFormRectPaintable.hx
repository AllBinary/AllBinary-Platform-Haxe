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
import org.allbinary.graphics.paint.Paintable;

class MultipleScrollSelectionFormRectPaintable extends Paintable {
    private final multipleScrollSelectionForm : MultipleScrollSelectionHorizontalForm;
    public function new(multipleScrollSelectionForm : MultipleScrollSelectionHorizontalForm) {
        super();
        this.multipleScrollSelectionForm = multipleScrollSelectionForm;
    }

    public override function paint(graphics : Graphics) : Void {
        this.multipleScrollSelectionForm.fillRect(graphics);
    }

}

