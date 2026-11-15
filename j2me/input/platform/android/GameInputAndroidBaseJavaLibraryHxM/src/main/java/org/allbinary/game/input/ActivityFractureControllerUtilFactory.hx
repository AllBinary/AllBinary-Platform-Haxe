// Generated Code Do Not Modify
package org.allbinary.game.input;

import org.allbinary.android.AndroidInfoFactory;

class ActivityFractureControllerUtilFactory {
    public static function getInstance() : AndroidKeyFactory {
        final SDK_VERSION : Int = AndroidInfoFactory.getInstance().getVersion();
        if (SDK_VERSION <= 8) {
            return AndroidAPI1KeyFactory.getInstance();
        } else if (SDK_VERSION <= 11) {
            return AndroidAPI9KeyFactory.getInstance();
        } else {
            return AndroidAPI12KeyFactory.getAPI12Instance();
        }
    }

    public function new() {
    }
}

