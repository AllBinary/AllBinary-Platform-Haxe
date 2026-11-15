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
package org.allbinary.logic.visual.transform.info;


class TransformInfoData {
    private static final instance : TransformInfoData = new TransformInfoData();
    public static function getInstance() : TransformInfoData {
        return TransformInfoData.instance;
    }

    public function new() {
    }

    public final PARENT : String = "TRANSFORM_INFO_PARENT";
    public final MAPPED : String = "TRANSFORM_INFO_MAPPED";
    public final NAME : String = "TRANSFORM_INFO_NAME";
    public final DESCRIPTION : String = "TRANSFORM_INFO_DESCRIPTION";
    public final CATEGORY : String = "TRANSFORM_INFO_CATEGORY";
    public final OBJECTFILENAME : String = "TRANSFORM_INFO_OBJECTFILENAME";
    public final OBJECT : String = "TRANSFORM_INFO_OBJECT";
    public final OBJECTCONFIGFILENAME : String = "TRANSFORM_INFO_OBJECTCONFIGFILENAME";
    public final OBJECTCONFIG : String = "TRANSFORM_INFO_OBJECTCONFIG";
    public final TEMPLATEFILENAME : String = "TRANSFORM_INFO_TEMPLATEFILENAME";
    public final TEMPLATE : String = "TRANSFORM_INFO_TEMPLATE";
    public final DATAFILENAME : String = "TRANSFORM_INFO_DATAFILENAME";
    public final DATA : String = "TRANSFORM_INFO_DATA";
    public final LABEL : String = "TRANSFORM_INFO_LABEL";
    public final OWNER : String = "OWNER_" + this.NAME;
    public final PARTIAL : String = "PARTIAL_" + this.NAME;
}

