// Generated Code Do Not Modify
package org.allbinary.media.graphics.geography.pathfinding;

import org.allbinary.util.BasicArrayList;
import org.allbinary.logic.util.cache.BaseBasicArrayListCache;
import org.allbinary.util.BasicArrayListS;

class BasicGeographicMapExtractedPathsCacheFactory extends BaseBasicArrayListCache {
    private static final instance : BasicGeographicMapExtractedPathsCacheFactory = new BasicGeographicMapExtractedPathsCacheFactory();
    public static function getInstance() : BasicGeographicMapExtractedPathsCacheFactory {
        return BasicGeographicMapExtractedPathsCacheFactory.instance;
    }

    private var maxConcurrentPaths : Int = 0;
    private var maxPaths : Int = 0;
    public function new() {
        super();
    }

    public function init(maxConcurrentPaths : Int, maxPaths : Int) : Void {
        if (maxConcurrentPaths != this.maxConcurrentPaths) {
            {
                var index : Int = maxConcurrentPaths;
                while (index >= this.maxConcurrentPaths) {
                this.list.add(new BasicArrayListS(maxPaths));
                    index--;
                }
            }
            this.maxConcurrentPaths = maxConcurrentPaths;
        }
        this.maxPaths = maxPaths;
    }

    public function getPaths() : BasicArrayList {
        if (this.list.size() > 0) {
            return (cast this.list.removeAt(0) : BasicArrayList);
        } else {
            return new BasicArrayListS(this.maxPaths);
        }
    }

    public function release(list : BasicArrayList) : Void {
        {
            var index : Int = list.size() - 1;
            while (index >= 0) {
            BasicGeographicMapExtractedPathCacheFactory.getInstance().release((cast list.get(index) : BasicArrayList));
                index--;
            }
        }
        list.clear();
        this.list.add(list);
    }

}

