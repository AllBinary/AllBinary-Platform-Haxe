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
package org.allbinary.logic.java.help;

//import java.net.URL;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.help.HelpSet;

class JavaHelpSetNotifier {
    private static var vector : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    private static function get() : BasicArrayList {
        return JavaHelpSetNotifier.vector;
    }

    public static function isNotified(helpSet : HelpSet) : Bool {
        var isNotified : Bool = false;
        var url : URL = helpSet.getHelpSetURL();
        var size : Int = JavaHelpSetNotifier.vector.size();
        var urlArray : haxe.ds.Vector<Any> = JavaHelpSetNotifier.vector.toArray();
        for (i in 0...size) {
            var nextURL : URL = (cast urlArray[i] : URL);
            if (Reflect.compare(url.toString(), nextURL.toString()) == 0) {
                isNotified = true;
            }
        }
        JavaHelpSetNotifier.vector.add(url);
        return isNotified;
    }

}

