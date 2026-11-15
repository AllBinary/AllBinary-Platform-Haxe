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
package org.allbinary.graphics.j2me.workarea.tools;

//import java.util.HashMap;
import org.allbinary.log.LOGGING;
import org.allbinary.logic.StdUtil;
import org.allbinary.util.BasicArrayList;
import org.w3c.dom.Node;

class GraphicItemFactory {
    private static final instance : GraphicItemFactory = new GraphicItemFactory();
    public static function getInstance() : GraphicItemFactory {
        return GraphicItemFactory.instance;
    }

    private final graphicItems : HashMap;
    private final DEFAULT : GraphicsItemInterfaceFactoryInterface = new SelectionToolFactory();
    public function new() {
        this.graphicItems = StdUtil.getInstance().createHashMap();
        this.graphicItems.put(LinesGraphicItem.getStaticName(), new LinesGraphicItemFactory());
    }

    public function getInstance(itemName : String) : GraphicsItemInterfaceFactoryInterface {
        var graphicsItemInterfaceFactoryInterface : GraphicsItemInterfaceFactoryInterface = (cast this.graphicItems.get(itemName) : GraphicsItemInterfaceFactoryInterface);
        if (graphicsItemInterfaceFactoryInterface == null) {
            graphicsItemInterfaceFactoryInterface = DEFAULT;
        }
        return graphicsItemInterfaceFactoryInterface;
    }

    // throws Exception
    public function getInstance(graphicItemNodeList : BasicArrayList) : HashMap {
        var numberOfItems : Int = graphicItemNodeList.size();
        var graphicItemHashMap : HashMap = StdUtil.getInstance().createHashMap();
        if (LOGGING.contains(LOGGING.MENUEVENT)) {
        }
        for (index in 0...numberOfItems) {
            var graphicItem : GraphicItemInterface = GraphicItemBuilder.getInstance((cast graphicItemNodeList.get(index) : Node));
            graphicItemHashMap.put(graphicItem.getTreeNode(), graphicItem);
        }
        return graphicItemHashMap;
    }

}

