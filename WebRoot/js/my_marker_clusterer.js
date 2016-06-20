�������⣡����������û�ĺã���������
/** 
 * @namespace BMap������library�������BMapLib�����ռ���
 */
var BMapLib = window.BMapLib = BMapLib || {};
(function(){
    
    /**
     * ��ȡһ����չ����ͼ��Χ�����������Ҷ�����һ��������ֵ��
     * @param {Map} map BMap.Map��ʵ��������
     * @param {BMap.Bounds} bounds BMap.Bounds��ʵ��������
     * @param {Number} gridSize Ҫ���������ֵ
     *
     * @return {BMap.Bounds} ������������ͼ��Χ��
     */
    var getExtendedBounds = function(map, bounds, gridSize){
        bounds = cutBoundsInRange(bounds);
        var pixelNE = map.pointToPixel(bounds.getNorthEast());
        var pixelSW = map.pointToPixel(bounds.getSouthWest()); 
        pixelNE.x += gridSize;
        pixelNE.y -= gridSize;
        pixelSW.x -= gridSize;
        pixelSW.y += gridSize;
        var newNE = map.pixelToPoint(pixelNE);
        var newSW = map.pixelToPoint(pixelSW);
        return new BMap.Bounds(newSW, newNE);
    };

    /**
     * ���հٶȵ�ͼ֧�ֵ����緶Χ��bounds���б߽紦��
     * @param {BMap.Bounds} bounds BMap.Bounds��ʵ��������
     *
     * @return {BMap.Bounds} ���ز�Խ�����ͼ��Χ
     */
    var cutBoundsInRange = function (bounds) {
        var maxX = getRange(bounds.getNorthEast().lng, -180, 180);
        var minX = getRange(bounds.getSouthWest().lng, -180, 180);
        var maxY = getRange(bounds.getNorthEast().lat, -74, 74);
        var minY = getRange(bounds.getSouthWest().lat, -74, 74);
        return new BMap.Bounds(new BMap.Point(minX, minY), new BMap.Point(maxX, maxY));
    }; 

    /**
     * �Ե���ֵ���б߽紦��
     * @param {Number} i Ҫ�������ֵ
     * @param {Number} min �±߽�ֵ
     * @param {Number} max �ϱ߽�ֵ
     * 
     * @return {Number} ���ز�Խ�����ֵ
     */
    var getRange = function (i, mix, max) {
        mix && (i = Math.max(i, mix));
        max && (i = Math.min(i, max));
        return i;
    };

    /**
     * �жϸ����Ķ����Ƿ�Ϊ����
     * @param {Object} source Ҫ���ԵĶ���
     *
     * @return {Boolean} ��������鷵��true�����򷵻�false
     */
    var isArray = function (source) {
        return '[object Array]' === Object.prototype.toString.call(source);
    };

    /**
     * ����item��source�е�����λ��
     * @param {Object} item Ҫ���ԵĶ���
     * @param {Array} source ����
     *
     * @return {Number} ����������ڣ��������������򷵻�-1
     */
    var indexOf = function(item, source){
        var index = -1;
        if(isArray(source)){
            if (source.indexOf) {
                index = source.indexOf(item);
            } else {
                for (var i = 0, m; m = source[i]; i++) {
                    if (m === item) {
                        index = i;
                        break;
                    }
                }
            }
        }        
        return index;
    };

    /**
     *@exports MarkerClusterer as BMapLib.MarkerClusterer
     */
    var MarkerClusterer =  
        /**
         * MarkerClusterer
         * @class ����������ش�����Ҫ�ص���ͼ�ϲ���������������⣬���������
         * @constructor
         * @param {Map} map ��ͼ��һ��ʵ����
         * @param {Json Object} options ��ѡ��������ѡ�������<br />
         *    markers {Array<Marker>} Ҫ�ۺϵı������<br />
         *    girdSize {Number} �ۺϼ���ʱ��������ش�С��Ĭ��60<br />
         *    maxZoom {Number} ���ľۺϼ��𣬴��ڸü���Ͳ�������Ӧ�ľۺ�<br />
         *    minClusterSize {Number} ��С�ľۺ�������С�ڸ������Ĳ��ܳ�Ϊһ���ۺϣ�Ĭ��Ϊ2<br />
         *    isAverangeCenter {Boolean} �ۺϵ�����λ���Ƿ������оۺ����ڵ��ƽ��ֵ��Ĭ��Ϊ������ھۺ��ڵĵ�һ����<br />
         *    styles {Array<IconStyle>} �Զ���ۺϺ��ͼ������ο�TextIconOverlay��<br />
		 
		 *	pointsForHeatmap {Array<PointInHeatmap>} ��ͼ��ʹ�õĵ㣬������γ�ȡ�countֵ
         */
        BMapLib.MarkerClusterer = function(map, options){
            if (!map){
                return;
            }
            this._map = map;
            this._markers = [];
            this._clusters = [];
            
            var opts = options || {};
            this._gridSize = opts["gridSize"] || 60;
            this._maxZoom = opts["maxZoom"] || 18;
            this._minClusterSize = opts["minClusterSize"] || 2;           
            this._isAverageCenter = false;
            if (opts['isAverageCenter'] != undefined) {
                this._isAverageCenter = opts['isAverageCenter'];
            }    
            this._styles = opts["styles"] || [];
        
            var that = this;
            this._map.addEventListener("zoomend",function(){
                that._redraw();     
            });
    
            this._map.addEventListener("moveend",function(){
                 that._redraw();     
            });
   
            var mkrs = opts["markers"];
            isArray(mkrs) && this.addMarkers(mkrs);
        };

    /**
     * ���Ҫ�ۺϵı�����顣
     * @param {Array<Marker>} markers Ҫ�ۺϵı������
     *
     * @return �޷���ֵ��
     */
    MarkerClusterer.prototype.addMarkers = function(markers){
        for(var i = 0, len = markers.length; i <len ; i++){
            this._pushMarkerTo(markers[i]);
        }
        this._createClusters();   
    };

    /**
     * ��һ�������ӵ�Ҫ�ۺϵı��������
     * @param {BMap.Marker} marker Ҫ��ӵı��
     *
     * @return �޷���ֵ��
     */
    MarkerClusterer.prototype._pushMarkerTo = function(marker){
        var index = indexOf(marker, this._markers);
        if(index === -1){
            marker.isInCluster = false;
            this._markers.push(marker);//Marker�Ϸź�enableDragging�����仯������
        }
    };

    /**
     * ���һ���ۺϵı�ǡ�
     * @param {BMap.Marker} marker Ҫ�ۺϵĵ�����ǡ�
     * @return �޷���ֵ��
     */
    MarkerClusterer.prototype.addMarker = function(marker) {
        this._pushMarkerTo(marker);
        this._createClusters();
    };

    /**
     * �����������ı�ǣ������ۺϵ�
     * @return �޷���ֵ
     */
    MarkerClusterer.prototype._createClusters = function(){
        var mapBounds = this._map.getBounds();
        var extendedBounds = getExtendedBounds(this._map, mapBounds, this._gridSize);
        for(var i = 0, marker; marker = this._markers[i]; i++){
            if(!marker.isInCluster && extendedBounds.containsPoint(marker.getPosition()) ){ 
                this._addToClosestCluster(marker);
            }
        }   
    };

    /**
     * ���ݱ�ǵ�λ�ã�������ӵ�����ľۺ���
     * @param {BMap.Marker} marker Ҫ���оۺϵĵ������
     *
     * @return �޷���ֵ��
     */
    MarkerClusterer.prototype._addToClosestCluster = function (marker){
        var distance = 4000000;
        var clusterToAddTo = null;
        var position = marker.getPosition();
        for(var i = 0, cluster; cluster = this._clusters[i]; i++){
            var center = cluster.getCenter();
            if(center){
                var d = this._map.getDistance(center, marker.getPosition());
                if(d < distance){
                    distance = d;
                    clusterToAddTo = cluster;
                }
            }
        }
    
        if (clusterToAddTo && clusterToAddTo.isMarkerInClusterBounds(marker)){
            clusterToAddTo.addMarker(marker);
        } else {
            var cluster = new Cluster(this);
            cluster.addMarker(marker);            
            this._clusters.push(cluster);
        }    
    };

    /**
     * �����һ�εľۺϵĽ��
     * @return �޷���ֵ��
     */
    MarkerClusterer.prototype._clearLastClusters = function(){
        for(var i = 0, cluster; cluster = this._clusters[i]; i++){            
            cluster.remove();
        }
        this._clusters = [];//�ÿ�Cluster����
        this._removeMarkersFromCluster();//��Marker��cluster�����Ϊfalse
    };

    /**
     * ���ĳ���ۺ��е����б��
     * @return �޷���ֵ
     */
    MarkerClusterer.prototype._removeMarkersFromCluster = function(){
        for(var i = 0, marker; marker = this._markers[i]; i++){
            marker.isInCluster = false;
        }
    };
   
    /**
     * �����еı�Ǵӵ�ͼ�����
     * @return �޷���ֵ
     */
    MarkerClusterer.prototype._removeMarkersFromMap = function(){
        for(var i = 0, marker; marker = this._markers[i]; i++){
            marker.isInCluster = false;
            this._map.removeOverlay(marker);       
        }
    };

    /**
     * ɾ���������
     * @param {BMap.Marker} marker ��Ҫ��ɾ����marker
     *
     * @return {Boolean} ɾ���ɹ�����true�����򷵻�false
     */
    MarkerClusterer.prototype._removeMarker = function(marker) {
        var index = indexOf(marker, this._markers);
        if (index === -1) {
            return false;
        }
        this._map.removeOverlay(marker);
        this._markers.splice(index, 1);
        return true;
    };

    /**
     * ɾ���������
     * @param {BMap.Marker} marker ��Ҫ��ɾ����marker
     *
     * @return {Boolean} ɾ���ɹ�����true�����򷵻�false
     */
    MarkerClusterer.prototype.removeMarker = function(marker) {
        var success = this._removeMarker(marker);
        if (success) {
            this._clearLastClusters();
            this._createClusters();
        }
        return success;
    };
    
    /**
     * ɾ��һ����
     * @param {Array<BMap.Marker>} markers ��Ҫ��ɾ����marker����
     *
     * @return {Boolean} ɾ���ɹ�����true�����򷵻�false
     */
    MarkerClusterer.prototype.removeMarkers = function(markers) {
        var success = false;
        for (var i = 0; i < markers.length; i++) {
            var r = this._removeMarker(markers[i]);
            success = success || r; 
        }

        if (success) {
            this._clearLastClusters();
            this._createClusters();
        }
        return success;
    };

    /**
     * �ӵ�ͼ�ϳ���������еı��
     * @return �޷���ֵ
     */
    MarkerClusterer.prototype.clearMarkers = function() {
        this._clearLastClusters();
        this._removeMarkersFromMap();
        this._markers = [];
    };

    /**
     * �������ɣ�����ı������Ե�
     * @return �޷���ֵ
     */
    MarkerClusterer.prototype._redraw = function () {
        this._clearLastClusters();
        this._createClusters();
    };

    /**
     * ��ȡ�����С
     * @return {Number} �����С
     */
    MarkerClusterer.prototype.getGridSize = function() {
        return this._gridSize;
    };

    /**
     * ���������С
     * @param {Number} size �����С
     * @return �޷���ֵ
     */
    MarkerClusterer.prototype.setGridSize = function(size) {
        this._gridSize = size;
        this._redraw();
    };

    /**
     * ��ȡ�ۺϵ�������ż���
     * @return {Number} �ۺϵ�������ż���
     */
    MarkerClusterer.prototype.getMaxZoom = function() {
        return this._maxZoom;       
    };

    /**
     * ���þۺϵ�������ż���
     * @param {Number} maxZoom �ۺϵ�������ż���
     * @return �޷���ֵ
     */
    MarkerClusterer.prototype.setMaxZoom = function(maxZoom) {
        this._maxZoom = maxZoom;
        this._redraw();
    };

    /**
     * ��ȡ�ۺϵ���ʽ��񼯺�
     * @return {Array<IconStyle>} �ۺϵ���ʽ��񼯺�
     */
    MarkerClusterer.prototype.getStyles = function() {
        return this._styles;
    };

    /**
     * ���þۺϵ���ʽ��񼯺�
     * @param {Array<IconStyle>} styles ��ʽ�������
     * @return �޷���ֵ
     */
    MarkerClusterer.prototype.setStyles = function(styles) {
        this._styles = styles;
        this._redraw();
    };

    /**
     * ��ȡ�����ۺϵ���С������
     * @return {Number} �����ۺϵ���С������
     */
    MarkerClusterer.prototype.getMinClusterSize = function() {
        return this._minClusterSize;
    };

    /**
     * ���õ����ۺϵ���С������
     * @param {Number} size �����ۺϵ���С������
     * @return �޷���ֵ��
     */
    MarkerClusterer.prototype.setMinClusterSize = function(size) {
        this._minClusterSize = size;
        this._redraw();
    };

    /**
     * ��ȡ�����ۺϵ���ŵ��Ƿ��Ǿۺ������б�ǵ�ƽ�����ġ�
     * @return {Boolean} true��false��
     */
    MarkerClusterer.prototype.isAverageCenter = function() {
        return this._isAverageCenter;
    };

    /**
     * ��ȡ�ۺϵ�Mapʵ����
     * @return {Map} Map��ʾ����
     */
    MarkerClusterer.prototype.getMap = function() {
      return this._map;
    };

    /**
     * ��ȡ���еı�����顣
     * @return {Array<Marker>} ������顣
     */
    MarkerClusterer.prototype.getMarkers = function() {
        return this._markers;
    };

    /**
     * ��ȡ�ۺϵ���������
     * @return {Number} �ۺϵ���������
     */
    MarkerClusterer.prototype.getClustersCount = function() {
        var count = 0;
		for(var i = 0, cluster; cluster = this._clusters[i]; i++){
            cluster.isReal() && count++;     
        }
		return count;
    };

    /**
     * @ignore
     * Cluster
     * @class ��ʾһ���ۺ϶��󣬸þۺϣ�������N����ǣ���N�������ɵķ�Χ������������ʾ��Map�ϵ�TextIconOverlay�ȡ�
     * @constructor
     * @param {MarkerClusterer} markerClusterer һ����Ǿۺ���ʾ����
     */
    function Cluster(markerClusterer){
        this._markerClusterer = markerClusterer;
        this._map = markerClusterer.getMap();
        this._minClusterSize = markerClusterer.getMinClusterSize();
        this._isAverageCenter = markerClusterer.isAverageCenter();
        this._center = null;//���λ��
        this._markers = [];//���Cluster����������markers
        this._gridBounds = null;//�����ĵ�Ϊ׼�����ı�����gridSize�����صķ�Χ��Ҳ������Χ
		this._isReal = false; //����Ǹ��ۺ�
    
        this._clusterMarker = new BMapLib.TextIconOverlay(this._center, this._markers.length, {"styles":this._markerClusterer.getStyles()});
        //this._map.addOverlay(this._clusterMarker);
		this._
    }
   
    /**
     * ��þۺ����һ����ǡ�
     * @param {Marker} marker Ҫ��ӵı�ǡ�
     * @return �޷���ֵ��
     */
    Cluster.prototype.addMarker = function(marker){
        if(this.isMarkerInCluster(marker)){
            return false;
        }//Ҳ����marker.isInCluster�ж�,�����ж�OK�����������������
    
        if (!this._center){
            this._center = marker.getPosition();
			this._count = marker.count;
            this.updateGridBounds();//
        } else {
            if(this._isAverageCenter){
                var l = this._markers.length + 1;
                var lat = (this._center.lat * (l - 1) + marker.getPosition().lat) / l;
                var lng = (this._center.lng * (l - 1) + marker.getPosition().lng) / l;
				this._count = (this.count * (l - 1) + marker.count) / l;
                this._center = new BMap.Point(lng, lat);
                this.updateGridBounds();
            }//�����µ�Center
        }
    
        marker.isInCluster = true;
        this._markers.push(marker);
    
        var len = this._markers.length;
        if(len < this._minClusterSize ){     
            this._map.addOverlay(marker);
			//this.updateClusterMarker();
            return true;
        } else if (len === this._minClusterSize) {
            for (var i = 0; i < len; i++) {
                this._markers[i].getMap() && this._map.removeOverlay(this._markers[i]);
            }
			
        } 
		//������ʾcluster����ֻ����point�������count
        //this._map.addOverlay(this._clusterMarker);
		this._
		this._isReal = true;
        this.updateClusterMarker();
        return true;
    };
    
    /**
     * �ж�һ������Ƿ��ڸþۺ��С�
     * @param {Marker} marker Ҫ�жϵı�ǡ�
     * @return {Boolean} true��false��
     */
    Cluster.prototype.isMarkerInCluster= function(marker){
        if (this._markers.indexOf) {
            return this._markers.indexOf(marker) != -1;
        } else {
            for (var i = 0, m; m = this._markers[i]; i++) {
                if (m === marker) {
                    return true;
                }
            }
        }
        return false;
    };

    /**
     * �ж�һ������Ƿ��ڸþۺ�����Χ�С�
     * @param {Marker} marker Ҫ�жϵı�ǡ�
     * @return {Boolean} true��false��
     */
    Cluster.prototype.isMarkerInClusterBounds = function(marker) {
        return this._gridBounds.containsPoint(marker.getPosition());
    };
	
	Cluster.prototype.isReal = function(marker) {
        return this._isReal;
    };

    /**
     * ���¸þۺϵ�����Χ��
     * @return �޷���ֵ��
     */
    Cluster.prototype.updateGridBounds = function() {
        var bounds = new BMap.Bounds(this._center, this._center);
        this._gridBounds = getExtendedBounds(this._map, bounds, this._markerClusterer.getGridSize());
    };

    /**
     * ���¸þۺϵ���ʾ��ʽ��Ҳ��TextIconOverlay��
     * @return �޷���ֵ��
     */
    Cluster.prototype.updateClusterMarker = function () {
        if (this._map.getZoom() > this._markerClusterer.getMaxZoom()) {
            this._clusterMarker && this._map.removeOverlay(this._clusterMarker);
            for (var i = 0, marker; marker = this._markers[i]; i++) {
                this._map.addOverlay(marker);
            }
            return;
        }

        if (this._markers.length < this._minClusterSize) {
            this._clusterMarker.hide();
            return;
        }

        this._clusterMarker.setPosition(this._center);
        
        this._clusterMarker.setText(this._markers.length);

        var thatMap = this._map;
        var thatBounds = this.getBounds();
        this._clusterMarker.addEventListener("click", function(event){
            thatMap.setViewport(thatBounds);
        });

    };

    /**
     * ɾ���þۺϡ�
     * @return �޷���ֵ��
     */
    Cluster.prototype.remove = function(){
        for (var i = 0, m; m = this._markers[i]; i++) {
                this._markers[i].getMap() && this._map.removeOverlay(this._markers[i]);
        }//���ɢ�ı�ǵ�
        this._map.removeOverlay(this._clusterMarker);
        this._markers.length = 0;
        delete this._markers;
    }

    /**
     * ��ȡ�þۺ������������б�ǵ���С��Ӿ��εķ�Χ��
     * @return {BMap.Bounds} ������ķ�Χ��
     */
    Cluster.prototype.getBounds = function() {
        var bounds = new BMap.Bounds(this._center,this._center);
        for (var i = 0, marker; marker = this._markers[i]; i++) {
            bounds.extend(marker.getPosition());
        }
        return bounds;
    };

    /**
     * ��ȡ�þۺϵ���ŵ㡣
     * @return {BMap.Point} �þۺϵ���ŵ㡣
     */
    Cluster.prototype.getCenter = function() {
        return this._center;
    };

})();