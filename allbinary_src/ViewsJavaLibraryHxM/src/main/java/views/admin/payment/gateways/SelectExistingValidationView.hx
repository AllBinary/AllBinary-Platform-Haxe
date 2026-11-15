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
package views.admin.payment.gateways;

import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.HttpStoreComponentView;

class SelectExistingValidationView extends HttpStoreComponentView implements ValidationComponentInterface {
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
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

    // throws Exception
    public function validationInfo() : String {
        throw new haxe.Exception("validationInfo");
    }

    public function toXmlDoc() : Document {
        return null;
    }

    public function toXmlNode(document : Document) : Node {
        return null;
    }

    // throws Exception
    public function view() : String {
        return new SelectExistingView(this.getTransformInfoInterface()).view();
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

