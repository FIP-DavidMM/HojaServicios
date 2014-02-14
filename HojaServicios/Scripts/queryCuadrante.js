dojo.require("esri.tasks.query");
dojo.require("esri.map");
dojo.require("esri.geometry");
dojo.require("esri.tasks.query");
dojo.require("esri.tasks.QueryTask");
dojo.require("dojo.dom");
dojo.require("dojo.on");
dojo.require("dojo.domReady!");


//Global variables
var queryTask, query, map;

function init() {
    map = new esri.Map("divMap", {
        basemap:"streets",
        center: [-73.461, 4.579],
        zoom: 6,
        slider:false
    });

    var layerCuadrantes = new esri.layers.ArcGISDynamicMapServiceLayer("http://srvsigmap.policia.gov.co/ArcGIS/rest/services/DIJIN/SIEDCO/MapServer", { opacity: .70 });
    map.addLayer(layerCuadrantes);

    dojo.connect(map, "onLoad", mapReady);
}

function mapReady(map) {

    queryTask = new esri.tasks.QueryTask("http://srvsigmap.policia.gov.co/ArcGIS/rest/services/DIJIN/SIEDCO/MapServer/14");    
    query = new esri.tasks.Query();
    query.returnGeometry = true;
    var numCuadrante = dojo.dom.byId("hfCuadrante").value;
    query.where = "NRO_CUADRANTE LIKE '" + numCuadrante + "'";
    query.outSpatialReference = new esri.SpatialReference(102100);
    query.outFields = ["OBJECTID"];
    query.text = numCuadrante;
    queryTask.execute(query, showResults);
    map.disableMapNavigation();
   
}

function showResults(results) {
    
    var featureAttributes;
    var lineStyle = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID,
        new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID,
        new dojo.Color([255, 0, 0]), 2), new dojo.Color([255, 255, 0, 0.25]));

    map.graphics.clear();
    for (var i = 0, il = results.features.length; i < il; i++) {
        featureAttributes = results.features[i].geometry;
        map.infoWindow.reposition();
        map.graphics.add(new esri.Graphic(results.features[i].geometry, lineStyle));
    }

    map.setExtent(featureAttributes.getExtent(), true);
}


dojo.ready(init);

