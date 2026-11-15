// Generated Code Do Not Modify
package org.allbinary.game.input;

import org.allbinary.logic.NullUtil;

class AndroidAPI1KeyFactory extends AndroidKeyFactory {
    private static var instance : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getInstance() : AndroidAPI1KeyFactory {
        if (AndroidAPI1KeyFactory.instance == NullUtil.getInstance().NULL_OBJECT) {
            AndroidAPI1KeyFactory.instance = new AndroidAPI1KeyFactory();
        }
        return (cast AndroidAPI1KeyFactory.instance : AndroidAPI1KeyFactory);
    }

    public function new() {
        super();
    }

}

