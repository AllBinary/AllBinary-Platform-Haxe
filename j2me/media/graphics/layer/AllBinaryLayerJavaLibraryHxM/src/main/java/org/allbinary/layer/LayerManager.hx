// Generated Code Do Not Modify
package org.allbinary.layer;

import javax.microedition.lcdui.Graphics;
import org.allbinary.TsUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.SynchObject;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.ABSystemWrapper;

class LayerManager {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final systemWrapper : ABSystemWrapper = ABSystemWrapper.getInstance();
    private final tsUtil : TsUtil = TsUtil.getInstance();
    private final layerManagerLogging : LayerManagerLoggingBase;
    private final list : BasicArrayList = new BasicArrayListD();
    private final anyType : SynchObject = new SynchObject();
    public function new(layerManagerLogging : LayerManagerLoggingBase) {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        this.layerManagerLogging = layerManagerLogging;
    }

    public function contains(layerInterface : AllBinaryLayer) : Bool {
        return this.list.contains(layerInterface);
    }

    // throws Exception
    public function update(layerInterface : AllBinaryLayer) : Void {
        var had : Bool = this.list.remove(layerInterface);
        if (had) {
            var nextLayerInterface : AllBinaryLayer = null;
            final size : Int = this.list.size();
            for (index in 0...size) {
                nextLayerInterface = (cast this.list.get(index) : AllBinaryLayer);
                if (layerInterface.getZP() > nextLayerInterface.getZP()) {
                    this.list.addAt(index, layerInterface);
                    return;
                }
            }
            this.list.add(layerInterface);
        }
    }

    // throws Exception
    public function insert(layerInterface : AllBinaryLayer) : Void {
        var nextLayerInterface : AllBinaryLayer = null;
        final size : Int = this.list.size();
        for (index in 0...size) {
            nextLayerInterface = (cast this.list.get(index) : AllBinaryLayer);
            if (layerInterface.getZP() > nextLayerInterface.getZP()) {
                this.appendAt(layerInterface, index);
                return;
            }
        }
        this.append(layerInterface);
    }

    // throws Exception
    public function append(layerInterface : AllBinaryLayer) : Void {
        this.layerManagerLogging.append(layerInterface);
        this.list.add(layerInterface);
    }

    // throws Exception
    public function appendAt(layerInterface : AllBinaryLayer, index : Int) : Void {
        this.layerManagerLogging.appendAt(layerInterface, index);
        this.list.addAt(index, layerInterface);
    }

    // throws Exception
    public function remove(layerInterface : AllBinaryLayer) : Void {
        // synchronized (this.anyType)
        {
            this.layerManagerLogging.remove(layerInterface);
            final result : Bool = this.list.remove(layerInterface);
            this.layerManagerLogging.removeResult(this, layerInterface, result);
        }
    }

    public function getLayerAt(index : Int) : Layer {
        return (cast this.list.objectArray[index] : Layer);
    }

    public function getSize() : Int {
        return this.list.size();
    }

    // throws Exception
    public function cleanup() : Void {
        // synchronized (this.anyType)
        {
            this.list.clear();
            this.layerManagerLogging.clear();
            this.tsUtil.gc();
            this.tsUtil.gc();
        }
    }

    public function paint(g : Graphics, x : Int, y : Int) : Void {
        // synchronized (this.anyType)
        {
            var comp : Layer = null;
            {
                var index : Int = this.list.size();
                while (--index >= 0) {
                comp = (cast this.list.objectArray[index] : Layer);
                if (comp != null && comp.isVisible()) {
                    comp.paint(g);
                }
                }
            }
        }
    }

}

