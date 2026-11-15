// Generated Code Do Not Modify
package org.allbinary.android;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;

class ViewSwapper {
    public static final NULL_VIEW_ARRAY : haxe.ds.Vector<View> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    private final rootViewId : Int;
    private final activity : Activity;
    private var currentMainViewId : Int = -1;
    private var mainViewArray : haxe.ds.Vector<View> = ViewSwapper.NULL_VIEW_ARRAY;
    private var topViewArray : haxe.ds.Vector<View> = ViewSwapper.NULL_VIEW_ARRAY;
    public function new(activity : Activity, rootViewId : Int) {
        this.activity = activity;
        this.rootViewId = rootViewId;
    }

    public function setMainViews(viewArray : haxe.ds.Vector<View>) : Void {
        this.mainViewArray = viewArray;
    }

    public function setTopViewArray(topViewArray : haxe.ds.Vector<View>) : Void {
        this.topViewArray = topViewArray;
    }

    public function setMainView(id : Int) : Void {
        final viewGroup : ViewGroup = (cast this.activity.findViewById(this.rootViewId) : ViewGroup);
        if (id != this.currentMainViewId) {
            for (index in 0...this.topViewArray.length) {
                viewGroup.removeView(this.topViewArray[index]);
            }
            for (index in 0...this.mainViewArray.length) {
                if (id != this.mainViewArray[index].getId()) {
                    viewGroup.removeView(this.mainViewArray[index]);
                }
            }
            for (index in 0...this.mainViewArray.length) {
                if (id == this.mainViewArray[index].getId()) {
                    viewGroup.addView(this.mainViewArray[index]);
                    this.currentMainViewId = id;
                }
            }
            for (index in 0...this.topViewArray.length) {
                viewGroup.addView(this.topViewArray[index]);
            }
        }
    }

}

