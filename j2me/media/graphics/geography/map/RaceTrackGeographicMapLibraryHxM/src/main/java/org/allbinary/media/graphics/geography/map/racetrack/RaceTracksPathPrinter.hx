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
package org.allbinary.media.graphics.geography.map.racetrack;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonLabels;

class RaceTracksPathPrinter {
    private function printPath(list : BasicArrayList) : Void {
        final size : Int = list.size();
        for (index in 0...size) {
            var anyType : Any = list.get(index);
            PreLogUtil.put(new StringMaker().append("pathList.add(cellPositionFactory.getInstance").append(anyType.toString()).append(");").toString(), this, "printPath");
        }
    }

    public function printPaths(list : BasicArrayList) : Void {
        final size : Int = list.size();
        for (index in 0...size) {
            trace(new StringMaker().append(" Path ").appendint(index).append(CommonLabels.getInstance().COLON_SEP).toString());
            this.printPath((cast list.get(index) : BasicArrayList));
        }
    }

    public function new() {
    }
}

