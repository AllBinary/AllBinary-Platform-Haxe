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

class FormPaintable extends Paintable {
    private final form : PaintableForm;
    public function new(form : PaintableForm) {
        super();
        this.form = form;
    }

    public override function paint(graphics : Graphics) : Void {
        this.form.paint(graphics);
    }

    public function getForm() : PaintableForm {
        return this.form;
    }

}

