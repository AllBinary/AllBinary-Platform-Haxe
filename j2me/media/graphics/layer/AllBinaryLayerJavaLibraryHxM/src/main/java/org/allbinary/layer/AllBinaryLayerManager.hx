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
package org.allbinary.layer;

import org.allbinary.layer.event.LayerManagerEvent;
import org.allbinary.layer.event.LayerManagerEventHandler;

class AllBinaryLayerManager extends LayerManager {
    private final layerManagerEventHandler : LayerManagerEventHandler = LayerManagerEventHandler.getInstance();
    private final createLayerManagerEvent : LayerManagerEvent = new LayerManagerEvent(this, this.layerManagerEventHandler.CREATE);
    private final deleteLayerManagerEvent : LayerManagerEvent = new LayerManagerEvent(this, this.layerManagerEventHandler.DELETE);
    private var basicLayerProcessorArray : haxe.ds.Vector<LayerProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public function new() {
        super(LayerManagerNoDebug.getInstance());
    }

    public function getLayerProcessorArray() : haxe.ds.Vector<LayerProcessor> {
        return this.basicLayerProcessorArray;
    }

    public function setLayerProcessorArray(layerProcessorArray : haxe.ds.Vector<LayerProcessor>) : Void {
        this.basicLayerProcessorArray = layerProcessorArray;
    }

    public function log() : Void {
        var size : Int = this.basicLayerProcessorArray.length;
        for (index in 0...size) {
            var layerProcessorInterface : LayerProcessor = this.basicLayerProcessorArray[index];
        }
    }

    // throws Exception
    public override function append(layerInterface : AllBinaryLayer) : Void {
        if (!this.contains(layerInterface)) {
            this.appendProcessors(layerInterface);
            super.append(layerInterface);
        }
    }

    // throws Exception
    public override function appendAt(layerInterface : AllBinaryLayer, index : Int) : Void {
        if (!this.contains(layerInterface)) {
            this.appendProcessors(layerInterface);
            super.appendAt(layerInterface, index);
        }
    }

    // throws Exception
    private function appendProcessors(layerInterface : AllBinaryLayer) : Void {
        this.createLayerManagerEvent.setLayerInterface(layerInterface);
        this.layerManagerEventHandler.fireEvent(this.createLayerManagerEvent);
        var layerProcessorInterface : LayerProcessor = null;
        {
            var index : Int = this.basicLayerProcessorArray.length;
            while (--index >= 0) {
            layerProcessorInterface = this.basicLayerProcessorArray[index];
            if (layerProcessorInterface.isProcessorLayer(layerInterface)) {
                layerProcessorInterface.getLayerManager().append(layerInterface);
            }
            }
        }
    }

    // throws Exception
    // synchronized
    public override function remove(layerInterface : AllBinaryLayer) : Void {
        this.deleteLayerManagerEvent.setLayerInterface(layerInterface);
        this.layerManagerEventHandler.fireDeleteEvent(this.deleteLayerManagerEvent);
        var layerProcessorInterface : LayerProcessor = null;
        {
            var index : Int = this.basicLayerProcessorArray.length;
            while (--index >= 0) {
            layerProcessorInterface = this.basicLayerProcessorArray[index];
            layerProcessorInterface.getLayerManager().remove(layerInterface);
            }
        }
        super.remove(layerInterface);
    }

    // throws Exception
    public function process() : Void {
        var layerProcessorInterface : LayerProcessor = null;
        var size : Int = this.basicLayerProcessorArray.length;
        for (index in 0...size) {
            layerProcessorInterface = this.basicLayerProcessorArray[index];
            layerProcessorInterface.process(this);
        }
    }

    // throws Exception
    public override function cleanup() : Void {
        var layerProcessorInterface : LayerProcessor = null;
        var size : Int = this.basicLayerProcessorArray.length;
        for (index in 0...size) {
            layerProcessorInterface = this.basicLayerProcessorArray[index];
            layerProcessorInterface.getLayerManager().cleanup();
        }
        super.cleanup();
    }

}

