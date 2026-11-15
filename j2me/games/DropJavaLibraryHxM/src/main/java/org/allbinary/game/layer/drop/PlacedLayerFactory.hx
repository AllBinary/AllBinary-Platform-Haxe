// Generated Code Do Not Modify
package org.allbinary.game.layer.drop;

import org.allbinary.layer.AllBinaryLayerFactoryInterface;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class PlacedLayerFactory {
    private static final instance : PlacedLayerFactory = new PlacedLayerFactory();
    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function clear() : Void {
        this.list.clear();
    }

    public static function getInstance() : PlacedLayerFactory {
        return PlacedLayerFactory.instance;
    }

    public function getSize() : Int {
        return this.list.size();
    }

    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    public function getRandomInstance() : AllBinaryLayerFactoryInterface {
        return (cast this.basicArrayListUtil.getRandom(this.list) : AllBinaryLayerFactoryInterface);
    }

    public function add(layerInterfaceFactoryInterface : AllBinaryLayerFactoryInterface) : Void {
        this.list.add(layerInterfaceFactoryInterface);
    }

}

