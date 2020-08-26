import 'package:flutter/material.dart';
import 'package:fst_app_flutter/models/from_postgres/map/geometry_types/line_string.dart';

class LinearRing extends LineString {
  LinearRing({@required coordsJSON})
      : assert(coordsJSON.first['longitude'] == coordsJSON.last['longitude'] &&
            coordsJSON.first['latitude'] == coordsJSON.last['latitude'] &&
            coordsJSON.first['marker'] == 'START' &&
            coordsJSON.last['marker'] == 'END'),
        assert(coordsJSON.length >= 4),
        super(coordsJSON: coordsJSON);

  @override
  toGeoJSON() {
    return coordinates.map((e) => e.toGeoJSON()).toList();
  }

  /*
    A linear ring MUST follow the right-hand rule with respect to the
      area it bounds, i.e., exterior rings are counterclockwise, and
      holes are clockwise.
   */
}
