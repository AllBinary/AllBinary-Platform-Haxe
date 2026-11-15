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

import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.logic.string.StringUtil;

class FormTypeFactory {
    private static final instance : FormTypeFactory = new FormTypeFactory();
    public static function getInstance() : FormTypeFactory {
        return FormTypeFactory.instance;
    }

    public final UNK : String = "Unknown FormType";
    public final NULL_FORM_TYPE : FormType = new FormType(StringUtil.getInstance().NULL_STRING);
    public final TEMP_HORIZONTAL_FORM : FormType = new FormType("TempHorizontal");
    public final HORIZONTAL_FORM : FormType = new FormType("Horizontal");
    public final VERTICAL_CENTER_FORM : FormType = new FormType("Vertical");
    public function getFormType() : FormType {
        var displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        var formType : FormType = null;
        if (displayInfo.isPortrait()) {
            formType = this.VERTICAL_CENTER_FORM;
        } else {
            formType = this.HORIZONTAL_FORM;
        }
        return formType;
    }

    public function new() {
    }
}

