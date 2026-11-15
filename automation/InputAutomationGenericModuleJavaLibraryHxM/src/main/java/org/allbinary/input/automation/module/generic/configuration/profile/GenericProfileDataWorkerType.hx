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
package org.allbinary.input.automation.module.generic.configuration.profile;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.input.media.image.InputImageType;
import org.allbinary.logic.StdUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class GenericProfileDataWorkerType implements GenericProfileDataWorkerTypeInterface {
    private static var hashMap : HashMap = StdUtil.getInstance().createHashMap();
    public static var SAVED_CAPTURE : GenericProfileDataWorkerType = SavedCaptureGenericProfileDataWorkerType.SAVED_CAPTURE;
    public static var SCREEN_CAPTURE : GenericProfileDataWorkerType = new GenericProfileDataWorkerType("Screen " + InputImageType.CAPTURE.getName());
    public static var COMPARISON : GenericProfileDataWorkerType = new GenericProfileDataWorkerType(InputImageType.COMPARISON.getName());
    public static var MOTION : GenericProfileDataWorkerType = new GenericProfileDataWorkerType(InputImageType.MOTION.getName());
    private var name : String = null;
    public function new(name : String) {
        this.setName(name);
        GenericProfileDataWorkerType.hashMap.put(this.getName(), this);
    }

    public function getName() : String {
        return this.name;
    }

    public function setName(name : String) : Void {
        this.name = name;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = ModDomHelper.createTextNode(document, GenericProfileDataWorkerData.NAME, this.name);
        return node;
    }

    public function toString() : String {
        return "GenericProfileDataWorkerType: " + this.getName();
    }

    public static function getInstance(node : Node) : GenericProfileDataWorkerType {
        var name : String = DomNodeHelper.getTextNodeValue(node);
        return (cast GenericProfileDataWorkerType.hashMap.get(name) : GenericProfileDataWorkerType);
    }

}

