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
package org.allbinary.game.layer.identification;

import org.allbinary.game.identification.Group;
import org.allbinary.game.identification.GroupInterfaceCompositeInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.event.LayerManagerEvent;
import org.allbinary.layer.event.LayerManagerEventHandler;
import org.allbinary.layer.event.LayerManagerEventListener;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.logic.util.event.EventStrings;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GroupLayerManagerListener extends LayerManagerEventListener {
    private static var SINGLETON : GroupLayerManagerListener = new GroupLayerManagerListener();
    public static function getInstance() : GroupLayerManagerListener {
        return GroupLayerManagerListener.SINGLETON;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
        super();
        LayerManagerEventHandler.getInstance().addListener(this);
    }

    public function clear() : Void {
        var groupList : BasicArrayList = null;
        var size : Int = this.list.size();
        {
            var index : Int = size - 1;
            while (index >= 0) {
            groupList = (cast this.list.objectArray[index] : BasicArrayList);
            groupList.clear();
                index--;
            }
        }
    }

    public function getGroupSizeFromInterface(groupInterfaceCompositeInterface : GroupInterfaceCompositeInterface) : Int {
        final groupInterfaceArray : haxe.ds.Vector<Group> = groupInterfaceCompositeInterface.getGroupInterface();
        return this.getGroupSize(groupInterfaceArray[0]);
    }

    public function getGroupSize(groupInterface : Group) : Int {
        final id : Int = jre.lang.JavaNumber.toInt(groupInterface.getGroupId());
        return this.getGroupSizeById(id);
    }

    public function getList(groupInterface : Group) : BasicArrayList {
        final id : Int = jre.lang.JavaNumber.toInt(groupInterface.getGroupId());
        return this.getListById(id);
    }

    private function getListById(groupId : Int) : BasicArrayList {
        final groupList : BasicArrayList = (cast this.list.objectArray[groupId] : BasicArrayList);
        return groupList;
    }

    private function getGroupSizeById(groupId : Int) : Int {
        final groupList : BasicArrayList = (cast this.list.objectArray[groupId] : BasicArrayList);
        final size : Int = groupList.size();
        return size;
    }

    public function areAllOtherGroupsEmpty(groupInterface : Group) : Bool {
        final id : Int = jre.lang.JavaNumber.toInt(groupInterface.getGroupId());
        final size : Int = this.list.size();
        {
            var index : Int = size - 1;
            while (index >= 0) {
            if (id != index) {
                var groupSize : Int = this.getGroupSizeById(index);
                if (groupSize != 0) {
                    this.logUtil.putF(Std.string(new StringMaker().append("Group Size: ").appendint(groupSize)), this, "areAllOtherGroupsEmpty");
                    return false;
                }
            }
                index--;
            }
        }
        return true;
    }

    private function isIdInList(id : Int, excludeGroupList : BasicArrayList) : Bool {
        final size : Int = excludeGroupList.size();
        var groupInterfaceArray : haxe.ds.Vector<Group> = null;
        var groupInterface : Group = null;
        var groupId : Int = 0;
        {
            var index : Int = size - 1;
            while (index >= 0) {
            groupInterfaceArray = (cast excludeGroupList.objectArray[index] : haxe.ds.Vector<Group>);
            final size2 : Int = groupInterfaceArray.length;
            for (index2 in 0...size2) {
                groupInterface = groupInterfaceArray[index2];
                groupId = jre.lang.JavaNumber.toInt(groupInterface.getGroupId());
                if (groupId == id) {
                    return true;
                }
            }
                index--;
            }
        }
        return false;
    }

    public function areAllOtherGroupsLessThan(excludeGroupList : BasicArrayList, maxSize : Int) : Bool {
        final size : Int = this.list.size();
        {
            var index : Int = size - 1;
            while (index >= 0) {
            if (!this.isIdInList(index, excludeGroupList)) {
                var groupSize : Int = this.getGroupSizeById(index);
                if (groupSize >= maxSize) {
                    return false;
                }
            }
                index--;
            }
        }
        return true;
    }

    public function init(total : Int) : Void {
        while (this.list.size() <= total + 1) {
            this.list.add(new BasicArrayListD());
        }
    }

    public override function onEvent(eventObject : AllBinaryEventObject) : Void {
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, this);
    }

    // throws Exception
    public override function onCreateLayerManagerEvent(layerManagerEvent : LayerManagerEvent) : Void {
        final layerInterface : AllBinaryLayer = layerManagerEvent.getLayerInterface();
        final groupInterfaceArray : haxe.ds.Vector<Group> = layerInterface.getGroupInterface();
        final size : Int = groupInterfaceArray.length;
        var id : Int = 0;
        var groupList : BasicArrayList = null;
        for (index in 0...size) {
            id = jre.lang.JavaNumber.toInt(groupInterfaceArray[index].getGroupId());
            groupList = (cast this.list.objectArray[id] : BasicArrayList);
            if (groupList == null) {
                this.logUtil.putF(Std.string(new StringMaker().append("id: ").appendint(id)), this, "onCreateLayerManagerEvent");
            }
            if (!groupList.contains(layerInterface)) {
                groupList.add(layerInterface);
            } else {
            }
        }
    }

    // throws Exception
    public override function onDeleteLayerManagerEvent(layerManagerEvent : LayerManagerEvent) : Void {
        final layerInterface : AllBinaryLayer = layerManagerEvent.getLayerInterface();
        final groupInterfaceArray : haxe.ds.Vector<Group> = layerInterface.getGroupInterface();
        final size : Int = groupInterfaceArray.length;
        var id : Int = 0;
        var groupList : BasicArrayList = null;
        for (index in 0...size) {
            id = jre.lang.JavaNumber.toInt(groupInterfaceArray[index].getGroupId());
            groupList = (cast this.list.objectArray[id] : BasicArrayList);
            groupList.remove(layerInterface);
        }
    }

    public function log() : Void {
        final stringBuffer : StringMaker = new StringMaker();
        final GROUP : String = "Group: ";
        final SPACE : String = CommonSeps.getInstance().SPACE;
        final TOTAL_LABEL : String = CommonLabels.getInstance().TOTAL_LABEL;
        var size : Int = this.list.size();
        {
            var index : Int = size - 1;
            while (index >= 0) {
            final groupList : BasicArrayList = (cast this.list.objectArray[index] : BasicArrayList);
            stringBuffer.append(GROUP);
            stringBuffer.appendint(index);
            stringBuffer.append(SPACE);
            stringBuffer.append(TOTAL_LABEL);
            stringBuffer.appendint(groupList.size());
            stringBuffer.append(SPACE);
                index--;
            }
        }
        this.logUtil.putF(Std.string(stringBuffer), this, "log");
    }

}

