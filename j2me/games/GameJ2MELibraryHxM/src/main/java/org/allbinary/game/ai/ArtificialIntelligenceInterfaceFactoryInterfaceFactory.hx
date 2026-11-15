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
package org.allbinary.game.ai;

import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class ArtificialIntelligenceInterfaceFactoryInterfaceFactory {
    private static var SINGLETON : ArtificialIntelligenceInterfaceFactoryInterfaceFactory = new ArtificialIntelligenceInterfaceFactoryInterfaceFactory();
    private var list : BasicArrayList = BasicArrayListUtil.getInstance().getImmutableInstance();
    public function clear() : Void {
        this.list = new BasicArrayListD();
    }

    public static function getInstance() : ArtificialIntelligenceInterfaceFactoryInterfaceFactory {
        return ArtificialIntelligenceInterfaceFactoryInterfaceFactory.SINGLETON;
    }

    public function getInstanceFromCollection(hashtable : ABHashtable<Any, Any>) : ArtificialIntelligenceInterfaceFactoryInterface {
        final typeInteger : Null<Int> = (cast hashtable.get((cast BasicAI.ID : Any)) : Null<Int>);
        var type : Int = Std.int(typeInteger);
        final artificialIntelligenceInterfaceFactoryInterface : ArtificialIntelligenceInterfaceFactoryInterface = (cast this.list.objectArray[type - 1] : ArtificialIntelligenceInterfaceFactoryInterface);
        return artificialIntelligenceInterfaceFactoryInterface;
    }

    public function add(artificialIntelligenceInterfaceFactoryInterface : ArtificialIntelligenceInterfaceFactoryInterface) : Void {
        this.list.add(artificialIntelligenceInterfaceFactoryInterface);
    }

    public function new() {
    }
}

