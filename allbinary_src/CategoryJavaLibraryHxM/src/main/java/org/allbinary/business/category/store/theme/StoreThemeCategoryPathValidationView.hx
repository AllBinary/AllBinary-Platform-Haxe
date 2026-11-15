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
package org.allbinary.business.category.store.theme;

import org.allbinary.logic.control.validate.ValidationInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class StoreThemeCategoryPathValidationView extends StoreThemeCategoryPathView implements ValidationInterface {
    public function new(categoryInterface : StoreThemeCategoryInterface) {
        super((cast categoryInterface : StoreThemeCategoryInterface));
    }

    // throws Exception
    public function isValid() : Null<Bool> {
        return true;
    }

    // throws Exception
    public function toValidationInfoDoc() : Document {
        return null;
    }

    // throws Exception
    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public function validationInfo() : String {
        return "Error";
    }

}

