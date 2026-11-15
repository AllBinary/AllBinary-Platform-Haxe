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

import org.allbinary.graphics.form.item.ABCustomItem;

class ScrollSelectionFormTempHorizontalDx extends ItemIndexDx {
    private final scrollSelectionForm : ScrollSelectionForm;
    public function new(scrollSelectionForm : ScrollSelectionForm) {
        super();
        this.scrollSelectionForm = scrollSelectionForm;
    }

    // throws Exception
    public override function getDx(index : Int, item : ABCustomItem, dx : Int, dy : Int) : Int {
        return this.scrollSelectionForm.getSelectedIndexForPointTempHorizontalDx(index, item, dx, dy);
    }

}

