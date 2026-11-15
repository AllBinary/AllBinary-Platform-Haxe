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
package views.generic.inventory;

import org.allbinary.logic.control.search.SearchRequest;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class AutoSearchValidationInventoryView extends InventorySearch {
    public function new(searchRequest : SearchRequest) {
        super(searchRequest);
    }

    public function isValid() : Null<Bool> {
        return true;
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    public function validationInfo() : String {
        return null;
    }

}

