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
package org.allbinary.business.category;

import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.data.TransformDocumentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;

class CategoryComponent extends CategoryView implements TransformInterface {
    public function new(categoryInterface : CategoryInterface) {
        super(categoryInterface);
    }

    public var NO_TYPE : Int = 0;
    public function getTypeId() : Int {
        return this.NO_TYPE;
    }

    public function getTransformDocumentInterface() : TransformDocumentInterface {
        return null;
    }

    // throws Exception
    public function getTransformInfoInterface() : TransformInfoInterface {
        return null;
    }

    public function setTransformDocumentInterface(viewDocumentInterface : TransformDocumentInterface) : Void {
    }

    // throws Exception
    public function toXmlDoc() : Document {
        var document : Document = DomDocumentHelper.create();
        document.appendChild(new CategoryView(this.getCategoryInterface()).toXmlNode(document));
        return document;
    }

    // throws Exception
    public function view() : String {
        return null;
    }

}

