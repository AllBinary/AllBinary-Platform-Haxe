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
package org.allbinary.input.media.image;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;

class InputImageType {
    private static var hashMap : HashMap = StdUtil.getInstance().createHashMap();
    private static final TYPE_VECTOR : BasicArrayList = new BasicArrayListD();
    public static var CAPTURE : InputImageType = new InputImageType("Capture", 0);
    public static var COMPARISON : InputImageType = new InputImageType("Comparison", 1);
    public static var MOTION : InputImageType = new InputImageType("Motion", 2);
    private final name : String;
    private final index : Int;
    public function new(name : String, index : Int) {
        this.name = name;
        this.index = index;
        InputImageType.TYPE_VECTOR.add(this);
        InputImageType.hashMap.put(this.getName(), this);
    }

    public function toString() : String {
        return "ImageType: " + this.getName();
    }

    public function getName() : String {
        return this.name;
    }

    public static function getInstance(imageTypeString : String) : InputImageType {
        return (cast InputImageType.hashMap.get(imageTypeString) : InputImageType);
    }

    public static function getAllAsVector() : BasicArrayList {
        return InputImageType.TYPE_VECTOR;
    }

    public function getIndex() : Int {
        return this.index;
    }

}

