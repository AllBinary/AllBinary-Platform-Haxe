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
package org.allbinary.logic.communication.http;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.TsUtil;
import org.allbinary.logic.StdUtil;

class AcceptableResponseUtil {
    private static final instance : AcceptableResponseUtil = new AcceptableResponseUtil();
    public static function getInstance() : AcceptableResponseUtil {
        return AcceptableResponseUtil.instance;
    }

    static function __init__() {
        TsUtil.getInstance().hashCode(AcceptableResponseFactory.getInstance().HTML);
    }
    public final candidateVector : BasicArrayList = new BasicArrayListD();
    public final tagNameVector : BasicArrayList = new BasicArrayListD();
    public function get(index : Int) : String {
        return (cast this.candidateVector.get(index) : String);
    }

    public function getTagName(index : Int) : String {
        return (cast this.tagNameVector.get(index) : String);
    }

    public function size() : Int {
        return this.candidateVector.size();
    }

    public function new() {
    }
}

